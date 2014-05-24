﻿create view VW_BUCHUNGSPOSITION as
select
  P.BUCHUNG_ID,
  B.BELEGDATUM,
  B.BELEGTEXT,
  B.BESCHREIBUNG,
  P.ID as POSITION_ID,
  case when SEITE = 'S' then 'Soll' when SEITE = 'H' then 'Haben' end as SEITE,
  P.BETRAG,
  K.CODE as KONTO,
  K.NAME as KONTO_NAME,
  K.DESCRIPTION as KONTO_BESCHREIBUNG
from
  TC_BUCHUNGSPOSITION P
join
  TC_BUCHUNG B on P.BUCHUNG_ID = B.ID
join
  TC_KONTO K on K.ID = P.KONTO_ID
;