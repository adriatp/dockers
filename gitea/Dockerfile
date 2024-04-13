FROM gitea/gitea:latest

# init_db.sh is a script that will be executed when the container starts
# COPY ./init_db.sh /usr/local/bin/init_db.sh
# RUN chmod +x /usr/local/bin/init_db.sh
# CMD ["/usr/local/bin/init_db.sh"]

COPY ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]