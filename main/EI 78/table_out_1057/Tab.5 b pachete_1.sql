DECLARE
   CURSOR C IS
   
      SELECT
         DISTINCT  
            D.CUIIO NR_ROW,
            MAX(D.PACHET) AS COL1,
            CR.COL1 AS COL7
      FROM CIS2.DATA_ALL D
      CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
         FROM DATA_ALL D
         WHERE
            (D.PERIOADA = :pPERIOADA) AND
            D.FORM IN (101) AND
            D.CUIIO IN (5) AND
            D.ID_MD = 44519    
      ) CR
      WHERE 
         D.FORM = 44 AND
         D.PERIOADA IN (:pPERIOADA)
      GROUP BY 
         D.CUIIO,
         CR.COL1;

BEGIN
   FOR CR IN C LOOP
      UPDATE TABLE_OUT 
      SET
         COL1 = CR.COL1
      WHERE 
         COD_CUATM IN (:pCOD_CUATM) AND
         PERIOADA IN (:pPERIOADA) AND 
         ID_MDTABLE IN (:pID_MDTABLE) AND
         FORM IN (:pFORM) AND
         FORM_VERS IN (:pFORM_VERS) AND
         REGEXP_SUBSTR(NR_ROW, '\d+') = CR.NR_ROW;

      UPDATE TABLE_OUT 
      SET
         COL7 = CR.COL7
      WHERE 
         COD_CUATM IN (:pCOD_CUATM) AND
         PERIOADA IN (:pPERIOADA) AND 
         ID_MDTABLE IN (:pID_MDTABLE) AND
         FORM IN (:pFORM) AND
         FORM_VERS IN (:pFORM_VERS); 
        
   END LOOP;   
END;