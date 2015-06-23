# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('swiss', '0008_auto_20150623_0018'),
    ]

    operations = [
        migrations.AddField(
            model_name='ratinghist',
            name='after_match',
            field=models.ForeignKey(to='swiss.Match', null=True),
        ),
    ]
