#!/bin/bash
OUTPUT_DIR="./backups/files"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
mkdir -p "$OUTPUT_DIR"

# Backup uploads folder
tar -czvf "$OUTPUT_DIR/uploads_${TIMESTAMP}.tar.gz" ./uploads

# Backup configs
tar -czvf "$OUTPUT_DIR/configs_${TIMESTAMP}.tar.gz" .env docker-compose.yml traefik/

