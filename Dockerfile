FROM cm2network/steamcmd

COPY entrypoint.sh /bin/entrypoint.sh
COPY garrysmod/cfg/mount.cfg /home/steam/gmod_server/garrysmod/cfg/mount.cfg

ENV WS_COLLECTION_ID="1295264802"
ENV AUTHKEY=""
ENV ACCOUNT_TOKEN=""
ENV GAMEMODE="terrortown"
ENV MAX_PLAYERS="16"
ENV START_MAP="ttt_bb_teenroom_b2"

WORKDIR /home/steam/gmod_server

EXPOSE 27015 27016

ENTRYPOINT [ "/bin/entrypoint.sh" ]
