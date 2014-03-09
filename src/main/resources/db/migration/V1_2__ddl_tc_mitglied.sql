-- Table: tc_mitglied

-- DROP TABLE tc_mitglied;

CREATE TABLE tc_mitglied
(
  id integer NOT NULL,
  nhid integer NOT NULL,
  gueltig_von date NOT NULL,
  gueltig_bis date NOT NULL,
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
  geburtsdatum date,
  eintrittsdatum date,
  austrittsdatum date,
  bemerkung text,
  telefon2 text,
  skype_voip text,
  inhaber text,
  ausgabemedium text,
  adressgruppe text,
  zahlungsbedingung text,
  abrechnung_ueber text,
  ausgabe_sprache text,
  CONSTRAINT pk_tc_mitglied PRIMARY KEY (id),
  CONSTRAINT uk_tc_mitglied UNIQUE (nhid, gueltig_von)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE tc_mitglied
  OWNER TO fnordcash;

