FROM ttbb/base

ENV SUPERSET_HOME /opt/sh/superset

RUN dnf update -y && \
dnf install -y gcc gcc-c++ libffi-devel && \
dnf install -y openssl-devel cyrus-sasl-devel openldap-devel && \
dnf install -y  python3-devel python3-pip python3-wheel && \
pip3 install -U pip setuptools && \
pip3 install dataclasses && \
pip3 install apache-superset && \
superset db upgrade && \
dnf clean all && \
superset fab create-admin --username admin --firstname Zhang --lastname Jian --email shoothzj@gmail.com --password admin && \
superset init

COPY source /opt/sh/superset

WORKDIR /opt/sh/superset
