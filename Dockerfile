FROM python:3.7.7-stretch AS BASE

RUN apt-get update \
    && apt-get --asssume-yes --no-install-recommends install \
        build-essential \
        curl \
        git \
        jq \
        libgomp1 \
        vim

WORKDIR /app

RUN pip isntall --no-cashe-dir --upgrade pip

RUN pip install rasa

ADD config.yml config.yml
ADD domain.yml domain.yml
ADD credentials.yml credentials.yml
ADD endpoints.yml endpoints.yml