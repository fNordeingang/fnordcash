-- Table: tc_buchung

-- DROP TABLE tc_buchung;

CREATE TABLE tc_buchung
(
  id integer NOT NULL,
  buchungsdatum timestamp with time zone NOT NULL DEFAULT now(),
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

