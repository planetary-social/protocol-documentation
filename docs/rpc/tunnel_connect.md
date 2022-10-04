---
layout: default
parent: RPC
---

# `["tunnel", "connect"]`
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Description

This request is related to the rooms specification. It allows peers to create a
tunnel used for communication using a third peer which acts as a relay. 

The location of the primary documentation for this request is unknown.

## Specification

### Requests

<table>

<tr>
    <td>
        Name
    </td>
    <td>
        <pre>["tunnel", "connect"]</pre>
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
            <pre>portal</pre>
        </td>
        <td>
            <pre>true</pre>
        </td>
        <td>
            <pre>string</pre>
        </td>
        <td>
            <p>
                Id of the relay server. All observed requests used the at-sign
                format.
            </p>

            <p>
                Set when a peer connects to a relay server.
            </p>

            <p>
                Set when a relay server connects to a target peer.
            </p>
        </td>
    </tr>

    <tr>
        <td>
            <pre>target</pre>
        </td>
        <td>
            <pre>true</pre>
        </td>
        <td>
            <pre>string</pre>
        </td>
        <td>
            <p>
                Id of the target peer. All observed requests used the at-sign
                format.
            </p>

            <p>
                Set when a peer connects to a relay server.
            </p>

            <p>
                Set when a relay server connects to a target peer.
            </p>
        </td>
    </tr>

    <tr>
        <td>
            <pre>origin</pre>
        </td>
        <td>
            <pre>false</pre>
        </td>
        <td>
            <pre>string</pre>
        </td>
        <td>
            <p>
                Id of the peer which asked for the tunnel to be
                created. All observed requests used the at-sign
                format. 
            </p>

            <p>
                Set when a relay server connects to a target peer.
            </p>
        </td>
    </tr>

</table>

Notes:

- When a peer connects to a relay server two arguments are set `portal` and `target`.
- When a relay server connects to a target peer three arguments are set `portal` , `target` and `origin`.

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

Unknown.
