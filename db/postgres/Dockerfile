FROM postgres

WORKDIR src
ADD src/ /src/

env POSTGRES_HOST_AUTH_METHOD=trust

# RUN  apt-get update  \
#         && apt-get install python3 -y \
#         &&  apt install python3-pip -y \
#         &&  apt-get install libpq-dev -y \
#         &&  apt-get install pandas -y \
#         &&  apt-get install psycopg2  -y 

COPY  src/create_table.sql /docker-entrypoint-initdb.d/