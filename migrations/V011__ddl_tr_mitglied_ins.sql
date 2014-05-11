-- Trigger: tr_mitglied_ins on tc_mitglied

-- DROP TRIGGER tr_mitglied_ins ON tc_mitglied;

CREATE TRIGGER tr_mitglied_ins
  AFTER INSERT
  ON tc_mitglied
  FOR EACH ROW
  EXECUTE PROCEDURE fn_tr_mitglied_ins();

