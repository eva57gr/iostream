SELECT
D.CUIIO,
D.DENUMIRE,
D.CUATM,
SUM(D.COL1) AS COL1,
SUM(D.COL2) AS COL2,
SUM(D.COL3) AS COL3,
SUM(D.COL4) AS COL4,
SUM(D.COL5) AS COL5

FROM        
        (
        SELECT
                D.CUIIO,
                R.DENUMIRE,
                D.CUATM,
                C.FULL_CODE,
                SUM(CASE WHEN D.RIND IN ('1110','1150') THEN D.COL4 ELSE NULL END ) AS COL1,
                SUM(CASE WHEN D.RIND IN ('1190') THEN D.COL3 ELSE NULL END ) AS COL2,
                SUM(CASE WHEN D.RIND IN ('1430') THEN D.COL4 ELSE NULL END ) AS COL3,
                SUM(CASE WHEN D.RIND IN ('1130','1160') THEN D.COL4 ELSE NULL END ) AS COL4,
                SUM(CASE WHEN D.RIND IN ('1450','1460') THEN D.COL4 ELSE NULL END ) AS COL5
       
              
                
                FROM CIS2.VW_DATA_ALL D
                
                        INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS
                        INNER JOIN CIS2.MD_CAPITOL MR ON MR.CAPITOL = D.CAPITOL AND MR.CAPITOL_VERS = D.CAPITOL_VERS  
                        INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
            
                    WHERE 
                    D.PERIOADA IN (1063)
                    AND D.FORM IN (45)
                    AND MR.DEN_SHORT IN ('Cap.I')
                    AND MR.capitol=399 AND MR.capitol_vers=1063
                    
                 --   AND D.CUIIO = 399344
                   
                GROUP BY
                
                D.CUIIO,
                R.DENUMIRE,
                D.CUATM,
                C.FULL_CODE
        

HAVING 
--SUM(COL1) IS NOT NULL OR SUM(COL2) IS NOT NULL OR SUM(COL3) IS NOT NULL
--OR SUM(COL4) IS NOT NULL OR SUM(COL5) IS NOT NULL
 
NVAL(SUM(COL1)) + NVAL(SUM(COL2)) + NVAL(SUM(COL3)) + NVAL(SUM(COL4)) + NVAL(SUM(COL5)) <> 0      



  
                ORDER BY
                C.FULL_CODE,
                D.CUIIO
                
) D
                
        
 INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
       
 GROUP BY
 D.CUIIO,
D.DENUMIRE,
D.CUATM,
C.FULL_CODE               

HAVING
NVAL(SUM(D.COL1)) + NVAL(SUM(D.COL2)) + NVAL(SUM(D.COL3)) + NVAL(SUM(D.COL4)) + NVAL(SUM(D.COL5)) <> 0  

 ORDER BY
                C.FULL_CODE
