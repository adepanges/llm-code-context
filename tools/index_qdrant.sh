#!/usr/bin/env bash

set -e

QDRANT_PATH=$1

QDRANT_PATH=$(realpath $QDRANT_PATH)

# Get path to this script
SCRIPT_PATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
ROOT_PATH=$SCRIPT_PATH/..


python -m code_search.index.files_to_json

python -m code_search.index.file_uploader

# Copy the SCIP index file instead of generating LSIF with rust-analyzer
cp $QDRANT_PATH/index.lsif $ROOT_PATH/data/index.lsif

python -m code_search.index.convert_lsif_index --device mps 

python -m code_search.index.upload_code --device mps 

docker run --rm --platform linux/amd64 -v $QDRANT_PATH:/source qdrant/rust-parser ./rust_parser /source > $ROOT_PATH/data/structures.json

python -m code_search.index.upload_signatures
