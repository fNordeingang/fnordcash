from django.db import models


class Mitglied(models.Model):
    nhid = models.IntegerField(editable=False)
    id = models.IntegerField(primary_key=True, editable=False, auto_created=True)
    anrede = models.CharField(max_length=255)
    titel = models.CharField(max_length=255)
    vorname = models.CharField(max_length=255)
    nachname = models.CharField(max_length=255)
    strasse = models.CharField(max_length=255)
    plz = models.CharField(max_length=255)
    ort = models.CharField(max_length=255)
    email = models.CharField(max_length=255)
    eintrittsdatum = models.DateField()
    austrittsdatum = models.DateField()
    gueltig_von = models.DateField()
    gueltig_bis = models.DateField()
    mitgliednr = models.IntegerField()

    class Meta:
        db_table = '"fnordcash"."tc_mitglied"'
        verbose_name = 'Mitglied'
        verbose_name_plural = 'Mitglieder'


class Bankbuchung(models.Model):
    id = models.IntegerField(primary_key=True, editable=False, auto_created=True)
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
    id = models.IntegerField(primary_key=True, editable=False, auto_created=True)
    buchungsdatum = models.DateTimeField()
    betrag = models.DecimalField(max_digits=999, decimal_places=2)
    sollkonto = models.IntegerField()
    habenkonto = models.IntegerField()
    belegdatum = models.DateField()
    belegtext = models.TextField()
    beschreibung = models.TextField()

    class Meta:
        db_table = '"fnordcash"."tc_buchung"'
        verbose_name = 'Buchung'
        verbose_name_plural = 'Buchungen'


class Beitrag(models.Model):
    nhid = models.IntegerField(editable=False)
    id = models.IntegerField(primary_key=True, editable=False, auto_created=True)
    name = models.CharField(max_length=255)
    beitrag = models.DecimalField(max_digits=999, decimal_places=2)
    gueltig_von = models.DateField()
    gueltig_bis = models.DateField()

    class Meta:
        db_table = '"fnordcash"."tc_beitrag"'
        verbose_name = 'Beitrag'
        verbose_name_plural = 'Beiträge'


class Konto(models.Model):
    id = models.IntegerField(primary_key=True, editable=False, auto_created=True)
    name = models.CharField(max_length=255)
    parent = models.ForeignKey('self', blank=True, null=True)

    class Meta:
        db_table = '"fnordcash"."tc_konto"'
        verbose_name = 'Konto'
        verbose_name_plural = 'Konten'