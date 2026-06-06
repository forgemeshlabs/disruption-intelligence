# Disruption Intelligence

Geospatial disruption intelligence API built from WARN filings, labor signals, and regional economic events.

Disruption Intelligence gives software agents and developers structured access to reported regional workforce disruptions, event context, company signals, and geographic rollups through a hosted API.

**Hosted API:** [https://disruption.forgemesh.io](https://disruption.forgemesh.io)

## What You Can Query

- Public health, aggregate statistics, source provenance, and bounded event previews.
- Paid event intelligence, history, and related-event views.
- Paid company, regional, jurisdiction, radius, and territory intelligence.
- Free gold inventory search plus paid gold convergence signals and operational sector-impact unlocks.
- Machine-readable OpenAPI and x402 discovery metadata.

## Start With Public Endpoints

```bash
API_BASE=https://disruption.forgemesh.io

curl "$API_BASE/health"
curl "$API_BASE/stats"
curl "$API_BASE/events?state=TX"
curl "$API_BASE/openapi.json"
curl "$API_BASE/.well-known/x402.json"
```

## x402 Access

Paid endpoints use x402 payment discovery. An unpaid request returns a `402 Payment Required` response describing the active payment terms; an x402-capable client can satisfy those terms and retry the request.

```bash
curl -i "https://disruption.forgemesh.io/territory/77002/disruption?radius=50"
```

| Capability | Example endpoint | Listed price |
| --- | --- | ---: |
| Event severity signal | `GET /events/:id/severity` | $0.01 |
| Event company intelligence | `GET /events/:id/company-intel` | $0.03 |
| Company intelligence | `GET /companies/:id/intelligence` | $0.05 |
| Geographic radius intelligence | `GET /radius/:zip` | $0.05 |
| Territory disruption summary | `GET /territory/:zip/disruption` | $0.10 |
| Gold convergence signals | `GET /gold/signals` | $0.10 |
| Gold commercial brief | `GET /gold/brief` | $0.10 |
| Gold sector-impact unlock | `GET /gold/signals/:id/sector-impacts` | $0.15 |

Payment terms returned by the live API are authoritative.

## Industry Classification Output

Paid event-level responses can include `industry_classification`, with the industry label, NAICS fields when present, derivation method, confidence, source text when relevant, and a coverage note. This is response metadata from the hosted API; it does not imply every WARN source has complete industry coverage.

## Documentation

- [Quick start](docs/QUICKSTART.md)
- [API reference](docs/API.md)
- [x402 payment discovery](docs/X402.md)
- [MCP direction](docs/MCP.md)
- [OpenAPI contract](openapi.json)

## Repository Scope

This repository documents the hosted Disruption Intelligence API and agent-facing integration surface. The hosted intelligence engine and its data-processing implementation are not distributed here.

## License

Copyright (c) 2026 ForgeMesh Labs. All rights reserved. See [LICENSE.md](LICENSE.md).
