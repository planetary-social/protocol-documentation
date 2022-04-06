---
layout: default
title: "blobs.createWants"
parent: RPC
---

# `blobs.createWants`
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
    <td>yes (3.18.1)</td>
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

### Patchwork (3.18.1)

Header:

    stream=true
    endOrError=false
    bodyType=json

Body:

    {
        "name": ["blobs", "createWants"],
        "args": [],
        "type": "source"
    }

### Manyverse (v0.2203.21-beta)

Header:

    stream=true
    endOrError=false
    bodyType=json

Body:

    {
        "name": ["blobs", "createWants"],
        "args": [],
        "type":"source"
    }

