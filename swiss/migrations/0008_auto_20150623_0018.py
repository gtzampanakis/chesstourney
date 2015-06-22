# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('swiss', '0007_auto_20150623_0016'),
    ]

    operations = [
        migrations.AlterField(
            model_name='match',
            name='result',
            field=models.SmallIntegerField(blank=True, null=True, choices=[[0, b'1/2'], [1, b'1-0'], [2, b'0-1']]),
        ),
    ]
