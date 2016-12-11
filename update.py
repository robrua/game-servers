#!/usr/bin/python3
from urllib.request import urlopen
import json


def get_versions(url="https://s3.amazonaws.com/Minecraft.Download/versions/versions.json"):
    with urlopen(url) as response:
        content = response.read().decode(encoding="UTF-8")
        return json.loads(content)


def main():
    # Get current release version
    version = get_versions()["latest"]["release"]

    # Download server .jar
    url = "https://s3.amazonaws.com/Minecraft.Download/versions/{version}/minecraft_server.{version}.jar".format(version=version)
    with urlopen(url) as response, open("/root/minecraft-server.jar", "wb") as out:
        data = response.read()
        out.write(data)


if __name__ == "__main__":
    main()
