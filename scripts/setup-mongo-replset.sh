#!/bin/sh

echo "creating replset..."
mongo <<EOF
db = (new Mongo('localhost:27017')).getDB('test');
config={"_id":"rs0","members":[{"_id":0,"host":"mongo1:27017"}]};
rs.initiate(config);
EOF
