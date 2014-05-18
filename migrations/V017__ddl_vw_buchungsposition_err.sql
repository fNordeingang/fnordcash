create view VW_BUCHUNGSPOSITION_ERR as
select
  BUCHUNG_ID,
  sum(case when SEITE = 'S' then BETRAG end) as SOLL,
  sum(case when SEITE = 'H' then BETRAG end) as HABEN
from
  TC_BUCHUNGSPOSITION
group by
  BUCHUNG_ID
having
  sum(case when SEITE = 'S' then BETRAG end) !=
  sum(case when SEITE = 'H' then BETRAG end)
;