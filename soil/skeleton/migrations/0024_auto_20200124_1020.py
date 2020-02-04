# Generated by Django 2.2.1 on 2020-01-23 21:20

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('address', '0002_auto_20160213_1726'),
        ('skeleton', '0023_auto_20191210_0952'),
    ]

    operations = [
        migrations.AlterField(
            model_name='reading',
            name='irrigation_mms',
            field=models.FloatField(blank=True, help_text='Irrigation in Litres divided by Schedule Rowspace and Schedule Plantspace divided by 10000', null=True, verbose_name='Irrigation in Millimetres'),
        ),
        migrations.AlterField(
            model_name='reading',
            name='meter',
            field=models.FloatField(blank=True, help_text='Meter reading', null=True, verbose_name='Inline Water Meter in Litres'),
        ),
        migrations.AlterField(
            model_name='site',
            name='irrigation_position',
            field=models.FloatField(blank=True, null=True, verbose_name='Inline Water Meter Position in Trees'),
        ),
        migrations.CreateModel(
            name='WeatherStation',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100, null=True)),
                ('region', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='address.Locality')),
            ],
        ),
        migrations.AddField(
            model_name='farm',
            name='weatherstation',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='skeleton.WeatherStation'),
        ),
    ]