from os import listdir
from django.core.management.base import BaseCommand, CommandError
from django.db import connection


class Command(BaseCommand):
    help = 'Migrate the Database'

    def handle(self, *args, **options):
        db_files = listdir('migrations')
        cursor = connection.cursor()
        cursor.execute("SET SCHEMA 'fnordcash'")
        cursor.execute(open('sql/schema_history.sql'))
        cursor.execute("SELECT version FROM schema_history "
                       "WHERE installed_on = (SELECT MAX(installed_on) from fnordcash.schema_history) "
                       "AND success = TRUE LIMIT 1")
        row = cursor.fetchone()

        if row:
            current_version = int(row[0])
        else:
            current_version = 0

        if len(db_files) == current_version:
            print("Nothing to do, database is up to date!")

        for db_file in db_files[current_version::]:
            current_version += 1
            print("Applying version {} using {}".format(current_version, db_file))

            cursor.execute(open('migrations/'+db_file).read())
            cursor.execute("INSERT INTO fnordcash.schema_history "
                           "(version,script,installed_on,success,installed_by,"
                           "version_rank,installed_rank,description,type,execution_time) "
                           "VALUES (%s,%s,CURRENT_TIMESTAMP,TRUE,'bernd',%s,0,%s,'SQL',0)",
                           [str(current_version), db_file, current_version, db_file])
