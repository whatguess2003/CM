# CM

Channel manager. Aiosell posts reservations to `/update_reservation`. The PMS calls this service with `CM_SERVICE_SECRET`.

The Aiosell client is `aiosell_channel_manager.py`. Hotel data and reservation storage stay in the LEON repo. Set `LEON_HOME` to that checkout. A sibling directory named `LEON` is used when `LEON_HOME` is unset. The container image clones LEON into `/opt/leon`.

```bash
pip install -r requirements.txt
LEON_HOME=../LEON python channel_manager_server.py
```

The process listens on `CHANNEL_MANAGER_PORT` (default 8006). `GET /health` does not need the service secret.
