insert into TC_BUCHUNG
(ID, BUCHUNGSDATUM, BELEGDATUM, BELEGTEXT, BESCHREIBUNG)
values
(
  nextval('SQ_BUCHUNG_ID'),
  current_date,
  to_date('25.09.2013' /* Datum */, 'DD.MM.YYYY'),
  '13H0808', /* Belegtext */
  'NOTARE HUSTEDT BARDENHEWER' /* Beschreibung */
);
with BUCHUNG as ( select
  '2900' as SOLL,  /* Soll Konto-Code */
  '1340' as HABEN, /* Haben Konto-Code */
  56.53 as BETRAG /* Betrag */
) /* 2661 = Miete & Pacht, 0945 = Bank, 8314 = Bankspesen, 8150 = Wareneinkauf, 1340 = VBaLuL */
insert into TC_BUCHUNGSPOSITION
(BUCHUNG_ID, SEITE, KONTO_ID, BETRAG)
select
  currval('SQ_BUCHUNG_ID'),
  'S',
  (select ID from TC_KONTO where CODE = SOLL::text),
  BETRAG
from BUCHUNG
union all
select
  currval('SQ_BUCHUNG_ID'),
  'H',
  (select ID from TC_KONTO where CODE = HABEN::text),
  BETRAG
from BUCHUNG;
