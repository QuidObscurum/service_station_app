# Generated by Django 2.2.5 on 2019-09-15 19:33

import datetime
from django.db import migrations, models
import servicemanager.utils


class Migration(migrations.Migration):

    dependencies = [
        ('servicemanager', '0004_auto_20190911_2141'),
    ]

    operations = [
        migrations.AlterField(
            model_name='customer',
            name='birth_date',
            field=models.DateField(default=datetime.date(2001, 9, 15), validators=[servicemanager.utils.validate_legal_age]),
        ),
        migrations.AlterField(
            model_name='vehicle',
            name='vin',
            field=models.CharField(max_length=17, unique=True),
        ),
    ]
