
set -o errexit

pip install -r requirements.txt
python manage.py makemigrations
python manage.py migrate
python manage.py collectstatic --noinput

# Create superuser (only needed first time)
echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('Admin', 'admin@example.com', '1997') if not User.objects.filter(username='admin').exists() else None" | python manage.py shell