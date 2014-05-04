-- Table: tc_mitglied

-- DROP TABLE tc_mitglied;

CREATE TABLE tc_mitglied
(
  id serial NOT NULL,
  nhid integer NOT NULL,
  gueltig_von date NOT NULL,
  gueltig_bis date NOT NULL,
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
  beitrag_nhid integer,
  CONSTRAINT pk_tc_mitglied PRIMARY KEY (id),
  CONSTRAINT uk_tc_mitglied UNIQUE (nhid, gueltig_von)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE tc_mitglied
  OWNER TO fnordcash;

-- Trigger: tr_mitglied_ins on tc_mitglied

-- DROP TRIGGER tr_mitglied_ins ON tc_mitglied;

CREATE TRIGGER tr_mitglied_ins
  AFTER INSERT
  ON tc_mitglied
  FOR EACH ROW
  EXECUTE PROCEDURE fn_tr_mitglied_ins();

