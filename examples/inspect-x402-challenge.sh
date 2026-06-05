#!/usr/bin/env bash
set -euo pipefail

API_BASE="${DISRUPTION_API_BASE:-https://disruption.forgemesh.io}"

# This sends no payment authorization; a paid endpoint should return its x402 challenge.
curl -i "$API_BASE/territory/77002/disruption?radius=50"
