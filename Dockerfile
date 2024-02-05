FROM amancevice/superset:3.1.0
# Switching to root to install the required packages
USER root

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Switching back to using the `superset` user
USER superset
COPY ./superset-init.sh /etc/superset
COPY ./superset_config.py /etc/superset
COPY ./security.py /etc/superset
