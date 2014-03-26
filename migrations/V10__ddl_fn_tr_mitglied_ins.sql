-- Function: fn_tr_mitglied_ins()

-- DROP FUNCTION fn_tr_mitglied_ins();

CREATE OR REPLACE FUNCTION fn_tr_mitglied_ins()
  RETURNS trigger AS
$BODY$
begin
  if((select count(*) from TC_KONTO where ID = NEW.NHID) = 0) then
    insert into TC_KONTO (ID, NAME) values (NEW.NHID, 'Personenkonto Debitor '  || to_char(NEW.NHID));
    insert into TC_KONTO (ID, NAME) values (NEW.NHID + 60000, 'Personenkonto Kreditor ' || to_char(NEW.NHID));
  end if;
  return NEW;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION fn_tr_mitglied_ins()
  OWNER TO fnordcash;

