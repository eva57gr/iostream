SELECT
         DISTINCT  
           TRIM(D.CUIIO)  NR_ROW,
           MAX(D.PACHET) AS COL1
           
      FROM CIS2.DATA_ALL D
      
      WHERE 
         D.FORM = 71 AND
         D.PERIOADA IN (:pPERIOADA)
          AND D.CUIIO IN  (277954,40174000)
      GROUP BY 
         D.CUIIO