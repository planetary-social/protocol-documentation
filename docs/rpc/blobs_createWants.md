---
layout: default
parent: RPC
---

# `["blobs", "createWants"]`
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Description

This request is related to replicating blobs.

The primary documentation for this request is [the Scuttlebutt Protocol Guide][protocol-guide].

## Specification

### Requests

<table>

<tr>
    <td>
        Name
    </td>
    <td>
        <pre>["blobs", "createWants"]</pre>
    </td>
</tr>

<tr>
    <td>
        Type
    </td>
    <td>
        <pre>"source"</pre>
    </td>
</tr>

<tr>
    <td>
        Args
    </td>
    <td>
        Seems to be an empty array.
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
    <td class="version yes">
        <div class="number">
            3.18.1
        </div>
        <div class="note">
            Yes.
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
    <td class="version yes">
        <div class="number">
            v0.2203.21-beta
        </div>
        <div class="note">
            Yes.
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
    "name ": ["blobs", "createWants"],
    "args": [],
    "type": "source"
}
{% endcapture %}

{% include rpc_message.html
    variant="left"
    request_number="1"
    stream="true"
    end_err="false"
    body_type="JSON"
    client_name="go-ssb"
    client_version="v0.2.1"
    body=body
%}

#### Patchwork

{% capture body %}
{
    "name": ["blobs", "createWants"],
    "args": [],
    "type": "source"
}
{% endcapture %}

{% include rpc_message.html
    variant="left"
    request_number="1"
    stream="true"
    end_err="false"
    body_type="JSON"
    client_name="Patchwork"
    client_version="3.18.1"
    body=body
%}

#### Manyverse 

{% capture body %}
{
    "name": ["blobs", "createWants"],
    "args": [],
    "type": "source"
}
{% endcapture %}

{% include rpc_message.html
    variant="left"
    request_number="1"
    stream="true"
    end_err="false"
    body_type="JSON"
    client_name="Manyverse"
    client_version="v0.2203.21-beta"
    body=body
%}

[protocol-guide]: https://ssbc.github.io/scuttlebutt-protocol-guide/
