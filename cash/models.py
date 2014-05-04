from django.db import models
import re


MONEY_REGEX_PATTERN = re.compile('^\$?-?0*(?:\d+(?!,)(?:\.\d{1,2})?|(?:\d{1,3}(?:,\d{3})*(?:\.\d{1,2})?))$')


def MoneyValidator(value):
    """Will validate a string value against a money regular expression"""
    if not MONEY_REGEX_PATTERN.match(value):
        raise exceptions.ValidationError('{v} is not a valid dollar amount'.format(v=value))


class MyMoneyField(models.CharField):

    """Custom field for handling values from PostgreSQL's money data type"""

    def __init__(self, *args, **kwargs):
        kwargs['validators'] = [MoneyValidator]
        kwargs['max_length'] = 20
        super(MyMoneyField, self).__init__(*args, **kwargs)


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

    class Meta:
        db_table = '"fnordcash"."vw_mitglied_akt"'
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
    betrag = MyMoneyField()
    waehrung = models.CharField(max_length=255)
    info = models.CharField(max_length=255)

    class Meta:
        db_table = '"fnordcash"."tc_bankbuchung"'
        verbose_name = 'Bankbuchung'
        verbose_name_plural = 'Bankbuchungen'


class Buchung(models.Model):
    id = models.IntegerField(primary_key=True, editable=False, auto_created=True)
    buchungsdatum = models.DateTimeField()
    belegdatum = models.DateField()
    belegtext = models.TextField()
    beschreibung = models.TextField()

    class Meta:
        db_table = '"fnordcash"."tc_buchung"'
        verbose_name = 'Buchung'
        verbose_name_plural = 'Buchungen'


class Konto(models.Model):
    id = models.IntegerField(primary_key=True, editable=False, auto_created=True)
    name = models.CharField(max_length=255)
    parent = models.ForeignKey('self', blank=True, null=True)

    class Meta:
        db_table = '"fnordcash"."tc_konto"'
        verbose_name = 'Konto'
        verbose_name_plural = 'Konten'


class Buchungsposition(models.Model):
    id = models.IntegerField(primary_key=True, editable=False, auto_created=True)
    betrag = MyMoneyField()
    buchung = models.ForeignKey(Buchung, blank=True, null=True)
    konto = models.ForeignKey(Konto, blank=True, null=True)
    seite = models.CharField(max_length=1)

    class Meta:
        db_table = '"fnordcash"."tc_buchungsposition"'
        verbose_name = 'Buchungsposition'
        verbose_name_plural = 'Buchungspositionen'


class Beitrag(models.Model):
    nhid = models.IntegerField(editable=False)
    id = models.IntegerField(primary_key=True, editable=False, auto_created=True)
    name = models.CharField(max_length=255)
    beitrag = MyMoneyField()
    gueltig_von = models.DateField()
    gueltig_bis = models.DateField()

    class Meta:
        db_table = '"fnordcash"."vw_beitrag_akt"'
        verbose_name = 'Beitrag'
        verbose_name_plural = 'Beiträge'

