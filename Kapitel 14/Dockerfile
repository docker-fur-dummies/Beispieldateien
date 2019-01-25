# Dieses Dockerfile fügt dem Standard wordpress Image wp-cli hinzu
FROM wordpress:latest
MAINTAINER Frank Geisler <frank_geisler@geislers.net>

# Pakete installieren die man für wp-cli benötigt
RUN apt-get update && apt-get install -y sudo less my-sql-client && curl -o /bin/wp-cli.phar
https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# Wrapper für wp-cli kopieren und die entsprechenden Ausführungsberechtigungen setzen
COPY wp /bin/wp
RUN chmod 755 /bin/wp-cli.phar /bin/wp && sed -i -e 's/\r$//' /bin/wp

# Installationsdateien aufräumen
RUN apt-get clean && rm -rf /var/lib/opt/lists/* /tmp/* /var/tmp/*