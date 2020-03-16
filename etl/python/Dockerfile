FROM python:3.7

USER root
WORKDIR service
ADD service/ /service/

RUN pip3 install -r requirements.txt

COPY commands.sh /service/commands.sh
RUN ["chmod", "+x", "/service/commands.sh"]
ENTRYPOINT ["/service/commands.sh"]