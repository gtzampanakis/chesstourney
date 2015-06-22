# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('swiss', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='match',
            name='pgn',
            field=models.TextField(blank=True),
        ),
        migrations.AlterField(
            model_name='match',
            name='place',
            field=models.CharField(max_length=200, blank=True),
        ),
        migrations.AlterField(
            model_name='match',
            name='result',
            field=models.SmallIntegerField(blank=True),
        ),
        migrations.AlterField(
            model_name='match',
            name='time_controls',
            field=models.CharField(max_length=100, blank=True),
        ),
        migrations.AlterField(
            model_name='tournament',
            name='place',
            field=models.CharField(max_length=200, blank=True),
        ),
    ]
