-- Table: tc_bankbuchung

-- DROP TABLE tc_bankbuchung;

CREATE TABLE tc_bankbuchung
(
  id serial NOT NULL,
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
  buchung_id integer,
  CONSTRAINT pk_tc_bankbuchung PRIMARY KEY (id),
  CONSTRAINT fk_bankbuchung_buchung_id FOREIGN KEY (buchung_id)
      REFERENCES tc_buchung (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE tc_bankbuchung
  OWNER TO fnordcash;

-- Index: fki_bankbuchung_buchung_id

-- DROP INDEX fki_bankbuchung_buchung_id;

CREATE INDEX fki_bankbuchung_buchung_id
  ON tc_bankbuchung
  USING btree
  (buchung_id);


