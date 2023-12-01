import os
from pathlib import Path

from dotenv import load_dotenv
from split_settings.tools import include

BASE_DIR = Path(__file__).resolve().parent.parent
DOTENV_PATH = os.path.join(BASE_DIR, '.env')
load_dotenv(DOTENV_PATH)

ROOT_URLCONF = 'config.urls'
WSGI_APPLICATION = 'config.wsgi.application'

include(
    'components/database.py',
    'components/installed_apps.py',
    'components/internationalization.py',
    'components/middleware.py',
    'components/security.py',
    'components/static.py',
    'components/logging.py',
)
