# Generated by Django 3.0.6 on 2020-08-18 23:14

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('graphs', '0002_create_custom_info_views'),
    ]

    operations = [
        migrations.CreateModel(
            name='Farm',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
            ],
            options={
                'db_table': 'graphs_farm',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('crop', models.CharField(max_length=100)),
                ('variety', models.CharField(max_length=100)),
            ],
            options={
                'db_table': 'graphs_product',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='ReadingType',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
            ],
            options={
                'db_table': 'graphs_readingtype',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Site',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('application_rate', models.FloatField()),
                ('comment', models.TextField()),
                ('technician', models.CharField(max_length=100)),
            ],
            options={
                'db_table': 'graphs_site',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='vsw_reading',
            fields=[
                ('reading_id', models.IntegerField(primary_key=True, serialize=False)),
                ('date', models.DateField()),
                ('type', models.TextField()),
                ('rz1_bottom', models.IntegerField()),
                ('rz1', models.FloatField()),
                ('rz2', models.FloatField()),
                ('rz3', models.FloatField()),
                ('probe_dwu', models.FloatField()),
                ('estimated_dwu', models.FloatField()),
                ('deficit', models.FloatField()),
                ('meter', models.FloatField()),
                ('irrigation_litres', models.FloatField()),
                ('irrigation_mms', models.FloatField()),
                ('rain', models.FloatField()),
                ('effective_rain_1', models.FloatField()),
                ('effective_rainfall', models.FloatField()),
                ('effective_irrigation', models.FloatField()),
                ('comment', models.TextField()),
                ('rec_mon', models.FloatField()),
                ('rec_tue', models.FloatField()),
                ('rec_wed', models.FloatField()),
                ('rec_thu', models.FloatField()),
                ('rec_fri', models.FloatField()),
                ('rec_sat', models.FloatField()),
                ('rec_sun', models.FloatField()),
                ('reviewed', models.BooleanField()),
                ('depth1', models.IntegerField()),
                ('count1', models.FloatField()),
                ('vsw1', models.FloatField()),
                ('vsw1_perc', models.FloatField()),
                ('depth2', models.IntegerField()),
                ('count2', models.FloatField()),
                ('vsw2', models.FloatField()),
                ('vsw2_perc', models.FloatField()),
                ('depth3', models.IntegerField()),
                ('count3', models.FloatField()),
                ('vsw3', models.FloatField()),
                ('vsw3_perc', models.FloatField()),
                ('depth4', models.IntegerField()),
                ('count4', models.FloatField()),
                ('vsw4', models.FloatField()),
                ('vsw4_perc', models.FloatField()),
                ('depth5', models.IntegerField()),
                ('count5', models.FloatField()),
                ('vsw5', models.FloatField()),
                ('vsw5_perc', models.FloatField()),
                ('depth6', models.IntegerField()),
                ('count6', models.FloatField()),
                ('vsw6', models.FloatField()),
                ('vsw6_perc', models.FloatField()),
                ('depth7', models.IntegerField()),
                ('count7', models.FloatField()),
                ('vsw7', models.FloatField()),
                ('vsw7_perc', models.FloatField()),
                ('depth8', models.IntegerField()),
                ('count8', models.FloatField()),
                ('vsw8', models.FloatField()),
                ('vsw8_perc', models.FloatField()),
                ('depth9', models.IntegerField()),
                ('count9', models.FloatField()),
                ('vsw9', models.FloatField()),
                ('vsw9_perc', models.FloatField()),
                ('depth10', models.IntegerField()),
                ('count10', models.FloatField()),
                ('vsw10', models.FloatField()),
                ('vsw10_perc', models.FloatField()),
            ],
            options={
                'db_table': 'graphs_vsw',
                'ordering': ('-date', 'reading_type'),
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='vsw_strategy',
            fields=[
                ('strategytype_id', models.IntegerField()),
                ('strategy_name', models.TextField()),
                ('strategy_percentage', models.FloatField()),
                ('site_name', models.TextField()),
                ('reading_type_name', models.TextField()),
                ('reading_date', models.DateField(null=True)),
                ('rz1', models.FloatField()),
                ('strategy_id', models.IntegerField(primary_key=True, serialize=False)),
                ('days', models.IntegerField()),
                ('percentage', models.FloatField()),
                ('critical_date_type', models.TextField()),
                ('critical_date', models.DateField(null=True)),
                ('strategy_date', models.DateField(null=True)),
            ],
            options={
                'db_table': 'graphs_strategy',
                'managed': False,
            },
        ),
    ]