# Generated by Django 2.1.10 on 2019-07-24 12:56

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('oauth', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ouser',
            name='last_name',
            field=models.CharField(blank=True, max_length=150, verbose_name='last name'),
        ),
    ]
