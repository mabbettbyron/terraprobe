# Generated by Django 2.2.1 on 2020-01-29 22:04

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('skeleton', '0025_auto_20200124_1023'),
    ]

    operations = [
        migrations.AlterField(
            model_name='reading',
            name='date',
            field=models.DateField(default=django.utils.timezone.now),
        ),
    ]