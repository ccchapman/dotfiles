FROM ubuntu:latest

COPY ./.config .
RUN mv ./.config ~

COPY ./install.sh .
RUN ./install.sh
RUN rm ./install.sh
