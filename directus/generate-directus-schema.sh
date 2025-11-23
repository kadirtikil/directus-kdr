#!/bin/bash

# --- ANSI Color Codes ---
YELLOW='\033[33m'
RESET='\033[0m'

# --- Display Header ---
echo -e "${YELLOW} _             _ _        _   _                _             _              "
echo -e "| |           | (_)      | | | |              | |           | |             "
echo -e "| | ____ _  __| |_ _ __  | |_| |__   ___    __| | ___  _ __ | | _____ _   _ "
echo -e "| |/ / _  |/ _  | | '__| | __|  _ \ / _ \  / _  |/ _ \|  _ \| |/ / _ \ | | |"
echo -e "|   < (_| | (_| | | |    | |_| | | |  __/ | (_| | (_) | | | |   <  __/ |_| |"
echo -e "|_|\_\__,_|\__,_|_|_|     \__|_| |_|\___|  \__,_|\___/|_| |_|_|\_\___|\__, |"
echo -e "                                                                       __/ |"
echo -e "                                                                      |___/${RESET}"

read -p "Warning: This will overwrite your local database schema. Continue? (y/N): " CONFIRMATION

if [[ "$CONFIRMATION" != "y" && "$CONFIRMATION" != "Y" ]]; then
    echo "Schema synchronization aborted."
    exit 0
fi

read -p "Enter the running Directus container ID (e.g., 75d0235e76fe): " CONTAINER_ID

if [ -z "$CONTAINER_ID" ]; then
    echo "Container ID cannot be empty. Aborting."
    exit 1
fi

echo "--- Starting Schema Snapshot on Container: $CONTAINER_ID ---"

docker exec "$CONTAINER_ID" npx directus schema snapshot ./schema.yaml

docker cp "$CONTAINER_ID":/directus/schema.yaml ./schema.yaml

echo "--- Schema snapshot copied successfully. ---"
