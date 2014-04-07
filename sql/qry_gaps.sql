select
  *
from
(
  select
    ID,
    NHID,
    GUELTIG_VON,
    GUELTIG_BIS,
    lag(GUELTIG_BIS) over (
      partition by NHID
      order by GUELTIG_VON
    ) as LAG_GUELTIG_BIS
  from
    TC_BEITRAG
) T
where
  T.LAG_GUELTIG_BIS < T.GUELTIG_VON - 1;
