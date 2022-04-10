---
layout: default
parent: RPC
---

# `["room", "metadata"]`
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Description

This request is related to the rooms specification.

The primary documentation for this request is [the SSB Rooms 2.0 specification][rooms-specification-link-to-room-metadata].

## Specification

### Requests

<table>

<tr>
    <td>
        Name
    </td>
    <td>
        <pre>["room", "metadata"]</pre>
    </td>
</tr>

<tr>
    <td>
        Type
    </td>
    <td>
        <pre>"async"</pre>
        <p>
            <em>
                Warning: some clients incorrectly don't set the type. Check the
                support table.
            </em>
        </p>
    </td>
</tr>

<tr>
    <td>
        Args
    </td>
    <td>
        Must be an empty array.
    </td>
</tr>

</table>


### Responses

As described [in the SSB Rooms 2.0
specification][rooms-specification-link-to-room-metadata].

## Support table

<table class="support-table">
<tr>
    <th></th>
    <th>Sends</th>
    <th>Accepts</th>
</tr>

<tr>
    <td>
        go-ssb
    </td>
    <td class="version yes">
        <div class="number">
            v0.2.1
        </div>
        <div class="note">
            Yes.
        </div>
    </td>
    <td class="version unknown">
        <div class="number">
            v0.2.1
        </div>
        <div class="note">
            Unknown.
        </div>
    </td>
</tr>

<tr>
    <td>
        Patchwork
    </td>
    <td class="version no">
        <div class="number">
            3.18.1
        </div>
        <div class="note">
            No.
        </div>
    </td>
    <td class="version unknown">
        <div class="number">
            3.18.1
        </div>
        <div class="note">
            Unknown.
        </div>
    </td>
</tr>

<tr>
    <td>
        Manyverse
    </td>
    <td class="version malformed">
        <div class="number">
            v0.2203.21-beta
        </div>
        <div class="note">
            Yes, malformed, doesn't set the <code>type</code>. See <a href="https://gitlab.com/staltz/manyverse/-/issues/1846">staltz/manyverse#1846</a>.
        </div>
    </td>
    <td class="version unknown">
        <div class="number">
            v0.2203.21-beta
        </div>
        <div class="note">
            Unknown.
        </div>
    </td>
</tr>

</table>

## Examples

### Requests

#### go-ssb

{% capture body %}
{
    "name": ["room", "metadata"],
    "args":[],
    "type": "async"
}
{% endcapture %}

{% include rpc_message.html
    variant="left"
    request_number="1"
    stream="false"
    end_err="false"
    body_type="JSON"
    client_name="go-ssb"
    client_version="v0.2.1"
    body=body
%}

#### Manyverse

{% include malformed_warning.html %}

{% capture body %}
{
    "name": ["room", "metadata"],
    "args":[]
}
{% endcapture %}

{% include rpc_message.html
    variant="left"
    request_number="1"
    stream="false"
    end_err="false"
    body_type="JSON"
    client_name="Manyverse"
    client_version="v0.2203.21-beta"
    body=body
%}

[rooms-specification-link-to-room-metadata]: https://github.com/ssb-ngi-pointer/rooms2/blob/main/docs/Participation/Metadata.md
