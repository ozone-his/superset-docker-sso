FROM apache/superset:4.1.4
# Switching to root to install the required packages
USER root

RUN pip install --no-cache-dir \
    "cryptography>=42.0.4,<43" \
    authlib \
    sqlalchemy-drill \
    pydrill \
    psycopg2-binary \
    pymysql

# Switching back to using the `superset` user
USER superset
ENV SUPERSET_CONFIG_PATH=/app/superset_config.py
COPY ./superset-init.sh /app/
COPY ./superset_config.py /app/
COPY ./security.py /app/
ENV PYTHONPATH=/app:$PYTHONPATH
