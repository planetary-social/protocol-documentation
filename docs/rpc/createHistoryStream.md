---
layout: default
title: "createHistoryStream"
parent: RPC
---

# `createHistoryStream`
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
    <td>unknown</td>
</tr>

<tr>
    <td>Accepts</td>
    <td>unknown</td>
    <td>yes (3.18.1)</td>
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
        "name": ["createHistoryStream"],
        "args": [
            {
                "id": "@qFtLJ6P5Eh9vKxnj7Rsh8SkE6B6Z36DVLP7ZOKNeQ/Y=.ed25519",
                "seq": 79,
                "live": true,
                "keys": false,
            }
        ],
        "type": "source"
    }


## Server termination example

### Manyverse (v0.2203.21-beta)

Header:

    stream=true
    endOrError=true
    bodyType=json

Body:

    true
