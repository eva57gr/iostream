 SELECT DISTINCT 
          D.CUIIO,
          R.DENUMIRE, 
          R.CUATM,
          R.CAEM2,
          D.RIND,
          SUM(D.COL1) AS COL1,
          SUM(D.COL2) AS COL2
        FROM CIS2.VW_DATA_ALL D
                INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO 
                        AND R.CUIIO_VERS  = D.CUIIO_VERS  
                        INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM
          
      WHERE 
        D.capitol=1197
        AND D.PERIOADA IN (1053)
        AND D.FORM IN (74)
--        AND D.RIND IN ('8')
AND 
           
           (
           SUBSTR(R.CAEM2,2,5) NOT LIKE '1%'
           AND 
           SUBSTR(R.CAEM2,2,5) NOT LIKE '2%' 
           AND 
           SUBSTR(R.CAEM2,2,5) NOT LIKE '3%' 
            AND 
           SUBSTR(R.CAEM2,2,5) NOT LIKE '41%' 
          AND 
          SUBSTR(R.CAEM2,2,5) NOT LIKE '42%'
            AND 
           SUBSTR(R.CAEM2,2,5) NOT LIKE '43%'  
           
           ) 
        

--AND 
--D.RIND LIKE '%14%'
      --  AND D.CUIIO = 204346
        
        
        GROUP BY 
          D.CUIIO,
          R.DENUMIRE,
          R.CUATM,
          R.CAEM2,
          D.RIND 
        

ORDER BY 
D.CUIIO,
D.RIND
          
--         HAVING 
--         SUM(NVAL(D.COL1)) = 0
--         AND 
--         SUM((D.COL2)) = 0