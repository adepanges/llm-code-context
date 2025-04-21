#!/usr/bin/env bash

set -e

# Ensure current path is project root
cd "$(dirname "$0")/../"

# rm -rfd /tmp/qdrant
# git clone https://github.com/adepanges/teamretro-mcp-server.git /tmp/qdrant

# Run scip-typescript inside the cloned repository
# (cd /tmp/qdrant && scip-typescript index --progress-bar)

mkdir -p /tmp/qdrant
cp /Volumes/Data/groupmap/TeamRetro/index.lsif /tmp/qdrant/index.lsif

QDRANT_PATH=/tmp/qdrant bash -x tools/index_qdrant.sh /tmp/qdrant

rm -rf /tmp/qdrant