# Generated by Django 2.2.1 on 2020-03-18 22:38

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('skeleton', '0005_auto_20200319_1134'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='farm',
            name='folder',
        ),
        migrations.RemoveField(
            model_name='site',
            name='area',
        ),
        migrations.RemoveField(
            model_name='site',
            name='delivery_time',
        ),
    ]
