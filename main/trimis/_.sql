SELECT 
    CC.CODUL,
    CC.DENUMIRE,
    CC.FULL_CODE,
    COUNT (DISTINCT CASE WHEN D.COL1 IN ('EREPORTING') THEN D.CUIIO END) AS   EREPORTING,
    COUNT (DISTINCT CASE WHEN D.COL1 IN ('CIS2') THEN D.CUIIO END ) AS   CIS2
   FROM  VW_36_CNT D
   
                 INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
                 INNER JOIN CIS2.VW_CL_CUATM CC ON C.FULL_CODE LIKE '%'||CC.CODUL||';%'
                 
                 
                 
                 WHERE 
                 
                 D.CUIIO IS NOT NULL
                 
                 AND CC.PRGS IN ('2')
                 
                 GROUP BY 
                  CC.CODUL,
                  CC.DENUMIRE,
                  CC.FULL_CODE
                 
                 ORDER BY 
                 CC.FULL_CODE
                 
                 
                 ; 
                 
                 
                 
                 
                 
SELECT D.* 
   
   
   FROM  VW_36_CNT D