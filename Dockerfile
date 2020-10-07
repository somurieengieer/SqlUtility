FROM mysql:8

ADD ./tmp_db_init_football /docker-entrypoint-initdb.d

ENV MYSQL_DATABASE TEST
ENV MYSQL_USER usr
ENV MYSQL_PASSWORD password
ENV MYSQL_ROOT_PASSWORD password

EXPOSE 3306

CMD ["mysqld"]
