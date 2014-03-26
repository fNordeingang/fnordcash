-- Table: fnordcash.schema_history

-- DROP TABLE fnordcash.schema_history;

CREATE TABLE IF NOT EXISTS fnordcash.schema_history
(
  version_rank integer NOT NULL,
  installed_rank integer NOT NULL,
  version character varying(50) NOT NULL,
  description character varying(200) NOT NULL,
  type character varying(20) NOT NULL,
  script character varying(1000) NOT NULL,
  checksum integer,
  installed_by character varying(100) NOT NULL,
  installed_on timestamp without time zone NOT NULL DEFAULT now(),
  execution_time integer NOT NULL,
  success boolean NOT NULL,
  CONSTRAINT schema_history_pk PRIMARY KEY (version)
)
WITH (
  OIDS=FALSE
);

-- Index: fnordcash.schema_history_ir_idx

DROP INDEX if exists fnordcash.schema_history_ir_idx;

CREATE INDEX schema_history_ir_idx
  ON fnordcash.schema_history
  USING btree
  (installed_rank);

-- Index: fnordcash.schema_history_s_idx

DROP INDEX if exists fnordcash.schema_history_s_idx;

CREATE INDEX schema_history_s_idx
  ON fnordcash.schema_history
  USING btree
  (success);

-- Index: fnordcash.schema_history_vr_idx

DROP INDEX if exists fnordcash.schema_history_vr_idx;

CREATE INDEX schema_history_vr_idx
  ON fnordcash.schema_history
  USING btree
  (version_rank);

