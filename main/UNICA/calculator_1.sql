DECLARE
  numerator NUMBER := 10;
  denominator NUMBER := 0;
  result NUMBER;
BEGIN
  IF denominator = 0 THEN
    result := null;
  ELSE
    result := numerator / denominator;
  END IF;
  DBMS_OUTPUT.PUT_LINE('Result: ' || result);
END;