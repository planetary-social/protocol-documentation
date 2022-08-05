---
layout: default
parent: Replication
---

# Epidemic Broadcast Trees

Documentation of the EBT replication mechanism. 
{: .fs-6 .fw-300 }

The goal of the EBT mechanism is to provide a more efficient replication
mechanism which could serve as a replacement of the `createHistoryStream`-based
replication.

There exists [a reference implementation][reference-implementation] of this
mechanism however no official documentation is available. This is an attempt at
documenting the observed behaviour of this mechanism.

1. TOC
{:toc}

## Nomenclature

### Peer connections

For each Secure Scuttlebutt [peer connection][guide-peer-connections] we can
differentiate two actors:

- a *client* which initiates the connection
- a *server* which accepts the connection

Those two sides of every Secure Scuttlebutt peer connection will be referred to
as *client* and *server* respectively.

### RPC layer

For each Secure Scuttlebutt [RPC stream][guide-rpc-protocol] we can
differentiate two actors:

- a *requestor* which sends the initial request opening the stream
- a *responder* which receives the initial request to open the stream

Those two sides of every RPC request exchange will be referred to as
*requestor* and *responder* respectively. Note that in the case of duplex
streams both *requestor* and *responder* freely exchange messages after an RPC
stream is established.

## Creating an EBT session

An *EBT session* is a duplex RPC stream which is established between two peers
after they successfuly connect. The *EBT session* is established by sending an
[`["ebt", "replicate"]`][ebt-replicate] request between the two peers. Since
this is a duplex stream only one of those streams is needed for each
connection.

After a connection between two peers is established the *client* is responsible
for opening an *EBT session* by sending an [`["ebt",
"replicate"]`][ebt-replicate] request to the *server*:

{% capture body %}
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
{% endcapture %}

{% include rpc_message.html
    variant="left"
    request_number="1"
    stream="true"
    end_err="false"
    body_type="JSON"
    body=body
%}

Therefore the *client* acts as a *requestor* and the *server* acts as a
*responder* in this scenario.

The *requestor* sets the `version` argument to `3` and the `format` argument to
`"classic"`. The *responder* validates the arguments ensuring that the
`version` argument is set to `3` and the `format` argument is set to
`"classic"`. If the arguments are incorrect the `responder` terminates the
stream with an error.

<em>Note: the `format` argument serves a purpose as a separate *EBT session* is
presumably established for each feed format. For now we are just documenting
the behaviour for the default Secure Scuttlebutt feed format.</em>

The peers can now exchange messages over a duplex RPC stream. The *EBT session*
has been created.

## Exchanged messages

Two kinds of messages are sent by both peers during an *EBT session*:

- control messages known as *notes*
- feed messages

When receiving a message a peer needs to identify which message was received
through some heuristics (eg. checking if a received message conforms to the
specified JSON format).

### Control messages

Peers send so called *notes* to each other. Each *note* is a JSON object
containing one or more name/value pairs.

Each name is a JSON string which represents a feed in the `@` character
notation. The validity of this string should be confirmed when a *note* is
received. Receiving an invalid *note* should terminate the *EBT session*.

Each value is a JSON number. The number presumably doesn't have the fractional
element which comes after the decimal point as its meaning would be unknown.
The number can be negative, positive or a zero.

{% capture body %}
{
    "@FCX/tsDLpubCPKKfIrw4gc+SQkHcaD17s7GI6i/ziWY=.ed25519": 123,
    "@l1sGqWeCZRA99gN+t9sI6+UOzGcHq3KhLQUYEwb4DCo=.ed25519": -1
}
{% endcapture %}

{% include rpc_message.html
    variant="left"
    request_number="1"
    stream="true"
    end_err="false"
    body_type="JSON"
    body=body
%}

If the value is negative (usually `-1`) it means that the peer doesn't want to
receive messages for this feed. Lets refer to this scenario as *replicate flag*
being set to `false`.

If the value isn't negative then it should be interpreted as follows. First,
the JSON number should be parsed and converted to a signed integer represented
in binary in big endian notation. Then, the rightmost (lowest order) bit of the
number should be interpreted as a binary flag with `0` equal to `false` and `1`
equal to `true`. This flag is referred to as the *receive flag*. Next, a
"sign-extending right shift" (also called "arithmetic right shift") by 1 bit
should be performed on the binary number therefore discarding the rightmost
(lowest order) bit. This number should then be interpreted as a sequence number
for the feed specified in the name field of this name/value pair. Lets simply
call this number *sequence*.

To encode a note a reverse of this process should be performed. If the
*replicate flag* is set to false then the value can simply be set as `-1`.
Otherwise, the number should be stored as a signed integer encoded in big
endian notation and "left shift" should be performed. The rightmost (lowest
order) bit should then be set according to the *replicate flag* as described
previously.

