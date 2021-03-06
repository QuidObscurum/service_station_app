# Generated by Django 2.2.5 on 2019-09-16 11:13

import datetime
from django.db import migrations, models
import django.utils.timezone
import servicemanager.utils


class Migration(migrations.Migration):

    dependencies = [
        ('servicemanager', '0005_auto_20190915_1933'),
    ]

    operations = [
        migrations.AddField(
            model_name='order',
            name='created_timestamp',
            field=models.DateTimeField(auto_now_add=True, default=django.utils.timezone.now),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='order',
            name='updated_timestamp',
            field=models.DateTimeField(auto_now=True),
        ),
        migrations.AlterField(
            model_name='customer',
            name='birth_date',
            field=models.DateField(default=datetime.date(2001, 9, 16), validators=[servicemanager.utils.validate_legal_age]),
        ),
        migrations.AlterField(
            model_name='order',
            name='date',
            field=models.DateField(default=datetime.date.today),
        ),
    ]
