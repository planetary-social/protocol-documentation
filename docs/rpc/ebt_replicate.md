---
layout: default
parent: RPC
---

# `["ebt", "replicate"]`
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Description

This request is used as a new replication mechanism. This is a duplex request
which should be initiated by the client which initiates the connection.

The location of the primary documentation for this request is unknown.

## Specification

### Requests

<table>

<tr>
    <td>
        Name
    </td>
    <td>
        <pre>["ebt", "replicate"]</pre>
    </td>
</tr>

<tr>
    <td>
        Type
    </td>
    <td>
        <pre>"duplex"</pre>
    </td>
</tr>

<tr>
    <td>
        Args
    </td>
    <td>
        Seems to be an array with one element.
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

#### Manyverse

{% capture body %}
{
    "name": ["ebt", "replicate"],
    "args": [
        {
            "version": 3,
            "format": "classic"
        }
    ],
    "type": "duplex"
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

### Client terminations

#### Manyverse

{% capture body %}
{}
{% endcapture %}

{% include rpc_message.html
    variant="right"
    request_number="1"
    stream="true"
    end_err="true"
    body_type="JSON"
    client_name="Manyverse"
    client_version="v0.2203.21-beta"
    body=body
%}
