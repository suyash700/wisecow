#BASE IMAGE
FROM ubuntu:22.04

#CREATE A NON-ROOT USER FOR SECURITY
RUN useradd -ms /bin/bash wisecowuser

#CREATE DIRECTORY AND SET PERMISSIONS
RUN mkdir -p /home/wisecowuser/app && \
    chown -R wisecowuser:wisecowuser /home/wisecowuser/app

#WORKDIR
WORKDIR /home/wisecowuser/app

# COPY SCRIPT
COPY wisecow.sh .

#INSTALL DEPS
RUN apt-get update && \
    apt-get install -y fortune-mod cowsay netcat-openbsd && \
    rm -rf /var/lib/apt/lists/* && \
    chmod +x wisecow.sh

#ADD PATH
#Add /usr/games to PATH
ENV PATH="/usr/games:${PATH}"

#ENV VARS
ENV SRVPORT=4499
ENV RSPFILE=/home/wisecowuser/app/response

#RUN AS NON-ROOT USER
USER wisecowuser

#EXPOSE PORT
EXPOSE 4499

#SERVE
CMD ["./wisecow.sh"]

