SELECT 
        DISTINCT      
        D.CUIIO,
        R.DENUMIRE,
        R.CUATM,
        D.CAEM2, 
        SUM (CASE WHEN D.CAPITOL IN (0) AND RIND IN ('CD') THEN D.COL1 ELSE 0 END ) AS COL1,
        
        SUM (CASE WHEN D.CAPITOL IN (2) AND RIND IN ('0300') THEN D.COL1 ELSE 0 END )   AS RIND_0300,
        SUM (CASE WHEN D.CAPITOL IN (2) AND RIND IN ('0310') THEN D.COL1 ELSE 0 END )   AS RIND_0310        
        FROM CIS.VW_DATA_ALL D 
        
                        INNER JOIN CIS.RENIM R ON R.CUIIO = D.CUIIO
                        AND R.CUIIO_VERS = D.CUIIO_VERS  
           
                 
        WHERE 
            D.FORM IN (1) AND
           
             D.PERIOADA IN (:pPERIOADA)
             
             AND D.CAEM2 LIKE 'G46%'
          --   AND D.CUIIO = 297922 
            
 

GROUP BY 
      D.CUIIO,
        R.DENUMIRE,
        R.CUATM,
        D.CAEM2 
        
        HAVING 
        
        SUM (CASE WHEN D.CAPITOL IN (0) AND RIND IN ('CD') THEN D.COL1 ELSE 0 END )  > 20 
        
        ORDER BY
         SUM (CASE WHEN D.CAPITOL IN (2) AND RIND IN ('0300') THEN D.COL1 ELSE 0 END ) DESC