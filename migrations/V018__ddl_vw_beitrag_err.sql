create view VW_BEITRAG_ERR as
select
  T1.ID,
  T1.NHID,
  T1.GUELTIG_VON,
  T1.GUELTIG_BIS,
  T2.ID as ID_2,
  T2.NHID as NHID_2,
  T2.GUELTIG_VON as GUELTIG_VON_2,
  T2.GUELTIG_BIS as GUELTIG_BIS_2
from
  TC_BEITRAG as T1,
  TC_BEITRAG as T2
where
  T1.ID   != T2.ID   and
  T1.NHID  = T2.NHID and
  (
    T1.GUELTIG_VON between T2.GUELTIG_VON and T2.GUELTIG_BIS or
    T1.GUELTIG_BIS between T2.GUELTIG_VON and T2.GUELTIG_BIS
  )
union all
select
  ID,
  NHID,
  GUELTIG_VON,
  GUELTIG_BIS,
  null,
  null,
  null,
  null
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
  T.LAG_GUELTIG_BIS < T.GUELTIG_VON - 1
