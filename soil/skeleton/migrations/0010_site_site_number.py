# Generated by Django 2.2.3 on 2019-09-11 21:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('skeleton', '0009_auto_20190910_1104'),
    ]

    operations = [
        migrations.AddField(
            model_name='site',
            name='site_number',
            field=models.CharField(default='test', max_length=20, unique=True),
            preserve_default=False,
        ),
    ]
