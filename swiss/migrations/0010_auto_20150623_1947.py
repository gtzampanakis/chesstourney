# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('swiss', '0009_ratinghist_after_match'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ratinghist',
            name='after_match',
            field=models.OneToOneField(null=True, to='swiss.Match'),
        ),
    ]
