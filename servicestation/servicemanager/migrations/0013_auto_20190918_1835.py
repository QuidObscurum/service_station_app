# Generated by Django 2.2.5 on 2019-09-18 18:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('servicemanager', '0012_auto_20190918_1833'),
    ]

    operations = [
        migrations.AlterField(
            model_name='customer',
            name='phone',
            field=models.CharField(max_length=16),
        ),
    ]
