 SELECT DISTINCT 
          D.CUIIO
          FROM CIS2.VW_DATA_ALL D
        
        WHERE 
        
        D.PERIOADA IN (:pPERIOADA)
        AND D.FORM IN (74)