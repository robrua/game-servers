FROM robrua/game-servers:steamcmd


MAINTAINER Rob Rua <robrua@alumni.cmu.edu>


ENV DEBIAN_FRONTEND noninteractive


# Install the server
RUN /bin/bash /root/steam/steamcmd.sh \
    +login "anonymous" \
    +force_install_dir /root/ark-survival-evolved \
    +app_update 376030 \
    +quit && \
    rm -fr /root/Steam


# Add scripts
ADD start.sh /root/start.sh
ADD update.sh /root/update.sh
RUN chmod +x /root/start.sh && chmod +x /root/update.sh


# Set default server options
ENV SERVER_NAME An ARK Server
ENV JOIN_PASSWORD password
ENV ADMIN_PASSWORD password


# Expose game ports
EXPOSE 7777
EXPOSE 7778
EXPOSE 27015


# Ready
WORKDIR /root/ark-survival-evolved
CMD /root/update.sh && /root/start.sh