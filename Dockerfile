FROM alpine:latest

LABEL maintainer='ben.fairless@gmail.com' \
      description='SQLite3 backup utility' \
      url='https://github.com/selfhosting-lab/sqlbackup'

ENV HOME='/opt/backup' \
    BACKUP_BASE="${HOME}"

RUN adduser -h ${HOME} -D backup \
 && apk add --no-cache sqlite file

COPY --chown=backup:backup shl-sqlbackup /usr/local/bin/shl-sqlbackup

USER backup
WORKDIR ${HOME}

# Create test database
RUN sqlite3 ${HOME}/.test "CREATE TABLE shl_test (id INTEGER PRIMARY KEY, date TEXT NOT NULL);"

ENTRYPOINT [ "/usr/local/bin/shl-sqlbackup" ]
VOLUME /opt/backup
