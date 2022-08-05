---
layout: default
title: Replication
nav_order: 3
has_children: true
permalink: /replication
---

# Replication

Description of various Secure Scuttlebutt replication mechanisms.
{: .fs-6 .fw-300 }

Two separate replication mechanisms exist within the Secure Scuttlebutt
ecosystem.

The older mechanism relies on the `createHistoryStream` RPC requests and is
sometimes referred to as "legacy" replication. This mechanism is described in
the [Scuttlebutt Protocol Guide][guide-create-history-stream] and has several
downsides; the main downside being the high overhead associated with
establishing separate RPC request streams for every single feed which needs to
be replicated on every new connection with a peer. This leads to peers handling
tens of thousands of separate request streams when connecting to eg. large
pubs.

The newer mechanism is usually referred to as Epidemic Broadcast Trees (or
"EBT" for short) and is documented in the [Epidemic Broadcast Trees
section](./ebt.html) of this documentation.

[guide-create-history-stream]: https://ssbc.github.io/scuttlebutt-protocol-guide/#createHistoryStream
