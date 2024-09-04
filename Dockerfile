FROM apache/superset:4.0.1
# Switching to root to install the required packages
USER root

RUN pip install itsdangerous==2.0.1 flask-oidc==1.4.0  Flask-OpenID==1.3.0

# Switching back to using the `superset` user
USER superset
ENV SUPERSET_CONFIG_PATH /app/superset_config.py
COPY ./superset-init.sh /app/
COPY ./superset_config.py /app/
COPY ./security.py /app/superset_config.py
