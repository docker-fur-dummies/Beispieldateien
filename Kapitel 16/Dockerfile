FROM docker/whalesay:latest

RUN apt -y update && apt -y install fortunes

CMD /usr/games/fortune -a | cowsay
