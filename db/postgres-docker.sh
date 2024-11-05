docker run \
--name postgres \
-e POSTGRES_PASSWORD=nodepgpw \
-e POSTGRES_USER=nodepg \
-e POSTGRES_DB=postgres \
--mount type=volume,source=pgdata,target=/var/lib/postgresql/data \
--mount type=bind,source=$(pwd)/init-scripts,target=/docker-entrypoint-initdb.d \
-d postgres
