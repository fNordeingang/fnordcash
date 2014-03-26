-- Table: tc_buchung

-- DROP TABLE tc_buchung;

CREATE TABLE tc_buchung
(
  id integer NOT NULL,
  buchungsdatum timestamp with time zone NOT NULL DEFAULT now(),
  betrag money NOT NULL,
  sollkonto integer NOT NULL,
  habenkonto integer NOT NULL,
  belegdatum date NOT NULL,
  belegtext text NOT NULL,
  beschreibung text,
  CONSTRAINT pk_tc_buchung PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE tc_buchung
  OWNER TO fnordcash;

-- Index: ix_tc_buchung_habenkonto

-- DROP INDEX ix_tc_buchung_habenkonto;

CREATE INDEX ix_tc_buchung_habenkonto
  ON tc_buchung
  USING btree
  (habenkonto);

-- Index: ix_tc_buchung_sollkonto

-- DROP INDEX ix_tc_buchung_sollkonto;

CREATE INDEX ix_tc_buchung_sollkonto
  ON tc_buchung
  USING btree
  (sollkonto);


