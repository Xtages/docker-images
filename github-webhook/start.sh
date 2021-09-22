#!/bin/bash
service postgresql start
createuser -U postgres -s "xtages_console" --no-password
createdb -U postgres  "xtages_console" "Main Xtages console DB" --owner="xtages_console"
/bin/bash
