FROM debian


MAINTAINER Rob Rua <robrua@alumni.cmu.edu>


ENV DEBIAN_FRONTEND noninteractive


# Get steamcmd to install the server
RUN apt-get update --fix-missing && apt-get install -y --no-install-recommends \
        wget lib32gcc1 ca-certificates && \
rm -rf /var/lib/apt/lists/*


RUN wget --quiet http://media.steampowered.com/installer/steamcmd_linux.tar.gz -O ~/steamcmd.tar.gz && \
    mkdir -p /root/steam && \
    tar xzf ~/steamcmd.tar.gz -C /root/steam/ && \
    chmod +x /root/steam/steamcmd.sh && \
rm ~/steamcmd.tar.gz
