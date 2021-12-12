FROM ttbb/base

ENV SUPERSET_HOME /opt/sh/superset

RUN dnf install -y gcc gcc-c++ libffi-devel pip && \
    dnf install -y python3-devel python3-pip python3-wheel && \
    dnf install -y openssl-devel cyrus-sasl-devel openldap-devel && \
    pip install -U pip setuptools && \
    pip install dataclasses && \
    pip install apache-superset && \
    superset db upgrade && \
    dnf clean all && \
    superset fab create-admin --username admin --firstname Zhang --lastname Jian --email shoothzj@gmail.com --password admin && \
    superset init

COPY source /opt/sh/superset

WORKDIR /opt/sh/superset
