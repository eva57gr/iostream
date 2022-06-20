  SELECT 
         D.ANUL,
         D.CUIIO,
         R.DENUMIRE,
         D.CUATM,
         D.CAEM2,
         D.FORM,
         D.CAPITOL_DEN,
         D.RIND,
         SUM(D.COL1) AS COL1,
         SUM(D.COL2) AS COL2,
         SUM(D.COL3) AS COL3,
         SUM(D.COL4) AS COL4,
         SUM(D.COL5) AS COL5,
         SUM(D.COL6) AS COL6,
         SUM(D.COL7) AS COL7,
         SUM(D.COL8) AS COL8,
         SUM(D.COL9) AS COL9,
         SUM(D.COL10) AS COL10
            
            
            FROM CIS.VW_DATA_ALL D
            
            
                            INNER JOIN CIS.RENIM R ON 
                            R.CUIIO = D.CUIIO AND 
                            R.CUIIO_VERS = D.CUIIO_VERS  
            
            WHERE 
            D.PERIOADA IN (:pPERIOADA)
            AND D.FORM IN (:pFORM)
            
            
            
            GROUP BY 
         D.ANUL,
         D.CUIIO,
         R.DENUMIRE,
         D.CUATM,
         D.CAEM2,
         D.FORM,
         D.CAPITOL_DEN,
         D.RIND
         
         
         ORDER BY 
         D.CUIIO,
         D.RIND