#!/bin/bash

set -e

mkdir -p "$HOME/gmod_server"
"$STEAMCMDDIR/steamcmd.sh" +login anonymous +force_install_dir "$HOME/gmod_server" +app_update 4020 validate +quit

mkdir -p "$HOME/content/tf2"
"$STEAMCMDDIR/steamcmd.sh" +login anonymous +force_install_dir "$HOME/content/tf2" +app_update 232250 validate +quit

mkdir -p "$HOME/content/css"
"$STEAMCMDDIR/steamcmd.sh" +login anonymous +force_install_dir "$HOME/content/css" +app_update 232330 validate +quit

curl -Lo "$HOME/gmod_server/source_logger" "https://github.com/LukWebsForge/SourceLogger/releases/download/v1.0/source_logger"
chmod +x "$HOME/gmod_server/source_logger"

./source_logger \
    -game garrysmod \
    +map "$START_MAP" \
    +maxplayers "$MAX_PLAYERS" \
    +gamemode "$GAMEMODE" \
    +host_workshop_collection "$WS_COLLECTION_ID" \
    +authkey "$AUTHKEY" \
    +sv_setsteamaccount "$ACCOUNT_TOKEN"