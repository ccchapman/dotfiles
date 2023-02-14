FROM ubuntu:latest

COPY . .

RUN rm Dockerfile

RUN rm -rf ~/.config
RUN mkdir ~/.config
RUN mv .config/* ~/.config

RUN ./install.sh
RUN rm ./install.sh
