FROM cm2network/steamcmd

USER root

COPY entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/entrypoint.sh

COPY garrysmod/cfg/mount.cfg /home/steam/gmod_server/garrysmod/cfg/mount.cfg

RUN curl -Lo "/bin/source_logger" "https://github.com/LukWebsForge/SourceLogger/releases/download/v1.1.0/source_logger"
RUN chmod +x "/bin/source_logger"

ENV WS_COLLECTION_ID="1295264802"
ENV AUTHKEY=""
ENV ACCOUNT_TOKEN=""
ENV GAMEMODE="terrortown"
ENV MAX_PLAYERS="16"
ENV START_MAP="ttt_bb_teenroom_b2"

USER "${USER}"

WORKDIR /home/steam/gmod_server

EXPOSE 27015 27016

ENTRYPOINT [ "/bin/entrypoint.sh" ]
