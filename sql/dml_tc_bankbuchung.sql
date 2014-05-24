insert into
  TC_BANKBUCHUNG
(
  ID,
  AUFTRAGSKONTO,
  BUCHUNGSTAG,
  VALUTADATUM,
  BUCHUNGSTEXT,
  VERWENDUNGSZWECK,
  BEGUENSTIGTER,
  KONTONUMMER,
  BLZ,
  BETRAG,
  WAEHRUNG,
  INFO
)
select
  nextval('SQ_BANKBUCHUNG_ID'),
  AUFTRAGSKONTO,
  case
    when to_date(BUCHUNGSTAG || '.' || substr(VALUTADATUM, 7, 2), 'DD.MM.YY') >= to_date(VALUTADATUM, 'DD.MM.YY') then
      to_date(BUCHUNGSTAG || '.' || substr(VALUTADATUM, 7, 2), 'DD.MM.YY')
    else
      to_date(BUCHUNGSTAG || '.' || to_char(to_number(substr(VALUTADATUM, 7, 2), '99') - 1, '99'), 'DD.MM.YY')
  end,
  to_date(VALUTADATUM, 'DD.MM.YY'),
  BUCHUNGSTEXT,
  VERWENDUNGSZWECK,
  BEGUENSTIGTER,
  KONTONUMMER,
  BLZ,
  BETRAG::money,
  WAEHRUNG,
  INFO
from
  TS_BANKBUCHUNG
;
