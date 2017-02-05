FROM robrua/game-servers:steamcmd


MAINTAINER Rob Rua <robrua@alumni.cmu.edu>


ENV DEBIAN_FRONTEND noninteractive


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