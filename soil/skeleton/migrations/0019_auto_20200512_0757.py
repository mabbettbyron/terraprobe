# Generated by Django 2.2.1 on 2020-05-11 19:57

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('skeleton', '0018_auto_20200508_1241'),
    ]

    operations = [
        migrations.AlterField(
            model_name='strategy',
            name='days',
            field=models.IntegerField(default=0, help_text='A positive or negative number indicated the amount of days away from that critical date.'),
        ),
        migrations.AlterField(
            model_name='strategy',
            name='percentage',
            field=models.FloatField(default=0, help_text='A percentage between 0 and 1 indicating the variation from the limit associated with the strategy.'),
        ),
        migrations.AlterField(
            model_name='strategytype',
            name='percentage',
            field=models.FloatField(default=0, help_text='A percentage between 0 and 1 indicating the difference that the lower strategy should be below the upper strategy for a site. This is taken from the high limit.'),
        ),
        migrations.AddConstraint(
            model_name='strategy',
            constraint=models.CheckConstraint(check=models.Q(percentage__gte=0), name='strategy_percentage_gte_0'),
        ),
        migrations.AddConstraint(
            model_name='strategy',
            constraint=models.CheckConstraint(check=models.Q(percentage__lte=1), name='strategy_percentage_1te_1'),
        ),
        migrations.AddConstraint(
            model_name='strategytype',
            constraint=models.CheckConstraint(check=models.Q(percentage__gte=0), name='strategy_type_percentage_gte_0'),
        ),
        migrations.AddConstraint(
            model_name='strategytype',
            constraint=models.CheckConstraint(check=models.Q(percentage__lte=1), name='strategy_type_percentage_1te_1'),
        ),
    ]
