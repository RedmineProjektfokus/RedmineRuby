#!/bin/bash
set -e

# Alte PID-Datei entfernen
rm -f tmp/pids/server.pid

# Abhängigkeiten ohne Entwicklung und Test installieren
bundle install --without development test

# Datenbank-Migrationen ausführen
bundle exec rake db:migrate RAILS_ENV=production

# Puma-Server explizit starten
exec rails server -u puma -b 0.0.0.0 -e production
