---
layout: default
title: "gossip.ping"
parent: RPC
---

# `gossip.ping`
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Description

This request is most likely used to keep the underlying connection alive.

The location of the primary documentation for this request is unknown.

## Specification

### Requests

<table>

<tr>
    <td>
        Name
    </td>
    <td>
        <pre>["gossip", "ping"]</pre>
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
        Seems to be an array containing exactly one object.
    </td>
</tr>

</table>


#### Args

The object within the `args` array seems to have the following schema:

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
            <pre>timeout</pre>
        </td>
        <td>
            <pre>true</pre>
        </td>
        <td>
            <pre>number</pre>
        </td>
        <td>
            <p>
                No details are known.
            </p>
        </td>
    </tr>
</table>

### Follow-up requests

Follow up requests seem to be a JSON number.

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

### Manyverse

{% capture body %}
{
    "name": ["gossip", "ping"],
    "args": [
        {
            "timeout":300000
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

### Follow-up requests

### Manyverse

{% capture body %}
1648840049081 
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
