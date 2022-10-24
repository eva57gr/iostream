SELECT DISTINCT 
          D.CUIIO,
          R.DENUMIRE, 
          R.CUATM,
          R.CAEM2,
          SUBSTR(R.CAEM2,2,5) AS CAEM2_MOD,
      --    D.RIND,
        --  SUM(D.COL1) AS COL1,
          
          SUM(CASE WHEN D.RIND IN ('14') THEN NVAL(D.COL1)   ELSE 0 END)  AS RIND_14, 
          SUM(CASE WHEN D.RIND LIKE '15%' THEN NVAL(D.COL1)   ELSE 0 END) AS RIND_15
          
          FROM CIS2.VW_DATA_ALL D
                INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO 
                        AND R.CUIIO_VERS  = D.CUIIO_VERS  
                        INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM
          
          WHERE 
        D.capitol=1197
        AND D.PERIOADA IN (1053)
        AND D.FORM IN (74)
        
      --  AND D.CUIIO = 204346
        
        
        GROUP BY 
          D.CUIIO,
          R.DENUMIRE,
          R.CUATM,
          R.CAEM2 
        
          
          HAVING 
          
          SUM(CASE WHEN D.RIND IN ('14') THEN NVAL(D.COL1)   ELSE 0 END ) > 0 
          
          AND    
          
          
          SUM(CASE WHEN D.RIND LIKE '15%' THEN NVAL(D.COL1)   ELSE 0 END ) > 0 
          
        --  AND SUBSTR(R.CAEM2,2,5) NOT LIKE 'BETWEEN 10 AND 33%'
          
--           AND 
--           
--           (
--           SUBSTR(R.CAEM2,2,5) NOT LIKE '1%'
--           AND 
--           SUBSTR(R.CAEM2,2,5) NOT LIKE '2%' 
--           AND 
--           SUBSTR(R.CAEM2,2,5) NOT LIKE '3%' 
--            AND 
----           SUBSTR(R.CAEM2,2,5) NOT LIKE '41%' 
----            AND 
----           SUBSTR(R.CAEM2,2,5) NOT LIKE '42%'
----            AND 
--           SUBSTR(R.CAEM2,2,5) NOT LIKE '43%'  
--           
--           ) 
--           
           
     
--CUIIO BETWEEN 10 AND 33


          ORDER BY 
          R.CAEM2
--          D.CUIIO,
--         -- D.RIND,
--          R.CUATM 