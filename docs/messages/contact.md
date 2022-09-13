---
layout: default
parent: Message contents
---

# Contact
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Description

Contact messages are one of the main concepts within the Secure Scuttlebutt
ecosystem. Each contact message describes a connection in the social graph.

See [the section about following feeds in the protocol guide][protocol-guide-following].

## Specification

The contact message is a JSON object with the fields described in the following
table.

<table>

<tr>
    <th>
        Field
    </th>
    <th>
        Description
    </th>
</tr>

<tr>
    <td>
        <pre>type</pre>
    </td>
    <td>
        A string always set to <code>"contact"</code>.
    </td>
</tr>

<tr>
    <td>
        <pre>contact</pre>
    </td>
    <td>
        A string which must be set to the id of the feed in the at-sign feed id
        format.
    </td>
</tr>

<tr>
    <td>
        <pre>following</pre>
    </td>
    <td>
        <p>
            Boolean. Optional. If it is set then it must be set to
            <code>true</code> or <code>false</code>. If it is not set then it
            should be ommited and it should not be set to <code>null</code>.
        </p>

        <p>
            If set to <code>true</code> specifies that this contact is now
            being followed.
        </p>

        <p>
            If set to <code>false</code> specifies that this contact is no
            longer being followed.
        </p>
    </td>
</tr>

<tr>
    <td>
        <pre>blocking</pre>
    </td>
    <td>
        <p>
            Boolean. Optional. If it is set then it must be set to
            <code>true</code> or <code>false</code>. If it is not set then it
            should be ommited and it should not be set to <code>null</code>.
        </p>

        <p>
            If set to <code>true</code> specifies that this contact is now
            being blocked.
        </p>

        <p>
            If set to <code>false</code> specifies that this contact is no
            longer being blocked.
        </p>
    </td>
</tr>

<tr>
    <td>
        <pre>pub</pre>
    </td>
    <td>
        <em>
            Work in progress...
        </em>
    </td>
</tr>

</table>

Notes:

- Either `following` or `blocking` must be set. Messages without `following` or
  `blocking` set are invalid.
- Both `following` and `blocking` may be set but certain combinations of them
  don't make much sense.
- Malformed messages which use strings `"true"` and `"false"` instead of
  booleans in `following` and `blocking` fields exist in the wild. They should
  be treated as invalid and disregarded.

## Interpretation

Each contact message specifies a set of operations which should be perfomed on
a contact object in order to update it. The following operations exist:
- *follow*
- *unfollow*
- *block*
- *unblock*

The field `following` determines if a contact message carries the *follow* or
*unfollow* operations. The field `blocking` determines if a contact message
carries the *block* or *unblock* operations.

The following table explains how to interpret various values of `following` and
`blocking` fields to build a list of operations to perform:

<table>

<tr>
    <th>
        Value of the <pre>following</pre> field
    </th>
    <th>
        Value of the <pre>blocking</pre> field
    </th>
    <th>
        <pre>Interpretation</pre>
    </th>
</tr>

<tr>
    <td>
        <code>null</code> or not set
    </td>
    <td>
        <code>null</code> or not set
    </td>
    <td>
        The message is invalid. It doesn't specify any operations.
    </td>
</tr>

<tr>
    <td>
        <code>true</code> 
    </td>
    <td>
        <code>null</code> or not set
    </td>
    <td>
        Operations:
        <ul>
            <li><em>follow</em></li>
        </ul>
    </td>
</tr>

<tr>
    <td>
        <code>false</code> 
    </td>
    <td>
        <code>null</code> or not set
    </td>
    <td>
        Operations:
        <ul>
            <li><em>unfollow</em></li>
        </ul>
    </td>
</tr>

<tr>
    <td>
        <code>null</code> or not set
    </td>
    <td>
        <code>true</code> 
    </td>
    <td>
        Operations:
        <ul>
            <li><em>block</em></li>
        </ul>
    </td>
</tr>

