FROM python:3.12-slim-bookworm
WORKDIR /app
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PYTHONIOENCODING=utf-8
ENV PGCONNECT_TIMEOUT=10
ENV CHANNEL_MANAGER_PORT=8080
ENV LEON_HOME=/opt/leon
ENV PYTHONPATH=/opt/leon
RUN printf 'precedence ::ffff:0:0/96 100\n' >> /etc/gai.conf \
    && apt-get update \
    && apt-get install -y --no-install-recommends git ca-certificates \
    && rm -rf /var/lib/apt/lists/* \
    && git clone --depth 1 https://github.com/whatguess2003/LEON.git /opt/leon
COPY requirements.txt .
RUN pip install --no-cache-dir --disable-pip-version-check --only-binary=:all: -r requirements.txt
COPY . .
EXPOSE 8080
CMD ["python", "channel_manager_server.py"]
