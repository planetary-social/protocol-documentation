---
layout: default
title: "tunnel.isRoom"
parent: RPC
---

# `tunnel.IsRoom`
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Description

This request seems to be related to the rooms specification. The only requests
that were observed do not conform to the protocol guide.

The location of the primary documentation for this request is unknown.

## Specification

### Requests

<table>

<tr>
    <td>
        Name
    </td>
    <td>
        <pre>["tunnel", "isRoom"]</pre>
    </td>
</tr>

<tr>
    <td>
        Type
    </td>
    <td>
        Type is not set which is incorrect according to the protocol guide.
    </td>
</tr>

<tr>
    <td>
        Args
    </td>
    <td>
        All observed examples contained an empty array.
    </td>
</tr>

</table>


### Responses

Unknown.

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
    <td class="version no">
        <div class="number">
            v0.2.1
        </div>
        <div class="note">
            No.
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
    <td class="version malformed">
        <div class="number">
            3.18.1
        </div>
        <div class="note">
            Yes, malformed, doesn't set the <code>type</code>.
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
    <td class="version no">
        <div class="number">
            v0.2203.21-beta
        </div>
        <div class="note">
            No.
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

#### Patchwork

{% include malformed_warning.html %}

{% capture body %}
{
    "name": ["tunnel", "isRoom"],
    "args": []
} 
{% endcapture %}

{% include rpc_message.html
    variant="left"
    request_number="1"
    stream="false"
    end_err="false"
    body_type="JSON"
    client_name="Patchwork"
    client_version="3.18.1"
    body=body
%}
