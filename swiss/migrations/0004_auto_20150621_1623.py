# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('swiss', '0003_auto_20150621_1551'),
    ]

    operations = [
        migrations.AddField(
            model_name='match',
            name='created_date',
            field=models.DateField(default=datetime.datetime(2015, 6, 21, 13, 23, 32, 910000, tzinfo=utc), auto_now_add=True),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='match',
            name='updated_date',
            field=models.DateField(default=datetime.datetime(2015, 6, 21, 13, 23, 34, 470000, tzinfo=utc), auto_now=True),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='player',
            name='created_date',
            field=models.DateField(default=datetime.datetime(2015, 6, 21, 13, 23, 35, 870000, tzinfo=utc), auto_now_add=True),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='player',
            name='updated_date',
            field=models.DateField(default=datetime.datetime(2015, 6, 21, 13, 23, 37, 287000, tzinfo=utc), auto_now=True),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='ranks',
            name='created_date',
            field=models.DateField(default=datetime.datetime(2015, 6, 21, 13, 23, 38, 919000, tzinfo=utc), auto_now_add=True),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='ranks',
            name='updated_date',
            field=models.DateField(default=datetime.datetime(2015, 6, 21, 13, 23, 40, 511000, tzinfo=utc), auto_now=True),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='ratinghist',
            name='created_date',
            field=models.DateField(default=datetime.datetime(2015, 6, 21, 13, 23, 42, 148000, tzinfo=utc), auto_now_add=True),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='ratinghist',
            name='updated_date',
            field=models.DateField(default=datetime.datetime(2015, 6, 21, 13, 23, 43, 785000, tzinfo=utc), auto_now=True),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='tournament',
            name='created_date',
            field=models.DateField(default=datetime.datetime(2015, 6, 21, 13, 23, 45, 841000, tzinfo=utc), auto_now_add=True),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='tournament',
            name='updated_date',
            field=models.DateField(default=datetime.datetime(2015, 6, 21, 13, 23, 47, 560000, tzinfo=utc), auto_now=True),
            preserve_default=False,
        ),
    ]
