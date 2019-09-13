# Generated by Django 2.2.5 on 2019-09-10 20:44

import datetime
from django.db import migrations, models
import django.db.models.deletion
import servicemanager.utils


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Customer',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('surname', models.CharField(max_length=100)),
                ('birth_date', models.DateField(default=datetime.date(2001, 9, 10))),
                ('phone', models.CharField(blank=True, max_length=15, null=True)),
                ('email', models.EmailField(max_length=254)),
                ('created_timestamp', models.DateTimeField(auto_now_add=True)),
                ('updated_timestamp', models.DateTimeField(auto_now=True)),
                ('country', models.CharField(max_length=120)),
                ('state', models.CharField(max_length=120)),
                ('city', models.CharField(max_length=120)),
                ('street', models.CharField(max_length=120)),
                ('house', models.CharField(max_length=20)),
                ('postal_code', models.CharField(max_length=12)),
            ],
        ),
        migrations.CreateModel(
            name='Vehicle',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('make', models.CharField(max_length=70)),
                ('model', models.CharField(max_length=120)),
                ('year', models.PositiveSmallIntegerField(validators=[servicemanager.utils.validate_vehicle_year])),
                ('vin', models.CharField(max_length=17)),
                ('owner', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='servicemanager.Customer')),
            ],
        ),
        migrations.CreateModel(
            name='Order',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateTimeField(auto_now_add=True)),
                ('amount', models.DecimalField(decimal_places=2, max_digits=7)),
                ('status', models.CharField(choices=[('Completed', 'completed'), ('In progress', 'in progress'), ('Cancelled', 'cancelled')], default='In progress', max_length=11)),
                ('vehicle', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='servicemanager.Vehicle')),
            ],
        ),
    ]