*Note: I believe when encoding this value it is irrelevant whether this is a
signed or an unsigned integer as the value will always be positive, the type of
a bit shift shouldn't matter either.*

#### Example note values

<table>
<tr>
    <th>Note value</th>
    <th>Decoded note</th>
</tr>

<tr>
    <td><code>-1</code></td>
    <td>
{% include ebt_note.html
    replicate="false"
    receive="irrelevant"
    sequence="irrelevant"
%}
    </td>
</tr>

<tr>
    <td><code>0</code></td>
    <td>
{% include ebt_note.html
    replicate="true"
    receive="false"
    sequence="0 (peer doesn't have any messages for this feed)"
%}
    </td>
</tr>

<tr>
    <td><code>1</code></td>
    <td>
{% include ebt_note.html
    replicate="true"
    receive="true"
    sequence="0 (peer doesn't have any messages for this feed)"
%}
    </td>
</tr>

<tr>
    <td><code>2</code></td>
    <td>
{% include ebt_note.html
    replicate="true"
    receive="false"
    sequence="1"
%}
    </td>
</tr>

<tr>
    <td><code>3</code></td>
    <td>
{% include ebt_note.html
    replicate="true"
    receive="true"
    sequence="1"
%}
    </td>
</tr>

</table>

### Feed messages

Feed messages are sent verbatim in RPC responses. Each response may contain one
feed message. Therefore for the default Secure Scuttlebutt feed format a
message like this can be sent or received:

{% capture body %}
{
  "previous": "%XphMUkWQtomKjXQvFGfsGYpt69sgEY7Y4Vou9cEuJho=.sha256",
  "author": "@FCX/tsDLpubCPKKfIrw4gc+SQkHcaD17s7GI6i/ziWY=.ed25519",
  "sequence": 2,
  "timestamp": 1514517078157,
  "hash": "sha256",
  "content": {
    "type": "post",
    "text": "Second post!"
  }
}
{% endcapture %}

{% include rpc_message.html
    variant="left"
    request_number="1"
    stream="true"
    end_err="false"
    body_type="JSON"
    body=body
%}

Those messages are sent after the peer is instructed to send them by receiving
a certain control message. When this message is received it should presumably
be validated and persisted by the receiving peer if it is interested in it. The
messages should presumably be sent ordered by the ascending sequence number so
that they can be validated. 

## Initializing an EBT session

After the *EBT session* is created it should be initialized. The initialization
process is started by the *requestor*.

*Work in progress...*

## Fallback mechanism

Not all peers support the EBT mechanism. In that situation
`createHistoryStream` replication should be used instead. Two general
recommendations listed below should most likely be followed. Additional
scenarios are listed below as well but most likely don't need to be supported.

A general recommendation for the *server* is to fall back to
`createHistoryStream` replication if:
- at least one `createHistoryStream` is opened by the *client* or no *EBT
  session* is opened by the *client* for a certain amount of time (*Scenario 2*, *Scenario 3*)

A general recommendation for the *client* is to fall back to
`createHistoryStream` replication if:
- *server* terminates the *EBT session* opened by the *client* with an error (*Scenario 1*)

### Scenario 1

If a *requestor* attempts to open an *EBT session* but the session is
terminated with an error by the *responder* then the EBT mechanism is most
likely not supported and `createHistoryStream` replication should be used by
the *requestor* instead.

### Scenario 2

If the *client* immediately attempts to use the `createHistoryStream`
replication then most likely the EBT mechanism is not supported by the *client*
and `createHistoryStream` replication should be used by the *server* as well.
In this situation there is most likely no reason to attempt to follow *Scenario
4*.

### Scenario 3

If the *client* doesn't create an *EBT session* for a certain amount of time
then most likely the EBT mechanism is not supported by the *client* and
`createHistoryStream` replication should be used by the *server*. 

### Scenario 4

If the local node acts as a *server* and the *client* connecting to it doesn't
create an *RPC session* for a certain amount of time then the *server* can
attempt to establish an *RPC session* instead and act as a *requestor*. This
will likely fail as the EBT mechanism clearly designates the *client* as the
*requestor*.

## Other resources

- [ECMA-404, the JSON data interchange syntax](https://www.ecma-international.org/publications-and-standards/standards/ecma-404/)
- [Right shift (>>) operator, JavaScript documentation](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Right_shift)

[guide-peer-connections]: https://ssbc.github.io/scuttlebutt-protocol-guide/#peer-connections
[guide-rpc-protocol]: https://ssbc.github.io/scuttlebutt-protocol-guide/#rpc-protocol
[reference-implementation]: https://github.com/ssbc/epidemic-broadcast-trees/
[ebt-replicate]: {% link rpc/ebt_replicate.md %}
