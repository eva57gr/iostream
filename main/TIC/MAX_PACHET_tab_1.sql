DECLARE
   CURSOR C IS
      SELECT
         DISTINCT  
            D.CUIIO NR_ROW,
           MAX(D.PACHET) AS COL1
           
      FROM CIS2.DATA_ALL D
      
      WHERE 
         D.FORM = 71 AND
         D.PERIOADA IN (:pPERIOADA)
         AND D.CUIIO IN  (277954,40174000)
      GROUP BY 
         D.CUIIO
      ;

BEGIN
   FOR CR IN C LOOP
      UPDATE TABLE_OUT 
      SET
         COL3 = CR.COL1
      WHERE 
         COD_CUATM IN (:pCOD_CUATM) AND
         PERIOADA IN (:pPERIOADA) AND 
         ID_MDTABLE IN (:pID_MDTABLE) AND
         FORM IN (:pFORM) AND
         FORM_VERS IN (:pFORM_VERS) AND
         COL1 = CR.NR_ROW;

     
        
   END LOOP;   
END;