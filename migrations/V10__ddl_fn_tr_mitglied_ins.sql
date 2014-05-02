-- Function: fn_tr_mitglied_ins()

-- DROP FUNCTION fn_tr_mitglied_ins();

CREATE OR REPLACE FUNCTION fn_tr_mitglied_ins()
  RETURNS trigger AS
$BODY$
declare
  DEBICODE text := ltrim(to_char(NEW.NHID        , '99999'));
  CREDCODE text := ltrim(to_char(NEW.NHID + 60000, '99999'));
begin
  if((select count(*) from TC_KONTO where CODE = DEBICODE) = 0) then
    insert into TC_KONTO (ID, TYPE, TYPE, PARENT_ID, CODE, DESCRIPTION)
    values (nextval('SQ_KONTO_ID'), 'A', DEBICODE || ' Personenkonto Debitor',  1248, DEBICODE, 'Personenkonto Debitor '  || DEBICODE);
    insert into TC_KONTO (ID, TYPE, NAME, PARENT_ID, CODE, DESCRIPTION)
    values (nextval('SQ_KONTO_ID'), 'A', CREDCODE || ' Personenkonto Kreditor', 1249, CREDCODE, 'Personenkonto Kreditor ' || DEBICODE /* sic! */);
  end if;
  return NEW;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION fn_tr_mitglied_ins()
  OWNER TO fnordcash;

