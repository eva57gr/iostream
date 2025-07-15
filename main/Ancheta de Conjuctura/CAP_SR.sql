 SELECT 
 L.CUIIO,
 L.DENUMIRE,
 L.CUATM,
 L.CAEM2,
 L.TRIM_2,
 R.TRIM_1
 FROM 
 (
 SELECT DISTINCT 
          D.CUIIO,
          MAX(CASE WHEN 1=1 AND  D.PERIOADA IN (:pPERIOADA) THEN R.DENUMIRE ELSE NULL END)DENUMIRE, 
          MAX(CASE WHEN 1=1 AND  D.PERIOADA IN (:pPERIOADA) THEN R.CUATM ELSE NULL END)CUATM, 
          MAX(CASE WHEN 1=1 AND  D.PERIOADA IN (:pPERIOADA) THEN D.CAEM2 ELSE NULL END)CAEM2, 
          MAX(CASE WHEN 1=1 AND  D.PERIOADA IN (:pPERIOADA) THEN D.RIND ELSE NULL END) TRIM_2
          
          
          
        FROM CIS2.VW_DATA_ALL D
                INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO 
                        AND R.CUIIO_VERS  = D.CUIIO_VERS  
                        INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM
          
      WHERE 
        D.capitol=1199
        AND D.PERIOADA IN (:pPERIOADA)
        AND D.FORM IN (74)
        AND D.RIND NOT IN ('-','CD','PHONE')
     --   AND D.CUIIO  IN (41569485)
        
        GROUP BY 
          D.CUIIO
         
          ) L  LEFT JOIN (
          
          SELECT DISTINCT 
          D.CUIIO,
          MAX(CASE WHEN 1=1 AND  D.PERIOADA IN (:pPERIOADA-1) THEN R.DENUMIRE ELSE NULL END)DENUMIRE, 
          MAX(CASE WHEN 1=1 AND  D.PERIOADA IN (:pPERIOADA-1) THEN R.CUATM ELSE NULL END)CUATM, 
          MAX(CASE WHEN 1=1 AND  D.PERIOADA IN (:pPERIOADA-1) THEN D.CAEM2 ELSE NULL END)CAEM2, 
          MAX(CASE WHEN 1=1 AND  D.PERIOADA IN (:pPERIOADA-1) THEN D.RIND ELSE NULL END) TRIM_1
          
          
          
        FROM CIS2.VW_DATA_ALL D
                INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO 
                        AND R.CUIIO_VERS  = D.CUIIO_VERS  
                        INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM
          
      WHERE 
        D.capitol=1199
        AND D.PERIOADA IN (:pPERIOADA-1)
        AND D.FORM IN (74)
        AND D.RIND NOT IN ('-','CD','PHONE')
     --   AND D.CUIIO  IN (41569485)
        
        GROUP BY 
          D.CUIIO
          ) R ON R.CUIIO = L.CUIIO 
          
              
        

