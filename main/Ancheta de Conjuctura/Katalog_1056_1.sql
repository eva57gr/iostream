 SELECT DISTINCT 
          D.CUIIO,
      --    R.DENUMIRE, 
       --   R.CUATM,
          R.CAEM2,
          CASE WHEN D.CAPITOL = 1199 THEN 'CAP_SR'
               WHEN D.CAPITOL = 1197 THEN 'CAP I'
          END  AS CAPITOL,
          D.RIND,
         CASE WHEN SUM(D.COL1) = 0  THEN NULL ELSE SUM(D.COL1) END   AS COL1,
         CASE WHEN SUM(D.COL2) = 0  THEN NULL ELSE SUM(D.COL2) END   AS COL2
   
         
        FROM CIS2.VW_DATA_ALL D
                INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO 
                        AND R.CUIIO_VERS  = D.CUIIO_VERS  
                       
          
      WHERE 
        D.capitol IN  (1199,1197)
        AND D.PERIOADA IN (:pPERIOADA)
        AND D.FORM IN (74)
        
        AND D.CUIIO = 26844


GROUP BY 
 D.CUIIO,
          R.DENUMIRE, 
          R.CUATM,
          R.CAEM2,
          D.RIND,
          D.CAPITOL 
        
          


ORDER BY 
--  R.CUATM,
  D.CUIIO,
  D.RIND

