---
layout: default
title: "room.metadata"
parent: RPC
---

# `room.metadata`
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Support table

<table>
<tr>
    <th></th>
    <th>go-ssb</th>
    <th>Patchwork</th>
    <th>Manyverse</th>
</tr>

<tr>
    <td>Sends</td>
    <td>yes (v0.2.1)</td>
    <td>unknown</td>
    <td class="bg-red-000">yes, violates protocol (v0.2203.21-beta)</td>
</tr>

<tr>
    <td>Accepts</td>
    <td>unknown</td>
    <td>unknown</td>
    <td>unknown</td>
</tr>

</table>

## Request example

## go-ssb (v0.2.1)

Header:

    stream=false
    endOrError=false
    bodyType=json

Body:

    {
        "name": ["room", "metadata"],
        "args":[],
        "type": "async"
    }

### Manyverse (v0.2203.21-beta)

**Warning! This request is malformed and does not follow the protocol guide!**

Header:

    stream=false
    endOrError=false
    bodyType=json

Body:

    {
        "name": ["room", "metadata"],
        "args":[]
    }
