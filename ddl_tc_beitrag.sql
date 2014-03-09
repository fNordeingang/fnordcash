-- Table: tc_beitrag

-- DROP TABLE tc_beitrag;

CREATE TABLE tc_beitrag
(
  id integer NOT NULL,
  nhid integer NOT NULL,
  gueltig_von date NOT NULL,
  gueltig_bis date NOT NULL,
  name text,
  beitrag money,
  CONSTRAINT pk_tc_beitrag PRIMARY KEY (id),
  CONSTRAINT uk_tc_beitrag UNIQUE (nhid, gueltig_von)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE tc_beitrag
  OWNER TO fnordcash;

