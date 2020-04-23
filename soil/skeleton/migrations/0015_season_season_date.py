# Generated by Django 2.2.1 on 2020-04-19 23:49

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('skeleton', '0014_varietyseasontemplate'),
    ]

    operations = [
        migrations.AddField(
            model_name='season',
            name='season_date',
            field=models.DateField(default=django.utils.timezone.now, help_text='The Year to create a new season. For a season spanning two years is must be the starting year. ', null=True),
        ),
    ]
