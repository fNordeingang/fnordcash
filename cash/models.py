from django.db import models


class Mitglied(models.Model):
    nhid = models.IntegerField(name='nhid', editable=False)
    id = models.IntegerField(name='id', primary_key=True, editable=False, auto_created=True)
    vorname = models.CharField(max_length=255)
    nachname = models.CharField(max_length=255)

    class Meta:
        db_table = '"fnordcash"."tc_mitglied"'
        verbose_name = 'Mitglied'
        verbose_name_plural = 'Mitglieder'


class Bankbuchung(models.Model):
    id = models.IntegerField(name='id', primary_key=True, editable=False, auto_created=True)
    auftragskonto = models.TextField()
    buchungstag = models.DateField()
    valutadatum = models.DateField()
    buchungstext = models.TextField()
    verwendungszweck = models.TextField()
    beguenstigter = models.CharField(max_length=255)
    kontonummer = models.CharField(max_length=255)
    blz = models.CharField(max_length=255)
    betrag = models.DecimalField(max_digits=999, decimal_places=2)
    waehrung = models.CharField(max_length=255)
    info = models.CharField(max_length=255)

    class Meta:
        db_table = '"fnordcash"."tc_bankbuchung"'
        verbose_name = 'Bankbuchung'
        verbose_name_plural = 'Bankbuchungen'


class Buchung(models.Model):
    id = models.IntegerField(name='id', primary_key=True, editable=False, auto_created=True)

    class Meta:
        db_table = '"fnordcash"."tc_buchung"'
        verbose_name = 'Buchung'
        verbose_name_plural = 'Buchungen'