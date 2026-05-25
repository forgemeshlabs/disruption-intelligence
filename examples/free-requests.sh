#!/usr/bin/env bash
set -euo pipefail

API_BASE="${DISRUPTION_API_BASE:-https://warn.forgemesh.io}"

curl -fsS "$API_BASE/health"
printf '\n'
curl -fsS "$API_BASE/stats"
printf '\n'
curl -fsS "$API_BASE/events?state=TX"
printf '\n'
