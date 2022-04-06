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
    <td>yes (v0.2.1)</td>
    <td>no (3.18.1)</td>
    <td>no (v0.2203.21-beta)</td>
</tr>

<tr>
    <td>Accepts</td>
    <td>unknown</td>
    <td>unknown</td>
    <td>unknown</td>
</tr>

</table>

## Request example

### go-ssb (v0.2.1)

Header:

    stream=false
    endOrError=false
    bodyType=json

Body:

    {
        "name": "manifest",
        "args": [],
        "type": "async"
    }

## Response example

Unknown.
