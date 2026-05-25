# MCP Client Direction

Disruption Intelligence is designed for agent workflows: endpoints are structured, discovery is machine-readable, and paid access is available through x402.

## Planned Public MCP Surface

A future public MCP client can expose hosted API operations such as:

| Tool concept | Hosted API capability |
| --- | --- |
| `get_disruption_stats` | Public aggregate discovery data. |
| `preview_events` | Bounded free event previews. |
| `get_territory_disruption` | Paid geographic summary. |
| `get_company_intelligence` | Paid company intelligence response. |
| `get_event_timeline` | Paid event context over time. |

## Integration Principles

- MCP tooling should call the hosted API, not embed the intelligence engine.
- Payment-capable tools should expose the x402 challenge clearly and obtain authorization from the calling environment.
- Tool responses should preserve provenance and response metadata returned by the API.
- Receiving addresses and live payment terms should be discovered at request time.

## Current Integration Path

Until a published MCP package is available, agents can use the OpenAPI contract and x402 discovery documents directly:

```bash
curl "https://warn.forgemesh.io/openapi.json"
curl "https://warn.forgemesh.io/.well-known/x402.json"
```

This document is a client integration direction, not a claim that an MCP package has been published.
