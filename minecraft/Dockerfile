FROM openjdk:jre-alpine


MAINTAINER Rob Rua <robrua@alumni.cmu.edu>


# Install server .jar update script
RUN apk add --no-cache python3
ADD update.py /root/update.py
RUN chmod +x /root/update.py


# Add server start script
ADD start.sh /root/start.sh
RUN chmod +x /root/start.sh


# Expose minecraft port and mount server data volume
EXPOSE 25565
VOLUME /root/minecraft


# Set default heap and stack allocation
ENV MINECRAFT_XMX 1G
ENV MINECRAFT_XMS 1G


# Ready
WORKDIR /root/minecraft
CMD /root/update.py && /root/start.sh