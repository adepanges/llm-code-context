#!/usr/bin/env bash

export QDRANT_URL="http://localhost:6333"

# For the Cloud service you need to specify the api key as well
# export QDRANT_API_KEY="your-api-key"

bash tools/download_and_index.sh