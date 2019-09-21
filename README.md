# service_station_app
## Dependencies

python 3.7.3

MySQL Server version >= 8.0.17

## Deployment

```bash
git clone https://github.com/QuidObscurum/service_station_app.git
cd service_station_app/servicestation
sudo apt-get install python3-dev libmysqlclient-dev
pip intstall -r requirements.txt
```

Create MySQL database. Then restore the database dump:

```
cat app_dump.sql | mysql -u db_user -p db_name
sudo nano /etc/mysql/my.cnf
```

Add the info below to configure connection to the database:

```
[client]
database = db_name
user = db_user
password = db_password # in quotes
default-character-set = utf8
```

If you are using docker mysql container, indicate the host and published port, e.g.:

```
port = 3306
host = 127.0.0.1
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
GOOGLE_API_KEY=GOOGLE_API_KEY
```


#### To see Customer cards available:

```bash
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

#### To run the server:

```bash
python manage.py runserver
```
