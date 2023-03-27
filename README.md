## Postgres-backup-restore
Simple script to backup and restore postgres databases testing with Docker.

### Guide

- Run and wait for the postgres container to be ready.
```bash
docker-compose up -d
``` 

- Connect rockylinux8 container to the postgres container
```bash
docker exec -it rockylinux8 bash
```

- After connecting to the rockylinux8 container, run the backup script in file 0-setup-backup.sh
