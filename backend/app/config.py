import os

DATABASE_URL = os.environ.get.get(
    "DATABASE_URL", "postgresql://app_user:"
)