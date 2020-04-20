#!/bin/sh

set -e

db_migrate() {
  local store=/var/www/html/store
  # Wait 5 seconds for the db server to be available:
  sleep 5
  # Run db migration via phpBB CLI and log stdout and stderr to files:
  php bin/phpbbcli.php db:migrate \
    >> "$store"/db_migrate_out_"$(date +%s)".log \
    2>> "$store"/db_migrate_err_"$(date +%s)".log
  # Remove log files which are empty or older than 30 days:
  find "$store" -type f -name '*.log' \( -empty -o -mtime +30 \) -exec rm {} +
}

if [ "$AUTO_DB_MIGRATE" = true ]; then
  # Run db migration as background process:
  db_migrate &
fi

# Run Apache with HTTPS if the SSL directory is available:
if [ -d /etc/apache2/ssl ]; then
  set -- -DSSL "$@"
fi

exec apache2-foreground "$@"
