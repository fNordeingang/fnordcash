-- Table: tc_bankbuchung

-- DROP TABLE tc_bankbuchung;

CREATE TABLE tc_bankbuchung
(
  id integer NOT NULL,
  auftragskonto text,
  buchungstag date,
  valutadatum date,
  buchungstext text,
  verwendungszweck text,
  beguenstigter text,
  kontonummer text,
  blz text,
  betrag money,
  waehrung text,
  info text,
  CONSTRAINT pk_tc_bankbuchung PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE tc_bankbuchung
  OWNER TO fnordcash;

