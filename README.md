# [GitHub Repository](https://github.com/robrua/game-servers)

## Example Launch Lines

### Minecraft

docker run -d -p 25565:25565 --restart=always --name minecraft -v path/to/your/server/data/folder:/root/minecraft -e "MINECRAFT_XMX=1G" -e "MINECRAFT_XMS=1G" robrua/game-servers:minecraft

### Windward

docker run -d -p 5127:5127 --restart=always --name windward -v path/to/your/server/data/folder:/root/Windward -e "WINDWARD_SERVER_NAME=A WindWard Server" robrua/game-servers:windward