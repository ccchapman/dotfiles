FROM ubuntu:latest

COPY . .

RUN ./install.sh
