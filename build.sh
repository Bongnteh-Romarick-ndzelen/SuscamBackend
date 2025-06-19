#!/usr/bin/env bash
# Exit on errors
set -o errexit

# Install dependencies
pip install -r requirements.txt

# Apply fresh migrations
python manage.py makemigrations
python manage.py migrate

# Collect static files
python manage.py collectstatic --noinput

# Create superuser (only needed first time)
echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('Admin', 'admin@example.com', '1997') if not User.objects.filter(username='admin').exists() else None" | python manage.py shell