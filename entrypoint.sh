#!/bin/bash
set -e

bundle install
bundle exec rake db:migrate RAILS_ENV=production

exec rails server -b 0.0.0.0 -e production
