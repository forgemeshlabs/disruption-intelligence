# MCP Client Integration

Disruption Intelligence is designed for agent workflows: endpoints are structured, discovery is machine-readable, and paid access is available through x402.

## MCP Package

The MCP package is published as `@forgemeshlabs/disruption-intelligence-mcp`. It exposes hosted API operations such as:

| Tool concept | Hosted API capability |
| --- | --- |
| `get_api_status` | Free API health check. |
| `get_discovery_metadata` | Free discovery metadata. |
| `inspect_x402_challenge` | Unpaid inspection of x402 payment terms. |
| `analyze_territory_disruption` | Paid geographic summary. |
| `search_company_context` | Paid company search. |
| `get_company_risk_summary` | Paid company intelligence response. |
| `get_event_severity` | Paid event severity signal with industry classification after settlement. |
| `get_event_company_intel` | Paid event company context with industry classification after settlement. |
| `get_event_timeline` | Paid event context over time. |

## Integration Principles

- MCP tooling should call the hosted API, not embed the intelligence engine.
- Payment-capable tools should expose the x402 challenge clearly and obtain authorization from the calling environment.
- Tool responses should preserve provenance and response metadata returned by the API.
- Receiving addresses and live payment terms should be discovered at request time.
- Event-level paid responses can include `industry_classification`; agents should preserve `method`, `confidence`, and `coverage_note`.

## Current Integration Path

Install with npm:

```bash
npx -y @forgemeshlabs/disruption-intelligence-mcp
```

Or inspect the hosted discovery documents directly:

```bash
curl "https://disruption.forgemesh.io/openapi.json"
curl "https://disruption.forgemesh.io/.well-known/x402.json"
```

The MCP package is challenge-first and non-settling by default.
