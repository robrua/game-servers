#!/usr/local/bin/python3
from urllib.request import urlopen
import tarfile
import shutil
import json
import os


def get_versions(url="https://updater.factorio.com/get-available-versions"):
    with urlopen(url) as response:
        content = response.read().decode(encoding="UTF-8")
        return json.loads(content)


def main():
    # Get current release version
    version = [version["stable"] for version in get_versions()["core-linux_headless64"] if "stable" in version][-1]

    # Download server .tar.gz
    url = "https://www.factorio.com/get-download/{version}/headless/linux64".format(version=version)
    with urlopen(url) as response, open("/root/factorio-server.tar.gz", "wb") as out:
        data = response.read()
        out.write(data)

    with tarfile.open("/root/factorio-server.tar.gz") as tarchive:
        tarchive.extractall(path="/root/factorio-server")

    os.remove("/root/factorio-server.tar.gz")

    if not os.path.isfile("/root/factorio/server-settings.json"):
        shutil.copy("/root/factorio-server/factorio/data/server-settings.example.json", "/root/factorio/server-settings.json")

    if not os.path.isfile("/root/factorio/map-gen-settings.json"):
        shutil.copy("/root/factorio-server/factorio/data/map-gen-settings.example.json", "/root/factorio/map-gen-settings.json")


if __name__ == "__main__":
    main()
