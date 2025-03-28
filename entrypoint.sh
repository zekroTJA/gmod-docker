#!/bin/bash

set -e

mkdir -p "$HOME/gmod_server"
"$STEAMCMDDIR/steamcmd.sh" +force_install_dir "$HOME/gmod_server" +login anonymous +app_update 4020 validate +quit

mkdir -p "$HOME/content/tf2"
"$STEAMCMDDIR/steamcmd.sh" +force_install_dir "$HOME/content/tf2" +login anonymous +app_update 232250 validate +quit

mkdir -p "$HOME/content/css"
"$STEAMCMDDIR/steamcmd.sh" +force_install_dir "$HOME/content/css" +login anonymous +app_update 232330 validate +quit

/bin/source_logger \
    -game garrysmod \
    +map "$START_MAP" \
    +maxplayers "$MAX_PLAYERS" \
    +gamemode "$GAMEMODE" \
    +host_workshop_collection "$WS_COLLECTION_ID" \
    +authkey "$AUTHKEY" \
    +sv_setsteamaccount "$ACCOUNT_TOKEN"