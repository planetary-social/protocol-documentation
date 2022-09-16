---
layout: default
parent: RPC
---

# `["invite", "use"]`
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Description

This request is related to redeeming pub invites.

The primary documentation for this request is [the Scuttlebutt Protocol Guide][protocol-guide].

## Specification

### Requests

<table>

<tr>
    <td>
        Name
    </td>
    <td>
        <pre>["invite", "use"]</pre>
    </td>
</tr>

<tr>
    <td>
        Type
    </td>
    <td>
        <pre>"async"</pre>
    </td>
</tr>

<tr>
    <td>
        Args
    </td>
    <td>
        Must be an array containing exactly one object.
    </td>
</tr>

</table>

#### Args

The object within the `args` array must have the following schema:

<table>
    <tr>
        <th> 
            Field name
        </th>
        <th> 
            Required
        </th>
        <th> 
            Type
        </th>
        <th> 
            Description
        </th>
    </tr>

    <tr>
        <td>
            <pre>feed</pre>
        </td>
        <td>
            <pre>true</pre>
        </td>
        <td>
            <pre>string</pre>
        </td>
        <td>
            <p>
                Id of the feed in the at-sign feed id format.
            </p>
        </td>
    </tr>
</table>

### Responses

The response is a JSON object which describes the follow message which the pub
published in its feed. The response must have the following schema:

<table>
    <tr>
        <th> 
            Field name
        </th>
        <th> 
            Required
        </th>
        <th> 
            Type
        </th>
        <th> 
            Description
        </th>
    </tr>

    <tr>
        <td>
            <pre>key</pre>
        </td>
        <td>
            <pre>true</pre>
        </td>
        <td>
            <pre>string</pre>
        </td>
        <td>
            <p>
                Id of the message in the percent-sign message id format.
            </p>
        </td>
    </tr>

    <tr>
        <td>
            <pre>value</pre>
        </td>
        <td>
            <pre>true</pre>
        </td>
        <td>
            <pre>object</pre>
        </td>
        <td>
            <p>
                JSON object which is the raw message which the pub published to
                its feed.
            </p>

            <p>
                <em>
                    Note: it is unclear what happens for feed formats other
                    than the default feed format.
                </em>
            </p>
        </td>
    </tr>
</table>

Notes:

- This response format is similar to the format which is used in responses to
  [`["createHistoryStream"]`](./createHistoryStream.html) requests.

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
    <td class="version unknown">
        <div class="number">
            v0.2.1
        </div>
        <div class="note">
            Unknown.
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
    <td class="version unknown">
        <div class="number">
            3.18.1
        </div>
        <div class="note">
            Unknown.
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
    <td class="version unknown">
        <div class="number">
            v0.2203.21-beta
        </div>
        <div class="note">
            Unknown.
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

Unknown.

#### Patchwork

Unknown.

#### Manyverse 

Unknown.

[protocol-guide]: https://ssbc.github.io/scuttlebutt-protocol-guide/
