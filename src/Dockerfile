FROM amsterdam/docker_python:latest
MAINTAINER datapunt@amsterdam.nl

ENV PYTHONUNBUFFERED 1

EXPOSE 8000

RUN apt-get install -y \
		gdal-bin \
		libgeos-dev \
		netcat \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
	&& adduser --system datapunt

WORKDIR /app

# CI hook
COPY .jenkins/import /.jenkins-import/
COPY import/docker-migrate.sh /app/

COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install git+https://github.com/amsterdam/objectstore.git

COPY . /app/

USER datapunt

RUN export DJANGO_SETTINGS_MODULE=funderingen.settings
CMD uwsgi