<tr>
    <td>
        <code>null</code> or not set
    </td>
    <td>
        <code>false</code> 
    </td>
    <td>
        Operations:
        <ul>
            <li><em>unblock</em></li>
        </ul>
    </td>
</tr>

<tr>
    <td>
        <code>true</code>
    </td>
    <td>
        <code>true</code> 
    </td>
    <td>
        Operations:
        <ul>
            <li><em>follow</em></li>
            <li><em>block</em></li>
        </ul>

        <p>
            <em>
                Note: this makes little sense logically as it is unclear why
                you would want to follow and block someone in one step but it
                is possible to process this message therefore it is
                theoretically valid.
            </em>
        </p>
    </td>
</tr>

<tr>
    <td>
        <code>false</code>
    </td>
    <td>
        <code>false</code> 
    </td>
    <td>
        Operations:
        <ul>
            <li><em>unfollow</em></li>
            <li><em>unblock</em></li>
        </ul>
    </td>
</tr>

</table>

In practice the contact data stored by Secure Scuttlebutt clients for a tuple
of `(author, contact)` can be imagined as an object with two fields:
- a boolean field which describes if a user is being followed
- a boolean fields which describes if a user is being blocked

This is very similar to the contact messages themselves. Initially both fields
are `false`. The *follow* and *block* operations set the fields to `true`. The
*unfollow* and *unblock* operations set the fields to `false`. In order to
build the contact information pertaining to a specific `(author, contact)` pair
all contact messages for this pair must be processed in order. Whenever a
contact message is encountered the following steps need to be taken:
- if the contact message contains the `follow` action then the contact is marked
  as being followed 
- if the contact message contains the `unfollow` action then the contact is no
  longer marked as followed
- if the contact message contains the `block` action then the contact is marked
  as blocked
- if the contact message contains the `unblock` action then the contact is no
  longer marked as blocked

The social graph information is usually constructed in the following way:
- when walking the graph the edges are traversed only if they are marked as
  being followed but not as being blocked
- if the specific feed is marked as blocked by the local feed (hops == 0) then
  any edges pointing to it are never traversed

*Note: this implies that for any feed other than the local feed (hops == 0)
blocking is simply equivalent to unfollowing for the purpose of the social
graph construction. That information can however be presented differently in
user interfaces.*

## Examples

### Following

The following message describes that a user was followed.

```
{
    "type": "contact",
    "contact": "@sxlUkN7dW/qZ23Wid6J1IAnqWEJ3V13dT6TaFtn5LTc=.ed25519",
    "following": true
}
```

### Unfollowing

The following message describes that a user is no longer being followed.

```
{
    "type": "contact",
    "contact": "@sxlUkN7dW/qZ23Wid6J1IAnqWEJ3V13dT6TaFtn5LTc=.ed25519",
    "following": false
}
```

### Blocking

The following message describes that a user was blocked.

```
{
    "type": "contact",
    "contact": "@sxlUkN7dW/qZ23Wid6J1IAnqWEJ3V13dT6TaFtn5LTc=.ed25519",
    "blocking": true
}
```

### Unblocking

The following message describes that a user is no longer being blocked.

```
{
    "type": "contact",
    "contact": "@sxlUkN7dW/qZ23Wid6J1IAnqWEJ3V13dT6TaFtn5LTc=.ed25519",
    "blocking": false
}
```

### Unfollowing and unblocking

The following message describes that a user is no longer being blocked and
followed.

```
{
    "type": "contact",
    "contact": "@sxlUkN7dW/qZ23Wid6J1IAnqWEJ3V13dT6TaFtn5LTc=.ed25519",
    "following": false,
    "blocking": false
}
```

## See also

- [About - scuttlebot.io][about-scuttlebot]
- [About - patchfox.org][about-patchfox]
- [Feeds - Scuttlebutt Protocol Guide][protocol-guide-following]

[about-scuttlebot]: https://scuttlebot.io/docs/message-types/about.html
[about-patchfox]: https://patchfox.org/#/message_types/about
[protocol-guide-following]: https://ssbc.github.io/scuttlebutt-protocol-guide/#following
