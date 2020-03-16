run:
	docker-compose -f docker-compose.yml up
	
down:
	docker-compose -f docker-compose.yml down

build:
	docker build -t wirecard-db  ${PWD}/db/postgres/.
	docker build -t wirecard-etl ${PWD}/etl/python/.
	docker build -t wirecard-api ${PWD}/api/app/.

test:
	echo "make test NOT IMPLEMENTED"

jupyter:
	docker run -d --rm -p 8888:8888 -v ${PWD}/src/data/raw/:/home/jovyan/data/ -v ${PWD}/notebooks:/home/jovyan/work --name jupyter -m 5g -e GRANT_SUDO=yes -e NB_UID=1001 -e NB_GID=1002 --user root  jupyter/all-spark-notebook:latest start-notebook.sh --NotebookApp.password='sha1:e30fd9a65062:5cf9b14dd606901627704c7ad8f50b1102defb06'