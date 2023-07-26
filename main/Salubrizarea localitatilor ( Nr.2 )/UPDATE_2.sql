DECLARE
    
  CURSOR C IS
  
  
    SELECT CUIIO,
        IDNO
    FROM USER_BANCU.VW_Nr_2_2010

    ;  
BEGIN
    FOR CR IN C LOOP
    
     UPDATE  RENIM
      SET  IDNO = CR.IDNO 

        
        WHERE 
          CUIIO = CR.CUIIO;
            
    END LOOP;   

END;