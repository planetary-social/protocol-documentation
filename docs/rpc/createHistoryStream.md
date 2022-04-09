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

## Description

This request is used for replicating messages from different clients. Clients
can perform `["createHistoryStream"]` requests to get new messages from feeds
which they are interested in. This mechanism is sometimes referred to as
"legacy replication" as new replication mechanism based on `["ebt",
"replicate"]` is now available.

## Specification

### Requests

<table>

<tr>
    <td>
        Name
    </td>
    <td>
        <pre>["createHistoryStream"]</pre>
    </td>
</tr>

<tr>
    <td>
        Type
    </td>
    <td>
        <pre>"source"</pre>
    </td>
</tr>

<tr>
    <td>
        Args
    </td>
    <td>
        Must be an array containing exactly one object.
    </td>
</tr>

</table>


#### Args

The object within the `args` array must have the following schema:

<table>
    <tr>
        <th> 
            Field name
        </th>
        <th> 
            Required
        </th>
        <th> 
            Type
        </th>
        <th> 
            Description
        </th>
    </tr>

    <tr>
        <td>
            <pre>id</pre>
        </td>
        <td>
            <pre>true</pre>
        </td>
        <td>
            <pre>string</pre>
        </td>
        <td>
            <p>
                Id of the feed. All observed requests used the at-sign feed id format.
            </p>
        </td>
    </tr>

    <tr>
        <td>
            <pre>sequence</pre>
        </td>
        <td>
            <pre>false</pre>
        </td>
        <td>
            <pre>number</pre>
        </td>
        <td>
            <p>
                If specified then messages with a sequence number greater than
                the provided sequence number will be returned.
            </p>

            <p>
                If <code>old</code> is <code>true</code> and this parameter is
                not set then this means that messages starting with the first
                message in the feed must be returned.
            </p>

            <p>
                Some clients pass <code>-1</code> in this field instead of not setting it.
            </p>

            <p>
                <em>
                    Warning! In the past the name of this argument was
                    <code>seq</code>. All clients must create requests with the
                    name <code>sequence</code>. Client should accept both
                    <code>sequence</code> and <code>seq</code> as the name of
                    this argument. If a client sets both of those arguments to
                    <code>sequence</code> and <code>seq</code> then it must be
                    considered an error.
                </em>
            </p>

            <p>
                <em>
                    Warning! The protocol guide specifies that messages greater
                    than the provided sequence number should be returned. Some
                    clients appear to return messages with a sequence number
                    greater or equal to the provided sequence number. See <a
                    href="https://github.com/ssbc/scuttlebutt-protocol-guide/issues/65">this
                    issue</a>.
                </em>
            </p>
        </td>
    </tr>

    <tr>
        <td>
            <pre>limit</pre>
        </td>
        <td>
            <pre>false</pre>
        </td>
        <td>
            <pre>number</pre>
        </td>
        <td>
            <p>
                Maximum number of messages to be returned.
            </p>
            <p>
                If this argument is not set then the number of returned
                messages is not limited.
            </p>
        </td>
    </tr>

    <tr>
        <td>
            <pre>live</pre>
        </td>
        <td>
            <pre>false</pre>
        </td>
        <td>
            <pre>boolean</pre>
        </td>
        <td>
            <p>
                If this argument is set to <code>true</code>then the stream
                will remain open and return newly received messages for this
                feed as they become available.
            </p>
            <p>
                If this argument is not set then it must be considered to be
                <code>false</code>.
            </p>
        </td>
    </tr>

    <tr>
        <td>
            <pre>old</pre>
        </td>
        <td>
            <pre>false</pre>
        </td>
        <td>
            <pre>boolean</pre>
        </td>
        <td>
            <p>
                If this argument is set to <code>true</code> then already
                available messages will be returned, presumably from the local
                database.
            </p>
            <p>
                If this argument is not set then it must be considered to be
                <code>true</code>.
            </p>
        </td>
    </tr>

    <tr>
        <td>
            <pre>keys</pre>
        </td>
        <td>
            <pre>false</pre>
        </td>
        <td>
            <pre>boolean</pre>
        </td>
        <td>
            <p>
                This argument controls the format of responses. See the section
                about responses below.
            </p>
            <p>
                If this argument is not set then it must be considered to be
                <code>true</code>.
            </p>
        </td>
    </tr>
</table>

Notes:

- Setting `live` to `false` and `old` to `false` seems to imply that no
  messages will ever be returned and the stream will be closed right away.

### Responses

The messages in responses must be sent sorted by the sequence number in an
ascending way. The sequence numbers must come one-by-one without gaps. Each
response contains one message. The format of all responses in the stream
depends on the `keys` parameter.

#### Without keys

If `keys` is set to `false` then messages are directly returned in each response.

