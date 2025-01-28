FROM apache/superset:4.0.1
# Switching to root to install the required packages
USER root

RUN pip install authlib

# Switching back to using the `superset` user
USER superset
ENV SUPERSET_CONFIG_PATH=/app/superset_config.py
COPY ./superset-init.sh /app/
COPY ./superset_config.py /app/
COPY ./security.py /app/
