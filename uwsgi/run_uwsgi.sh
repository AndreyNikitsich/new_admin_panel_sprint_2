#!/usr/bin/env bash

set -e

chown web_user:web /var/log

uwsgi --strict --ini uwsgi/uwsgi.ini
