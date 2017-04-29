#!/bin/bash
if [[ ! -e "/root/factorio/saves" ]] ; then
    mkdir -p /root/factorio/saves
    /root/factorio-server/factorio/bin/x64/factorio --create /root/factorio/saves/save.zip --map-gen-settings /root/factorio/map-gen-settings.json
fi

if [[ ! -e "/root/factorio-server/factorio/saves" ]] ; then
    ln -s /root/factorio/saves /root/factorio-server/factorio/saves
fi

/root/factorio-server/factorio/bin/x64/factorio --start-server-load-latest --server-settings /root/factorio/server-settings.json --map-gen-settings /root/factorio/map-gen-settings.json