---
layout: default
title: "tunnel.isRoom"
parent: RPC
nav_order: 1
---

# `tunnel.IsRoom`
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

**Warning! This request is malformed and does not follow the protocol guide!**

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
    <td>unknown</td>
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

    stream=false
    endOrError=false
    bodyType=json

Body:

    {
        "name": ["tunnel", "isRoom"],
        "args": []
    } 
