-- Table: tc_konto

-- DROP TABLE tc_konto;

CREATE TABLE tc_konto
(
  id integer NOT NULL,
  name text NOT NULL,
  parent_id integer,
  type character(1) NOT NULL,
  code text NOT NULL,
  description text,
  group_flag boolean NOT NULL DEFAULT false,
  visible_flag boolean NOT NULL DEFAULT true,
  CONSTRAINT pk_tc_konto PRIMARY KEY (id),
  CONSTRAINT fk_tc_konto FOREIGN KEY (parent_id)
      REFERENCES tc_konto (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY IMMEDIATE,
  CONSTRAINT chk_tc_konto_type CHECK (type = ANY (ARRAY['P'::bpchar, 'L'::bpchar, 'A'::bpchar, 'E'::bpchar, 'R'::bpchar, 'I'::bpchar]))
)
WITH (
  OIDS=FALSE
);
ALTER TABLE tc_konto
  OWNER TO fnordcash;

-- Index: fki_tc_konto

-- DROP INDEX fki_tc_konto;

CREATE INDEX fki_tc_konto
  ON tc_konto
  USING btree
  (parent_id);

-- Index: tc_konto_code_idx

-- DROP INDEX tc_konto_code_idx;

CREATE INDEX tc_konto_code_idx
  ON tc_konto
  USING btree
  (code COLLATE pg_catalog."default");

