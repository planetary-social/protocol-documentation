---
layout: default
parent: RPC
---

# `["blobs", "get"]`
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Description

This request can be used to download a blob.

The primary documentation for this request is [the Scuttlebutt Protocol Guide][protocol-guide].

## Specification

### Requests

<table>

<tr>
    <td>
        Name
    </td>
    <td>
        <pre>["blobs", "get"]</pre>
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
        Must be an array containing exactly one string. The string is a blob
        ref in ampersand-notation.
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

Not captured.

#### Patchwork

Not captured.

#### Manyverse 

Not captured.

[protocol-guide]: https://ssbc.github.io/scuttlebutt-protocol-guide/
