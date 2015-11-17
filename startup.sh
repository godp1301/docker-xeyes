#!/bin/bash
id -u ubuntu &>/dev/null || useradd --create-home --shell /bin/bash --user-group ubuntu
#exec /usr/bin/supervisord -n
