# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Match',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('date', models.DateField()),
                ('result', models.SmallIntegerField()),
                ('time_controls', models.CharField(max_length=100)),
                ('pgn', models.TextField()),
                ('place', models.CharField(max_length=200)),
                ('round', models.SmallIntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='Player',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200)),
                ('nationality', models.CharField(max_length=3)),
                ('dob', models.DateField()),
            ],
        ),
        migrations.CreateModel(
            name='Ranks',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('rank', models.SmallIntegerField()),
                ('player', models.ForeignKey(to='swiss.Player')),
            ],
        ),
        migrations.CreateModel(
            name='RatingHist',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('rating', models.SmallIntegerField()),
                ('date', models.DateField()),
                ('player', models.ForeignKey(to='swiss.Player')),
            ],
        ),
        migrations.CreateModel(
            name='Tournament',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200)),
                ('rounds', models.SmallIntegerField()),
                ('place', models.CharField(max_length=200)),
            ],
        ),
        migrations.AddField(
            model_name='ranks',
            name='tournament',
            field=models.ForeignKey(to='swiss.Tournament'),
        ),
        migrations.AddField(
            model_name='match',
            name='black_player',
            field=models.ForeignKey(related_name='matches_as_black', to='swiss.Player'),
        ),
        migrations.AddField(
            model_name='match',
            name='tournament',
            field=models.ForeignKey(to='swiss.Tournament'),
        ),
        migrations.AddField(
            model_name='match',
            name='white_player',
            field=models.ForeignKey(related_name='matches_as_white', to='swiss.Player'),
        ),
    ]