{% capture body %}
{
  "name": ["createHistoryStream"],
  "type": "source",
  "args": [
    {
      "id": "@FCX/tsDLpubCPKKfIrw4gc+SQkHcaD17s7GI6i/ziWY=.ed25519",
      "keys": false
    }
  ]
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

{% capture body %}
{
  "previous": null,
  "author": "@FCX/tsDLpubCPKKfIrw4gc+SQkHcaD17s7GI6i/ziWY=.ed25519",
  "sequence": 1,
  "timestamp": 1514517067954,
  "hash": "sha256",
  "content": {
    "type": "post",
    "text": "This is the first post!"
  },
  "signature": "QYOR/zU9dxE1aKBaxc3C0DJ4gRyZtlMfPLt+CGJcY73sv5abKK
                Kxr1SqhOvnm8TY784VHE8kZHCD8RdzFl1tBA==.sig.ed25519"
}
{% endcapture %}

{% include rpc_message.html
    variant="right"
    request_number="-1"
    stream="true"
    end_err="false"
    body_type="JSON"
    body=body
%}

#### With keys

If `keys` is set to `true` then messages are wrapped with an additional object.

{% capture body %}
{
  "name": ["createHistoryStream"],
  "type": "source",
  "args": [
    {
      "id": "@FCX/tsDLpubCPKKfIrw4gc+SQkHcaD17s7GI6i/ziWY=.ed25519",
      "keys": true
    }
  ]
}
{% endcapture %}

{% include rpc_message.html
    variant="left"
    request_number="2"
    stream="true"
    end_err="false"
    body_type="JSON"
    body=body
%}

{% capture body %}
{
  "key": "%XphMUkWQtomKjXQvFGfsGYpt69sgEY7Y4Vou9cEuJho=.sha256",
  "value": {
    "previous": null,
    "author": "@FCX/tsDLpubCPKKfIrw4gc+SQkHcaD17s7GI6i/ziWY=.ed25519",
    "sequence": 1,
    "timestamp": 1514517067954,
    "hash": "sha256",
    "content": {
      "type": "post",
      "text": "This is the first post!"
    },
    "signature": "QYOR/zU9dxE1aKBaxc3C0DJ4gRyZtlMfPLt+CGJcY73sv5abKK
                  Kxr1SqhOvnm8TY784VHE8kZHCD8RdzFl1tBA==.sig.ed25519"
  },
  "timestamp": 1514517067956
}
{% endcapture %}

{% include rpc_message.html
    variant="right"
    request_number="-2"
    stream="true"
    end_err="false"
    body_type="JSON"
    body=body
%}

The object must have the following schema:

<table>
    <tr>
        <th> 
            Field name
        </th>
        <th> 
            Required
        </th>
        <th> 
            Type
        </th>
        <th> 
            Description
        </th>
    </tr>

    <tr>
        <td>
            <pre>key</pre>
        </td>
        <td>
            <pre>true</pre>
        </td>
        <td>
            <pre>string</pre>
        </td>
        <td>
            <p>
                Id of the message. All observed requests used the percent-sign
                feed id format.
            </p>
        </td>
    </tr>

    <tr>
        <td>
            <pre>value</pre>
        </td>
        <td>
            <pre>false</pre>
        </td>
        <td>
            Raw JSON
        </td>
        <td>
            <p>
                Raw JSON of the returned message.
            </p>
        </td>
    </tr>

    <tr>
        <td>
            <pre>timestamp</pre>
        </td>
        <td>
            <pre>false</pre>
        </td>
        <td>
            <pre>number</pre>
        </td>
        <td>
            <p>
                Unix timestamp in number of milliseconds which specifies when
                this message was returned by the client responding to the
                request.
            </p>
        </td>
    </tr>
</table>

## Support table

<table class="support-table">
<tr>
    <th></th>
    <th>Sends</th>
    <th>Accepts</th>
</tr>

<tr>
    <td>
        go-ssb
    </td>
    <td class="version yes">
        <div class="number">
            v0.2.1
        </div>
        <div class="note">
            Yes.
        </div>
    </td>
    <td class="version yes">
        <div class="number">
            v0.2.1
        </div>
        <div class="note">
            Yes.
        </div>
    </td>
</tr>

<tr>
    <td>
        Patchwork
    </td>
    <td class="version yes">
        <div class="number">
            3.18.1
        </div>
        <div class="note">
            Yes.
        </div>
    </td>
    <td class="version yes">
        <div class="number">
            3.18.1
        </div>
        <div class="note">
            Yes.

            See 
            <a href="https://github.com/ssbc/scuttlebutt-protocol-guide/issues/65">
                protocol-guide/#65
            </a>
            for information about the <code>sequence</code> argument. 
        </div>
    </td>
</tr>

<tr>
    <td>
        Manyverse
    </td>
    <td class="version unknown">
        <div class="number">
            v0.2203.21-beta
        </div>
        <div class="note">
            Unknown.
        </div>
    </td>
    <td class="version unknown">
        <div class="number">
            v0.2203.21-beta
        </div>
        <div class="note">
            Unknown.
        </div>
    </td>
</tr>

</table>

## Examples

### Requests

#### go-ssb

{% capture body %}
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
{% endcapture %}

{% include rpc_message.html
    variant="left"
    request_number="1"
    stream="true"
    end_err="false"
    body_type="JSON"
    client_name="go-ssb"
    client_version="v0.2.1"
    body=body
%}

#### Patchwork

{% capture body %}
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
{% endcapture %}

{% include rpc_message.html
    variant="left"
    request_number="1"
    stream="true"
    end_err="false"
    body_type="JSON"
    client_name="Patchwork"
    client_version="3.18.1"
    body=body
%}

### Server terminations

#### Manyverse

{% capture body %}
true
{% endcapture %}

{% include rpc_message.html
    variant="right"
    request_number="-1"
    stream="true"
    end_err="true"
    body_type="JSON"
    client_name="Manyverse"
    client_version="v0.2203.21-beta"
    body=body
%}
