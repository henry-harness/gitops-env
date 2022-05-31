#!/bin/sh

echo "creating replset..."
mongo <<EOF
var config = {
    "_id": "rs0",
    "version": 1,
    "members": [
        {
            "_id": 1,
            "host": "mongo1:27017"
        }
    ]
};
rs.initiate(config);
rs.status();
EOF
