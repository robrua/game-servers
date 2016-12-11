FROM debian


MAINTAINER Rob Rua <robrua@alumni.cmu.edu>


ENV DEBIAN_FRONTEND noninteractive


# Get steamcmd to install the server
RUN apt-get update --fix-missing && apt-get install -y --no-install-recommends \
        wget lib32gcc1 && \
    rm -rf /var/lib/apt/lists/*

RUN wget --quiet http://media.steampowered.com/installer/steamcmd_linux.tar.gz -O ~/steamcmd.tar.gz && \
    mkdir -p /root/steam && \
    tar xzf ~/steamcmd.tar.gz -C /root/steam/ && \
    chmod +x /root/steam/steamcmd.sh && \
    rm ~/steamcmd.tar.gz


# Install the server
RUN /bin/bash /root/steam/steamcmd.sh \
    +login "anonymous" \
    +force_install_dir /root/7-days-to-die \
    +app_update 294420 \
    +quit && \
    rm -fr /root/Steam


# Add scripts
ADD start.sh /root/start.sh
ADD update.sh /root/update.sh
RUN chmod +x /root/start.sh && chmod +x /root/update.sh


# Expose game port and mount saves volume
EXPOSE 26900
VOLUME /root/.local/share/7DaysToDie/Saves


# Ready
WORKDIR /root/7-days-to-die
CMD /root/update.sh && /root/start.sh