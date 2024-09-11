import os
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent.parent
# Server Socket
bind = '0.0.0.0:8000'   # Bind to all network interfaces on port 8000

# Worker Processes
workers = 3             # Number of worker processes handling requests
worker_class = 'sync'    # Worker class: sync, gevent, etc.
timeout = 120            # Worker timeout

# Logging
accesslog = '/app/logs/access.log'  # Access log file
errorlog = '/app/logs/error.log' # Error log file
loglevel = 'info'                  # Log level: debug, info, warning, error, critical

# Daemonization (Optional)
# daemon = True          # Run Gunicorn in the background (not recommended with Docker)

# Others
preload_app = True       # Preload app to speed up worker start time
