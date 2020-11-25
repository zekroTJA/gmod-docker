FROM cm2network/steamcmd

RUN mkdir -p "$HOME/gmod_server" \
    && ./steamcmd.sh +login anonymous +force_install_dir "$HOME/gmod_server" +app_update 4020 validate +quit

RUN mkdir -p "$HOME/content/tf2" \
    && ./steamcmd.sh +login anonymous +force_install_dir "$HOME/content/tf2" +app_update 232250 validate +quit

RUN mkdir -p "$HOME/content/css" \
    && ./steamcmd.sh +login anonymous +force_install_dir "$HOME/content/css" +app_update 232330 validate +quit

RUN curl -Lo $HOME/gmod_server/source_logger "https://github.com/LukWebsForge/SourceLogger/releases/download/v1.0/source_logger" \
    && chmod +x $HOME/gmod_server/source_logger

COPY garrysmod/cfg/mount.cfg /home/steam/gmod_server/garrysmod/cfg/mount.cfg

ENV WS_COLLECTION_ID="1295264802"
ENV AUTHKEY=""
ENV GAMEMODE="terrortown"
ENV MAX_PLAYERS="16"
ENV START_MAP="ttt_bb_teenroom_b2"

WORKDIR /home/steam/gmod_server

EXPOSE 27015 27016

CMD ./source_logger \
      -game garrysmod \
      +map $START_MAP \
      +maxplayers $MAX_PLAYERS \
      +gamemode $GAMEMODE \
      +host_workshop_collection $WS_COLLECTION_ID \
      +authkey $AUTHKEY
