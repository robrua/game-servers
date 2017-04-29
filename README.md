# [GitHub Repository](https://github.com/robrua/game-servers)

## Example Launch Lines

### Minecraft

docker run -d -p 25565:25565 --restart=always --name minecraft -v path/to/your/server/data/folder:/root/minecraft -e "MINECRAFT_XMX=1G" -e "MINECRAFT_XMS=1G" robrua/game-servers:minecraft

### Windward

docker run -d -p 5127:5127 --restart=always --name windward -v path/to/your/server/data/folder:/root/Windward -e "WINDWARD_SERVER_NAME=A WindWard Server" robrua/game-servers:windward

### 7 Days To Die

docker run -d -p 26900:26900 --restart=always --name 7-days-to-die -v path/to/your/serverconfig.xml:/root/7-days-to-die/serverconfig.xml -v "/path/to/your/saves/folder:/root/7-days-to-die/7 Days To Die/Saves" robrua/game-servers:7-days-to-die

### Factorio

docker run -d -p 34197:34197/udp --restart=always --name factorio -v path/to/your/server/data/folder:/root/factorio robrua/game-servers:factorio
