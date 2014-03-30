-- View: vw_mitglied_akt

-- DROP VIEW vw_mitglied_akt;

CREATE OR REPLACE VIEW vw_mitglied_akt AS 
 SELECT tc_mitglied.id,
    tc_mitglied.nhid,
    tc_mitglied.gueltig_von,
    tc_mitglied.gueltig_bis,
    tc_mitglied.typkennung,
    tc_mitglied.mitgliednr,
    tc_mitglied.anrede,
    tc_mitglied.titel,
    tc_mitglied.vorname,
    tc_mitglied.nachname,
    tc_mitglied.firma,
    tc_mitglied.abteilung,
    tc_mitglied.strasse,
    tc_mitglied.plz,
    tc_mitglied.ort,
    tc_mitglied.reserviert,
    tc_mitglied.reserviert2,
    tc_mitglied.land,
    tc_mitglied.telefon,
    tc_mitglied.telefax,
    tc_mitglied.email,
    tc_mitglied.kontonr,
    tc_mitglied.blz,
    tc_mitglied.iban,
    tc_mitglied.bic,
    tc_mitglied.bankname,
    tc_mitglied.sepa_mandatsreferenz,
    tc_mitglied.datum_unterschrift,
    tc_mitglied.geburtsdatum,
    tc_mitglied.eintrittsdatum,
    tc_mitglied.austrittsdatum,
    tc_mitglied.bemerkung,
    tc_mitglied.telefon2,
    tc_mitglied.skype_voip,
    tc_mitglied.inhaber,
    tc_mitglied.ausgabemedium,
    tc_mitglied.adressgruppe,
    tc_mitglied.beitrag_nhid
   FROM tc_mitglied
  WHERE 'now'::text::date >= tc_mitglied.gueltig_von AND 'now'::text::date <= tc_mitglied.gueltig_bis;

ALTER TABLE vw_mitglied_akt
  OWNER TO fnordcash;

