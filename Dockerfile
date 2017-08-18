#FROM python:3.4
FROM python:2

VOLUME ["/usr/src/app"]
WORKDIR /usr/src/app
EXPOSE 8000

COPY install_requirements.txt ./requirements.txt
COPY mkwebsite.sh ./
RUN apt-get update && apt-get install -y nano wget curl
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt
#COPY $PWD /usr/scr/app

CMD ["bash", "mkwebsite.sh"]



