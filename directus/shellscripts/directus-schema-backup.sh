#!/bin/bash
OUTPUT_DIR="./backups/schema"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
mkdir -p "$OUTPUT_DIR"

docker exec -it directus-app npx directus schema snapshot "/directus/schema_${TIMESTAMP}.yaml"
