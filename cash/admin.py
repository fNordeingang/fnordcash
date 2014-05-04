from django.contrib import admin
from cash.models import *


class MitgliedAdmin(admin.ModelAdmin):
    list_display = ('id', 'nhid', 'vorname','nachname')


class BankbuchungAdmin(admin.ModelAdmin):
    list_display = ('id', 'betrag', 'valutadatum', 'buchungstext', 'verwendungszweck')


class BuchungAdmin(admin.ModelAdmin):
    list_display = ('buchungsdatum', 'belegdatum', 'belegtext', 'beschreibung')


class BeitragAdmin(admin.ModelAdmin):
    list_display = ('id', 'nhid', 'name', 'beitrag', 'gueltig_von', 'gueltig_bis')


class KontoAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'parent')


class BuchungspositionAdmin(admin.ModelAdmin):
    list_display = ('id', 'betrag', 'buchung', 'konto', 'seite')


admin.site.register(Mitglied, MitgliedAdmin)
admin.site.register(Bankbuchung, BankbuchungAdmin)
admin.site.register(Buchung, BuchungAdmin)
admin.site.register(Beitrag, BeitragAdmin)
admin.site.register(Konto, KontoAdmin)
admin.site.register(Buchungsposition, BuchungspositionAdmin)
