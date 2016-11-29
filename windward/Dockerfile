FROM alpine


MAINTAINER Rob Rua <robrua@alumni.cmu.edu>


# Install Mono to run windward.exe
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/main python2
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing mono


# Download windward.exe and add start script
WORKDIR /root
RUN wget -q http://www.tasharen.com/windward/WWServer.zip -O /root/windward.zip && \
    unzip /root/windward.zip && \
    rm /root/windward.zip
ADD start.sh /root/start.sh
RUN chmod +x /root/start.sh


# Expose windward port and mount server data volume
EXPOSE 5127
VOLUME /root/Windward


# Set default server name
ENV WINDWARD_SERVER_NAME "A WindWard Server"


# Ready
CMD /root/start.sh