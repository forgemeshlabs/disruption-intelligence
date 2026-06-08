# API Reference

**Base URL:** `https://disruption.forgemesh.io`

Disruption Intelligence exposes free discovery and preview routes alongside x402-priced intelligence routes. The hosted discovery documents are the authoritative current contract:

```bash
curl "https://disruption.forgemesh.io/openapi.json"
curl "https://disruption.forgemesh.io/.well-known/x402.json"
```

## Free Routes

| Method | Path | Output |
| --- | --- | --- |
| `GET` | `/health` | Availability and service version metadata. |
| `GET` | `/stats` | Aggregate reported-event summaries. |
| `GET` | `/sources` | Public provenance information. |
| `GET` | `/events` | Bounded event preview; optional `state` query parameter. |
| `GET` | `/events/recent` | Bounded preview of recent records. |
| `GET` | `/ripple/search` | Inventory-only search for Ripple Signals, with counts and unlock pricing. |
| `GET` | `/gold/search` | Legacy alias for `/ripple/search`; prefer the Ripple route in new integrations. |
| `GET` | `/events/:id` | Single basic event preview. |
| `GET` | `/company/:name` | Bounded event preview matched by company name. |
| `GET` | `/state/:state` | Bounded event preview for a state. |
| `GET` | `/llms.txt` | Plain-text catalog for agent discovery. |
| `GET` | `/openapi.json` | Machine-readable API contract. |
| `GET` | `/.well-known/x402.json` | Machine-readable x402 catalog. |

Free event previews may include identifiers, jurisdiction, company name, location, reported employee impact, relevant dates, and action category.

## Paid Routes

Paid endpoints return an x402 payment challenge when called without payment authorization.

| Method | Path | Listed price | Output |
| --- | --- | ---: | --- |
| `GET` | `/events/:id/severity` | $0.01 | Severity signal, supporting response fields, and event industry classification when available. |
| `GET` | `/events/:id/history` | $0.02 | Event version history. |
| `GET` | `/events/:id/relationships` | $0.02 | Related event links. |
| `GET` | `/events/:id/timeline` | $0.05 | Consolidated event timeline. |
| `GET` | `/events/:id/company-intel` | $0.03 | Company context associated with an event, including event industry classification when available. |
| `GET` | `/companies/search` | $0.01 | Company search results. |
| `GET` | `/companies/:id` | $0.05 | Company intelligence profile. |
| `GET` | `/companies/:id/intelligence` | $0.05 | Company intelligence summary. |
| `GET` | `/radius/:zip` | $0.05 | Geographic event results around a ZIP code. |
| `GET` | `/territory/:zip/disruption` | $0.10 | Territory disruption summary and trend fields. |
| `GET` | `/regions/:state` | $0.02 | Regional summaries within a state. |
| `GET` | `/regions/:state/:county` | $0.01 | Single regional summary. |
| `GET` | `/jurisdictions` | $0.02 | Jurisdiction activity summaries. |
| `GET` | `/jurisdictions/:state` | $0.01 | Single jurisdiction summary. |
| `GET` | `/ripple/signals` | $0.10 | Ripple Signals with confidence, compact evidence labels, and Ripple Path inventory. |
| `GET` | `/ripple/brief` | $0.10 | Disruption Intelligence Ripple Report with inventory, recommended actions, and delivered signals. |
| `GET` | `/ripple/signals/:id/sector-impacts` | $0.15 | Ripple Paths: operational spend paths and downstream business sectors affected by one signal. |
| `GET` | `/gold/signals` | $0.10 | Legacy alias for `/ripple/signals`. |
| `GET` | `/gold/brief` | $0.10 | Legacy alias for `/ripple/brief`. |
| `GET` | `/gold/signals/:id/sector-impacts` | $0.15 | Legacy alias for `/ripple/signals/:id/sector-impacts`. |

Listed prices are informational; clients must rely on active payment requirements returned by the hosted service.

## Industry Classification Fields

Paid event-level responses can include `industry_classification` when event context is available. Fields include:

| Field | Description |
| --- | --- |
| `label` | Broad industry label when classification is available. |
| `naics_sector` | Two-digit NAICS sector or supported sector range. |
| `naics_code` | Source-provided NAICS code or range when present. |
| `method` | `explicit_naics`, `explicit_naics_range`, `source_industry_text`, or `unclassified`. |
| `confidence` | `high`, `medium`, `low`, or `none`. |
| `source_text` | Short source-provided industry text when classification came from source text. |
| `coverage_note` | Caveat explaining derivation and data quality. |

Agents should treat `method`, `confidence`, and `coverage_note` as part of the paid signal. Full-corpus industry rankings remain separate from this event-level response field.

## Ripple Boundary

`GET /ripple/search` is intentionally free and inventory-only. It should be used to discover whether relevant paid Ripple inventory exists, not to reconstruct the underlying intelligence. Paid Ripple endpoints return distilled commercial intelligence, compact evidence categories, signal confidence, and upsell inventory for sector-impact detail. Raw provider rows, source queries, matching rules, and internal scoring details are not part of the public contract.

## Query Parameters

### `GET /events`

| Parameter | Description |
| --- | --- |
| `state` | Optional two-letter state filter. |

### `GET /companies/search`

| Parameter | Description |
| --- | --- |
| `q` | Company query string. |
| `limit` | Requested page size, subject to API limits. |
| `offset` | Requested result offset. |

### `GET /radius/:zip`

| Parameter | Description |
| --- | --- |
| `radius` | Search radius in miles. |
| `limit` | Requested result count. |
| `from`, `to` | ISO-formatted notice-date boundaries. |
| `minEmployees` | Minimum reported employee impact. |
| `naics` | Optional industry-code prefix filter. |

### `GET /territory/:zip/disruption`

| Parameter | Description |
| --- | --- |
| `radius` | Search radius in miles. |
| `from`, `to` | ISO-formatted notice-date boundaries. |

## Response Statuses

| Status | Meaning |
| ---: | --- |
| `200` | Request completed. |
| `402` | Payment authorization is required; inspect x402 response metadata. |
| `404` | Requested entity or geographic key was not found. |
| `500` | Service could not complete the request. |

This reference documents responses and access patterns only; it does not publish the hosted engine implementation.
