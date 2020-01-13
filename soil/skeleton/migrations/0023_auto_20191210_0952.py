# Generated by Django 2.2.1 on 2019-12-09 20:52

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('skeleton', '0022_auto_20191209_0855'),
    ]

    operations = [
        migrations.AlterField(
            model_name='reading',
            name='effective_rain_1',
            field=models.FloatField(blank=True, help_text='keydata 5 - Well Complicated', null=True),
        ),
        migrations.AlterField(
            model_name='reading',
            name='irrigation_mms',
            field=models.FloatField(blank=True, help_text='Irrigation in Litres divided by Schedule Rowspace and Schedule Plantspace divided by 10000', null=True, verbose_name='Irrigation in Millilitres'),
        ),
        migrations.AlterField(
            model_name='site',
            name='crop',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='skeleton.Crop'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='site',
            name='variety',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
    ]