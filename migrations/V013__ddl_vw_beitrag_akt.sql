-- View: vw_beitrag_akt

-- DROP VIEW vw_beitrag_akt;

CREATE OR REPLACE VIEW vw_beitrag_akt AS 
 SELECT tc_beitrag.id,
    tc_beitrag.nhid,
    tc_beitrag.gueltig_von,
    tc_beitrag.gueltig_bis,
    tc_beitrag.name,
    tc_beitrag.beitrag
   FROM tc_beitrag
  WHERE 'now'::text::date >= tc_beitrag.gueltig_von AND 'now'::text::date <= tc_beitrag.gueltig_bis;

ALTER TABLE vw_beitrag_akt
  OWNER TO fnordcash;

