#!/usr/bin/bash
curl -s "$@" | jq '.'
