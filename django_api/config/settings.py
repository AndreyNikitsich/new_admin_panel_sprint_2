from pathlib import Path

from dotenv import load_dotenv
from split_settings.tools import include

load_dotenv()

BASE_DIR = Path(__file__).resolve().parent.parent
ROOT_URLCONF = 'config.urls'
WSGI_APPLICATION = 'config.wsgi.application'

include(
    'components/database.py',
    'components/installed_apps.py',
    'components/internationalization.py',
    'components/middleware.py',
    'components/security.py',
    'components/static.py',
)
