# [GitHub Repository](https://github.com/robrua/game-servers)

## Example Launch Lines

### Minecraft

docker run -d -p 25565:25565 --restart=always --name minecraft -v path/to/your/server/data/folder:/root/minecraft robrua/game-servers:minecraft