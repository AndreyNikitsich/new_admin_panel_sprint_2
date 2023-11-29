FROM python:3.11-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates openssl tzdata make git \
    gcc g++ openssh-client \
    llvm zip unzip wget \
    libxml2-dev libxml2-utils liblz4-dev libxslt-dev build-essential libpq-dev \
    libgeoip-dev libjpeg-dev liblzma-dev libncurses5-dev libncursesw5-dev \
    libffi-dev libssl-dev dnsutils liblzma-dev postgresql-client \
    libunwind-dev procps curl vis vim grep bash \
    && rm -rf /var/lib/apt/lists/*


ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /code

ENV DJANGO_SETTINGS_MODULE 'config.settings'

RUN groupadd -r web && useradd -d /code -r -g web web_user \
    && chown web_user:web -R /code

COPY .meta/packages ./requirements.txt
RUN pip install -r requirements.txt

COPY . .

EXPOSE 8000

USER web_user
ENTRYPOINT ["uwsgi", "--strict", "--ini", "uwsgi/uwsgi.ini"]