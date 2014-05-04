-- Table: tc_buchungsposition

-- DROP TABLE tc_buchungsposition;

CREATE TABLE tc_buchungsposition
(
  id serial NOT NULL,
  buchung_id integer NOT NULL,
  seite character(1) NOT NULL,
  konto_id integer NOT NULL,
  betrag money NOT NULL,
  CONSTRAINT pk_tc_buchungsposition PRIMARY KEY (id),
  CONSTRAINT fk_buchungsposition_buchung_id FOREIGN KEY (buchung_id)
      REFERENCES tc_buchung (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_buchungsposition_konto_id FOREIGN KEY (konto_id)
      REFERENCES tc_konto (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT ck_seite CHECK (seite = ANY (ARRAY['S'::bpchar, 'H'::bpchar]))
)
WITH (
  OIDS=FALSE
);
ALTER TABLE tc_buchungsposition
  OWNER TO fnordcash;

-- Index: fki_buchungsposition_buchung_id

-- DROP INDEX fki_buchungsposition_buchung_id;

CREATE INDEX fki_buchungsposition_buchung_id
  ON tc_buchungsposition
  USING btree
  (buchung_id);

-- Index: fki_buchungsposition_konto_id

-- DROP INDEX fki_buchungsposition_konto_id;

CREATE INDEX fki_buchungsposition_konto_id
  ON tc_buchungsposition
  USING btree
  (konto_id);


