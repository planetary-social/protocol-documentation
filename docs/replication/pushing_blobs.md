---
layout: default
parent: Replication
---

# Pushing Blobs

Description of the concept of pushing blobs to peers.
{: .fs-6 .fw-300 }

Some peers, especially pubs, don't automatically request blobs which are
referenced by messages they replicated. This is problematic as initially only
the author of a message referencing a blob will have that blob.

The goal of blob pushing is to encourage connected peers to replicate blobs
before their author goes offline. This is usually done only for the blobs that
are referenced by messages from the feed of the peer performing blob pushing.

1. TOC
{:toc}

## Technical description

Blob pushing uses the [want and have mechanism][guide-want-and-have] to
effectively trick connected peers into replicating a blob.

In this scenario _peer Alice_ wishes to push a blob to _peer Bob_. In order to
do so _peer Alice_ sends a "want" with distance set to `-1` to _peer Bob_. This
makes _peer Bob_ ask all their connected peers for this blob and replicate it
in order to give it to _peer Alice_. If _peer Bob_ uses a naive implementation
of the blob replication mechanism he will ask _peer Alice_ for the blob that
she herself asked for. This makes _peer Alice_ send the blob to _peer Bob_.

## Other resources

- [Reference implementation][reference-implementation]

[guide-want-and-have]: https://ssbc.github.io/scuttlebutt-protocol-guide/#want-and-have
[reference-implementation]: https://github.com/ssbc/ssb-blobs
