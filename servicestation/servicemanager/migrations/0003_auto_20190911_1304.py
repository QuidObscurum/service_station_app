# Generated by Django 2.2.5 on 2019-09-11 13:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('servicemanager', '0002_auto_20190911_0901'),
    ]

    operations = [
        migrations.RenameField(
            model_name='customer',
            old_name='name',
            new_name='first_name',
        ),
        migrations.RenameField(
            model_name='customer',
            old_name='surname',
            new_name='last_name',
        ),
        migrations.AlterField(
            model_name='customer',
            name='email',
            field=models.EmailField(max_length=254, unique=True),
        ),
    ]
