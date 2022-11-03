 SELECT DISTINCT 
          D.CUIIO,
          R.DENUMIRE, 
          R.CUATM,
          R.CAEM2,
          D.RIND,
         SUM(CASE WHEN D.capitol=1197 AND D.RIND IN ('8.08') THEN D.COL1 ELSE 0 END)  AS COL1,
         D.COL32  AS COL2
   
         
        FROM CIS2.VW_DATA_ALL D
                INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO 
                        AND R.CUIIO_VERS  = D.CUIIO_VERS  
                       
          
      WHERE 
        D.capitol IN  (1199,1197)
        AND D.PERIOADA IN (:pPERIOADA)
        AND D.FORM IN (74)


GROUP BY 
 D.CUIIO,
          R.DENUMIRE, 
          R.CUATM,
          R.CAEM2,
          D.RIND,
           D.COL32
          
          HAVING 
        

SUM(CASE WHEN D.capitol=1197 AND D.RIND IN ('8.08') THEN D.COL1 ELSE 0 END) = 1

