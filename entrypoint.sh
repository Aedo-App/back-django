#!/bin/sh

# Aplica migraciones automáticamente
python manage.py migrate --noinput

# Crea un superusuario si no existe (opcional)
echo "from django.contrib.auth import get_user_model; \
User = get_user_model(); \
User.objects.filter(username='admin').exists() or \
User.objects.create_superuser('admin', 'admin@example.com', 'admin123')" |
  python manage.py shell

# Ejecuta Gunicorn
exec "$@"
