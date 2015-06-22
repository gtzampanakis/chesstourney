# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('swiss', '0005_auto_20150621_1625'),
    ]

    operations = [
        migrations.AddField(
            model_name='tournament',
            name='players',
            field=models.ManyToManyField(to='swiss.Player'),
        ),
    ]
