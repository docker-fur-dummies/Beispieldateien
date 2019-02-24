# Der whalesay-Container ist die Basis für diesen Container:
FROM docker/whalesay:latest 
# aktualisieren Sie das System und installieren Sie fortunes:
RUN apt -y update && apt -y install fortunes
# wenn der Container gestartet wird, starten Sie fortune und lassen Sie den Output durch cowsay laufen:
CMD /usr/games/fortune -a | cowsay
