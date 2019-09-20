# service_station_app
## Dependencies

python 3.7.3

MySQL Server version >= 8.0.17

## Deployment

```bash
git clone https://github.com/QuidObscurum/service_station_app.git
cd service_station_app/servicestation
pip intstall -r requirements.txt
cat app_dump.sql | mysql -u db_user -p db_name
sudo nano /etc/mysql/my.cnf
```

Add the info below:

```
[client]
database = db_name
user = db_user
password = db_password # in quotes
default-character-set = utf8
```

Create .env:

```bash
touch .env
nano .env
```

Add the necessary variables:

```
TEMPLATE_DEBUG=True
SECRET_KEY=SECRET_KEY
DEBUG=True
GOOGLE_API_KEY=GOOGLE_PLACES_API_KEY
```

#### To see Customer cards available:

```
python manage.py shell
```
```Python console
>>> from servicemanager.models import Customer
>>> qs = Customer.objects.all()
>>> for c in qs:
...     print(c)
... 
Jane Dow: jane@example.com
John Doe: jhon@example.com
...
```
