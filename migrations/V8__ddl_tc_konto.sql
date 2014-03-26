-- Table: tc_konto

-- DROP TABLE tc_konto;

CREATE TABLE tc_konto
(
  id integer NOT NULL,
  name text NOT NULL,
  parent_id integer,
  CONSTRAINT pk_tc_konto PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE tc_konto
  OWNER TO fnordcash;

