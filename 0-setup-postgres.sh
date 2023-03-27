# install postgres
dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm

# disable if already installed
dnf -qy --nogpgcheck module disable postgresql

# list postgres 14 repos (my selection is 14.5-2PGDG.rhel8)
dnf list --nogpgcheck postgresql14 --showduplicates

# install postgres
dnf install --nogpgcheck -y postgresql14-server-14.5-2PGDG.rhel8 postgresql14-contrib-14.5-2PGDG.rhel8

# check postgres user exist
id postgres

# postgresql installs all binaries in /usr/pgsql-14/bin
cd /usr/pgsql-14/bin/

# make postgresql data directory on /attached-disk/postgresql
mkdir -p /attached-disk/pgsql/14/data
chown -R postgres:postgres /attached-disk/pgsql/

# we setup postgresql with initdb
# cat /usr/lib/systemd/system/postgresql-14.service
# Environment=PGDATA=/var/lib/pgsql/14/data/
# update /var/lib/pgsql/14/data/ with /attached-disk/pgsql/14/data
/attached-disk/pgsql/14/data

# all binary files are in /usr/pgsql-14/bin
cd /usr/pgsql-14/bin/

# waait until see "OK" message
./postgresql-14-setup initdb 

# systemctl enable postgresql-14
systemctl enable postgresql-14

# systemctl start postgresql-14
systemctl start postgresql-14

# while root add following line to /etc/sudoers
echo "postgres ALL=(ALL) NOPASSWD: /usr/bin/systemctl stop postgresql-14,/usr/bin/systemctl start postgresql-14,/usr/bin/systemctl status postgresql-14,/usr/bin/systemctl enable postgresql-14" >> /etc/sudoers

# in case of every binary operation
cd /usr/pgsql-14/bin/

./pg_ctl --help