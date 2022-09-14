

          SELECT DISTINCT 
          D.CUIIO,
          R.DENUMIRE, 
          R.CUATM, 
          D.RIND,
          SUM(D.COL1) AS COL1 
          
          FROM CIS2.VW_DATA_ALL D
                INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO 
                        AND R.CUIIO_VERS  = D.CUIIO_VERS  
                        INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM
          
          WHERE 
        D.capitol=1199
        AND D.PERIOADA IN (:pPERIOADA)
        AND D.FORM IN (:pFORM)
        
        
        GROUP BY 
          D.CUIIO,
          R.DENUMIRE,
          R.CUATM, 
          D.RIND
          
          ORDER BY 
          R.CUATM 