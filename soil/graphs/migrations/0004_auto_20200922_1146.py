# Generated by Django 3.0.6 on 2020-09-21 23:46

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('graphs', '0003_farm_product_readingtype_site_vsw_reading_vsw_strategy'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='vsw_reading',
            options={'get_latest_by': 'date', 'managed': False, 'ordering': ('-date', 'reading_type')},
        ),
    ]
