      SELECT
         DISTINCT  
            D.CUIIO NR_ROW,
           MAX(D.PACHET) AS COL1
           
      FROM CIS2.DATA_ALL D
      
      WHERE 
         D.FORM = 44 AND
        (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA) 
      GROUP BY 
         D.CUIIO