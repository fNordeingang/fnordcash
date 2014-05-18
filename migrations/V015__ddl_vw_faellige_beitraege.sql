-- View: vw_faellige_beitraege

-- DROP VIEW vw_faellige_beitraege;

CREATE OR REPLACE VIEW vw_faellige_beitraege AS 
 SELECT ma.nhid,
    d.date AS faelligkeitsdatum,
    b.name AS beitrag_name,
    b.beitrag
   FROM tc_mitglied ma
   JOIN tc_datum d ON d.date >= ma.eintrittsdatum AND d.date <= COALESCE(ma.austrittsdatum, 'now'::text::date)
   JOIN tc_mitglied mh ON mh.nhid = ma.nhid AND d.date >= mh.gueltig_von AND d.date <= mh.gueltig_bis
   JOIN tc_beitrag b ON b.nhid = mh.beitrag_nhid AND d.date >= b.gueltig_von AND d.date <= b.gueltig_bis
  WHERE 'now'::text::date >= ma.gueltig_von AND 'now'::text::date <= ma.gueltig_bis AND d.day = 1::double precision
  ORDER BY ma.nhid, d.date;

ALTER TABLE vw_faellige_beitraege
  OWNER TO fnordcash;

