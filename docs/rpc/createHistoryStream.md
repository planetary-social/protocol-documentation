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
    <td>yes (v0.2.1)</td>
    <td>yes (3.18.1)</td>
    <td>unknown</td>
</tr>

<tr>
    <td>Accepts</td>
    <td>yes (v0.2.1)</td>
    <td>yes (3.18.1)</td>
    <td>unknown</td>
</tr>

</table>

## Request example

### go-ssb (v0.2.1)

Header:

    stream=true
    endOrError=false
    bodyType=json

Body:

    {
        "name": ["createHistoryStream"],
        "args": [
            {
                "keys": false,
                "limit": -1,
                "id": "@CIlwTOK+m6v1hT2zUVOCJvvZq7KE/65ErN6yA2yrURY=.ed25519",
                "seq": 1
            }
        ],
        "type": "source"
    }

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
