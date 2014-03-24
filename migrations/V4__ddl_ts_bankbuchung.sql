-- Table: ts_bankbuchung

-- DROP TABLE ts_bankbuchung;

CREATE TABLE ts_bankbuchung
(
  auftragskonto text,
  buchungstag text,
  valutadatum text,
  buchungstext text,
  verwendungszweck text,
  beguenstigter text,
  kontonummer text,
  blz text,
  betrag text,
  waehrung text,
  info text
)
WITH (
  OIDS=FALSE
);
ALTER TABLE ts_bankbuchung
  OWNER TO fnordcash;

