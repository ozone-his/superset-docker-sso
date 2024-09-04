FROM apache/superset:4.0.1
# Switching to root to install the required packages
USER root

RUN pip install itsdangerous==2.0.1 flask-oidc==1.4.0  Flask-OpenID==1.3.0

# Switching back to using the `superset` user
USER superset
ENV SUPERSET_CONFIG_PATH /etc/superset/superset_config.py
COPY ./superset-init.sh /etc/superset
COPY ./superset_config.py /etc/superset
COPY ./security.py /etc/superset
