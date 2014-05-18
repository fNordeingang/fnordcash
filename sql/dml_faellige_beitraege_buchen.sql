do $$
declare
  REC record;
begin
  for REC in
    select
       B.NHID as MITGLIED,
       M.VORNAME,
       M.NACHNAME,
       B.FAELLIGKEITSDATUM,
       B.BEITRAG_NAME,
       B.BEITRAG
     from
       VW_FAELLIGE_BEITRAEGE B
     join
       TC_MITGLIED M on B.NHID = M.NHID
     where
       extract(year from B.FAELLIGKEITSDATUM) = 2013 and
       CURRENT_DATE between M.GUELTIG_VON and M.GUELTIG_BIS
  loop
    with BUCHUNG as (
      insert into TC_BUCHUNG
      (
        ID,
        BUCHUNGSDATUM,
        BELEGDATUM,
        BELEGTEXT,
        BESCHREIBUNG
      )
      values
      (
        nextval('SQ_BUCHUNG_ID'),
        CURRENT_DATE,
        REC.FAELLIGKEITSDATUM,
        'Beitragsrechnung ' || ltrim(to_char(REC.MITGLIED, '99999')) || to_char(REC.FAELLIGKEITSDATUM, 'YYYYMMDD'),
        'Mitgliedsbeitrag ' || REC.BEITRAG_NAME || ' ' || REC.NACHNAME || ', ' || REC.VORNAME || ' für ' || to_char(REC.FAELLIGKEITSDATUM, 'Mon YYYY')
      )
      returning ID as BUCHUNG_ID
    )
    insert into
      TC_BUCHUNGSPOSITION
    (
      BUCHUNG_ID,
      SEITE,
      KONTO_ID,
      BETRAG
    )
    select
      BUCHUNG_ID,
      'S',
      (select ID from TC_KONTO where CODE = ltrim(to_char(REC.MITGLIED, '99999'))),
      REC.BEITRAG
    from
      BUCHUNG
    union all
    select
      BUCHUNG_ID,
      'H',
      case
        when REC.BEITRAG > '256'::money then
          (select ID from TC_KONTO where CODE = '2120')
        else
          (select ID from TC_KONTO where CODE = '2110')
      end,
      REC.BEITRAG
    from
      BUCHUNG;
  end loop;
end$$;
