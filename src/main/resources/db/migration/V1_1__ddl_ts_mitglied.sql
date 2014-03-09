-- Table: ts_mitglied

-- DROP TABLE ts_mitglied;

CREATE TABLE ts_mitglied
(
  typkennung text,
  mitgliednr text,
  anrede text,
  titel text,
  vorname text,
  nachname text,
  firma text,
  abteilung text,
  strasse text,
  plz text,
  ort text,
  reserviert text,
  reserviert2 text,
  land text,
  telefon text,
  telefax text,
  email text,
  kontonr text,
  blz text,
  iban text,
  bic text,
  bankname text,
  sepa_mandatsreferenz text,
  datum_unterschrift text,
  geburtsdatum text,
  eintrittsdatum text,
  austrittsdatum text,
  bemerkung text,
  telefon2 text,
  skype_voip text,
  inhaber text,
  ausgabemedium text,
  adressgruppe text,
  zahlungsbedingung text,
  abrechnung_ueber text,
  ausgabe_sprache text
)
WITH (
  OIDS=FALSE
);
ALTER TABLE ts_mitglied
  OWNER TO fnordcash;

