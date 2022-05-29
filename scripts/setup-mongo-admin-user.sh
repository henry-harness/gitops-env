#!/bin/sh

echo "creating admin user..."
mongo <<EOF
use admin;
db.createUser({ user: "admin" , pwd: "admin", roles: ["userAdminAnyDatabase", "dbAdminAnyDatabase", "readWriteAnyDatabase"]});
EOF
