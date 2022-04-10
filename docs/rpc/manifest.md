---
layout: default
title: "manifest"
parent: RPC
---

# `manifest`
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Description

This request seems to be used for listing supported RPC requests. The only
requests that were observed do not conform to the protocol guide.

The location of the primary documentation for this request is unknown.

## Specification

### Requests

<table>

<tr>
    <td>
        Name
    </td>
    <td>
        <pre>"manifest"</pre>
        <p>
            <em>
                Warning! Name is a string and not a list of strings which is
                incorrect according to the protocol guide.
            </em>
        </p>
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
    <td class="version malformed">
        <div class="number">
            v0.2.1
        </div>
        <div class="note">
            Yes, malformed, invalid <code>name</code>. See <a href="https://github.com/cryptoscope/go-muxrpc/issues/9">cryptoscope/go-muxrpc#9</a>.
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

#### go-ssb 

{% include malformed_warning.html %}

{% capture body %}
{
    "name": "manifest",
    "args": [],
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
