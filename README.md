# sqlbackup

[![Drone build status](https://img.shields.io/drone/build/selfhosting-lab/sqlbackup/master?label=BUILD&logo=drone&style=for-the-badge)](https://cloud.drone.io/selfhosting-lab/sqlbackup/)
[![Image size](https://img.shields.io/docker/image-size/selfhostinglab/sqlbackup/latest?logo=docker&logoColor=ffffff&style=for-the-badge)](https://hub.docker.com/repository/docker/selfhostinglab/sqlbackup/)
[![Image version](https://img.shields.io/docker/v/selfhostinglab/sqlbackup?logo=docker&logoColor=ffffff&style=for-the-badge)](https://hub.docker.com/repository/docker/selfhostinglab/sqlbackup/)


## Description

Provides a simple backup and restore mechanism for SQLite3 databases.

Integrity checking and safe backup of active databases are included.


## Features

- Backups are recorded in a metadata database to allow easy management.
- SHA256 checksum are recorded and can be verified easily.

## Usage

To backup a database to the same directory you can simply mount 
```bash
docker run --rm -v $(pwd):/opt/backup:rw selfhostinglab/sqlbackup:latest backup my.db
```


## Subcommands

| Subcommand | Description                                 | Example                         |
|------------|---------------------------------------------|---------------------------------|
| `backup`   | Backup a database.                          | `shl-sqlbackup backup .test.db` |
| `restore`  | Restore a database from an existing backup. | `shl-sqlbackup restore 7`       |
| `delete`   | Delete a backup.                            | `shl-sqlbackup delete 7`        |
| `verify`   | Check the integrity of existing backups.    | `shl-sqlbackup verify`          |
| `list`     | List all existing backups.                  | `shl-sqlbackup list`            |
| `help`     | Prints help menu.                           | `shl-sqlbackup help`            |


---

## Environment variables

| Name          | Default                        | Description                                                     |
|---------------|--------------------------------|-----------------------------------------------------------------|
| `BACKUP_BASE` | `/opt/backup`                  | Directory used to store temporary files and backup metadata DB. |
| `BACKUP_PATH` | `${BACKUP_BASE}`               | Specify a default directory for backups to be stored.           |
| `METADATA_DB` | `${BACKUP_BASE}/shl-backups.db`| Specify an alternative location for the backup metadata DB.     |
