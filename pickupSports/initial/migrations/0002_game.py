# Generated by Django 4.1.5 on 2023-11-20 07:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("initial", "0001_initial"),
    ]

    operations = [
        migrations.CreateModel(
            name="Game",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("start_time", models.DateTimeField()),
                ("end_time", models.DateTimeField()),
                ("num_players", models.IntegerField()),
                ("max_players", models.IntegerField()),
            ],
            options={"db_table": "game", "managed": False,},
        ),
    ]
