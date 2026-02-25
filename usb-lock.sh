#!/bin/bash
# Sustituye estos IDs por los tuyos reales (lsusb)
IDS="1234:abcd|5678:efgh|9012:ijkl"

if lsusb | grep -E "$IDS" > /dev/null; then
    exit 0
else
    exit 1
fi
