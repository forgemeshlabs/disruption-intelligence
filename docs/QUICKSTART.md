# Quick Start

Disruption Intelligence is a hosted API. No engine installation or local database is required to begin using its free endpoints.

## Base URL

```bash
export DISRUPTION_API_BASE=https://disruption.forgemesh.io
```

## Public Requests

Check availability:

```bash
curl "$DISRUPTION_API_BASE/health"
```

Request aggregate free statistics:

```bash
curl "$DISRUPTION_API_BASE/stats"
```

Request a bounded free preview of events reported for a state:

```bash
curl "$DISRUPTION_API_BASE/events?state=TX"
```

## Inspect Available Paid Routes

Fetch the API and x402 discovery documents:

```bash
curl "$DISRUPTION_API_BASE/openapi.json"
curl "$DISRUPTION_API_BASE/.well-known/x402.json"
```

Or inspect the payment challenge for a paid route without completing payment:

```bash
curl -i "$DISRUPTION_API_BASE/territory/77002/disruption?radius=50"
```

An unpaid call to a paid route returns `402 Payment Required`. Use an x402-capable client to authorize payment and repeat the request according to the terms returned by the hosted API.

## Next Steps

- Browse endpoint coverage in [API.md](API.md).
- Review payment discovery in [X402.md](X402.md).
- Track future agent-tool integration direction in [MCP.md](MCP.md).
