---
layout: default
title: RPC
nav_order: 2
has_children: true
permalink: /rpc
---

# RPC

A list of known RPC messages.
{: .fs-6 .fw-300 }

## Vocabulary

This documentation refers to the side sending the initial request as the
client. The side receiving the initial request is called a server. Therefore
for example a phrase "server termination" refers to messages sent by the server
in order to terminate a stream initiated by an incoming request made by the
client.

Note that the word client used in this documentation can refer to two things:
- Any program implementing the Secure Scuttlebutt protocol.
- A side of a Secure Scuttlebutt RPC connection which initiates a particular
  stream by performing an RPC request.

## Support tables

Support tables document whether the particular client ever sends the specific
request ("Sends") and if the particular client responds to the specific request
("Accepts").

Support tables are only meant to cover the latest release of each client. It is
unrealistic to create support tables covering every single version of each
client. Therefore the support tables can only give you a general idea of
support for particular messages and will likely be out of date. Refer to the
list of releases linked below.

<table>
<tr>
    <th>
        Client or library name
    </th>
    <th>
        List of releases
    </th>
</tr>

<tr>
    <td>
        Patchwork
    </td>
    <td>
        <a href="https://github.com/ssbc/patchwork/releases">
            https://github.com/ssbc/patchwork/releases
        </a>
    </td>
</tr>

<tr>
    <td>
        Manyverse
    </td>
    <td>
        <a href="https://gitlab.com/staltz/manyverse/-/tags">
            https://gitlab.com/staltz/manyverse/-/tags
        </a>
    </td>
</tr>

<tr>
    <td>
        go-ssb
    </td>
    <td>
        <a href="https://github.com/cryptoscope/ssb/tags">
            https://github.com/cryptoscope/ssb/tags
        </a>
    </td>
</tr>

</table>
