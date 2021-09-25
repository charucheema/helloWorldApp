# start from base

FROM ubuntu:18.04

LABEL maintainer="Charu Cheema <charu.cheema@sjsu.edu>"

RUN apt-get update -y && \

apt-get install -y python-pip python-dev

# We copy just the requirements.txt first to leverage Docker cache

COPY ./requirement.txt /app/requirement.txt

WORKDIR /app

RUN pip install -r requirement.txt

COPY . /app

CMD [ "python", "./helloWorld.py" ]
