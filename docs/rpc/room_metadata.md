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
    <td>unknown</td>
    <td>unknown</td>
    <td>yes (v0.2203.21-beta)</td>
</tr>

<tr>
    <td>Accepts</td>
    <td>unknown</td>
    <td>unknown</td>
    <td>unknown</td>
</tr>

</table>

## Request example

### Manyverse (v0.2203.21-beta)

Header:

    stream=false
    endOrError=false
    bodyType=json

Body:

    {
        "name": ["room", "metadata"],
        "args":[]
    }


