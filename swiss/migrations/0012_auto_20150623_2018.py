# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('swiss', '0011_auto_20150623_2010'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ratinghist',
            name='rating',
            field=models.FloatField(),
        ),
    ]
