---
layout: default
title: "ebt.replicate"
parent: RPC
---

# `ebt.replicate`
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

    stream=true
    endOrError=false
    bodyType=json

Body:

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

## Client termination example

### Manyverse (v0.2203.21-beta)

Header:

    stream=true
    endOrError=true
    bodyType=json

Body:

    {}

