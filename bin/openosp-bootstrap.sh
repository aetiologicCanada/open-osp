#!/bin/bash

./bin/clone.sh

echo "Setting up database..."
docker-compose up -d db
sleep 10

docker-compose -f docker-compose.admin.yml run builder ./bin/clone.sh
docker-compose exec db ./bin/populate-db.sh

