-- Sequence: sq_bankbuchung_id

-- DROP SEQUENCE sq_bankbuchung_id;

CREATE SEQUENCE sq_bankbuchung_id
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE sq_bankbuchung_id
  OWNER TO fnordcash;

-- Sequence: sq_beitrag_id

-- DROP SEQUENCE sq_beitrag_id;

CREATE SEQUENCE sq_beitrag_id
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE sq_beitrag_id
  OWNER TO fnordcash;

-- Sequence: sq_beitrag_nhid

-- DROP SEQUENCE sq_beitrag_nhid;

CREATE SEQUENCE sq_beitrag_nhid
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE sq_beitrag_nhid
  OWNER TO fnordcash;

-- Sequence: sq_buchung_id

-- DROP SEQUENCE sq_buchung_id;

CREATE SEQUENCE sq_buchung_id
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE sq_buchung_id
  OWNER TO fnordcash;

-- Sequence: sq_mitglied_id

-- DROP SEQUENCE sq_mitglied_id;

CREATE SEQUENCE sq_mitglied_id
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 5
  CACHE 1;
ALTER TABLE sq_mitglied_id
  OWNER TO fnordcash;

-- Sequence: sq_mitglied_nhid

-- DROP SEQUENCE sq_mitglied_nhid;

CREATE SEQUENCE sq_mitglied_nhid
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 69999
  START 10000
  CACHE 1;
ALTER TABLE sq_mitglied_nhid
  OWNER TO fnordcash;

