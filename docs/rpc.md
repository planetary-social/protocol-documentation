---
layout: default
title: "RPC"
nav_order: 2
---

# RPC

This document attempts to document known Secure Scuttlebutt RPC messages. I
wrote down the headers for each message as well in case we find examples in
which clients set the flags incorrectly. I also tried to put termination
examples in this document as various clients send various bodies in them.

## `tunnel.isRoom`

**Warning! This request is malformed and does not follow the protocol guide!**

### Support table

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

### Request example

#### Patchwork (3.18.1)

Header:

    stream=false
    endOrError=false
    bodyType=json

Body:

    {
        "name": ["tunnel", "isRoom"],
        "args": []
    } 

## `room.metadata`

### Support table

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

### Request example

#### Manyverse (v0.2203.21-beta)

Header:

    stream=false
    endOrError=false
    bodyType=json

Body:

    {
        "name": ["room", "metadata"],
        "args":[]
    }


## `blobs.createWants`

### Support table

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

### Request example

#### Patchwork

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

#### Manyverse

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

## `blobs.changes`

### Support table

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

### Request example

#### Manyverse

Header:

    stream=true
    endOrError=false
    bodyType=json

Body: 

    {
        "name": ["blobs", "changes"],
        "args": [],
        "type": "source"
    }

## `createHistoryStream`

### Support table

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

### Request example

#### Patchwork (3.18.1)

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


### Server termination example

#### Manyverse (v0.2203.21-beta)

Header:

    stream=true
    endOrError=true
    bodyType=json

Body:

    true

## `ebt.replicate`

### Support table

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

### Request example

#### Manyverse (v0.2203.21-beta)

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

### Client termination example

#### Manyverse (v0.2203.21-beta)

Header:

    stream=true
    endOrError=true
    bodyType=json

Body:

    {}

## `gossip.ping`

### Support table

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

### Request example

#### Manyverse (v0.2203.21-beta)

Header:

    stream=true
    endOrError=false
    bodyType=json

Body:

    {
        "name": ["gossip", "ping"],
        "args": [
            {
                "timeout":300000
            }
        ],
        "type": "duplex"
    }

### Follow-up request example

#### Manyverse (v0.2203.21-beta)

Header:

    stream=true
    endOrError=false
    bodyType=json

Body:

    1648840049081 

## `manifest`

**Warning! This request is malformed and does not follow the protocol guide!**

### Support table

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

### Request example

#### go-ssb (v0.2.1)

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

### Response example

Unknown.
