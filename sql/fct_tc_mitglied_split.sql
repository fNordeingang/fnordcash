create or replace function fct_tc_mitglied_split(p_nhid integer, p_date date) returns void as $$
declare
  v_gueltig_bis date;
begin
  select GUELTIG_BIS into v_gueltig_bis from TC_MITGLIED where NHID = p_nhid and p_date between GUELTIG_VON and GUELTIG_BIS;
  update TC_MITGLIED set GUELTIG_BIS = p_date - 1 where NHID = p_nhid and p_date between GUELTIG_VON and GUELTIG_BIS;
  insert into TC_MITGLIED
  (
    ID,
    NHID,
    GUELTIG_VON,
    GUELTIG_BIS,
    ANREDE,
    TITEL,
    VORNAME,
    NACHNAME,
    FIRMA,
    ABTEILUNG,
    STRASSE,
    PLZ,
    ORT,
    RESERVIERT,
    RESERVIERT2,
    LAND,
    TELEFON,
    TELEFAX,
    EMAIL,
    KONTONR,
    BLZ,
    IBAN,
    BIC,
    BANKNAME,
    SEPA_MANDATSREFERENZ,
    DATUM_UNTERSCHRIFT,
    GEBURTSDATUM,
    EINTRITTSDATUM,
    AUSTRITTSDATUM,
    BEMERKUNG,
    TELEFON2,
    SKYPE_VOIP,
    INHABER,
    BEITRAG_NHID
  )
  select
    nextval('sq_mitglied_id'),
    NHID,
    p_date,
    v_gueltig_bis,
    ANREDE,
    TITEL,
    VORNAME,
    NACHNAME,
    FIRMA,
    ABTEILUNG,
    STRASSE,
    PLZ,
    ORT,
    RESERVIERT,
    RESERVIERT2,
    LAND,
    TELEFON,
    TELEFAX,
    EMAIL,
    KONTONR,
    BLZ,
    IBAN,
    BIC,
    BANKNAME,
    SEPA_MANDATSREFERENZ,
    DATUM_UNTERSCHRIFT,
    GEBURTSDATUM,
    EINTRITTSDATUM,
    AUSTRITTSDATUM,
    BEMERKUNG,
    TELEFON2,
    SKYPE_VOIP,
    INHABER,
    BEITRAG_NHID
  from TC_MITGLIED where NHID = p_nhid and p_date - 1 between GUELTIG_VON and GUELTIG_BIS;
  return;
end;
$$ language plpgsql;

--select fct_tc_mitglied_split(10008, '2014-03-01');
