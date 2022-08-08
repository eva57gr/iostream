SELECT
L.CUIIO,
L.CUATM,
L.CAEM_ASA,
R.CAEM  CAEM_SF, 
L.CAEM_PRODMOLD,
L.CAEM_ASA_2,
L.R400_COL1,
L.R400_COL2,
R.NUM_MEDIU, 
L.R150_COL1,
R.COL1 RIN_010_COL1,
R.COL2 RIN_010_COL2
 

FROM 



(

  SELECT       
               DISTINCT  
               D.CUIIO,
               D.CUATM,
               MAX(CASE WHEN D.CAPITOL = 1129  AND D.RIND IN ('8') THEN D.COL31 ELSE NULL END )    AS CAEM_ASA,
               D.CUATM_FULL,
               DD.CAEM2  CAEM_PRODMOLD,
               CI.CAEM2 CAEM_5CI,
               
               MAX(CASE WHEN D.CAPITOL = 1129  AND D.RIND IN ('8') THEN D.COL31 ELSE NULL END )    AS CAEM_ASA_2,
              
               SUM(CASE WHEN D.CAPITOL = 1127  AND D.RIND IN ('400') THEN D.COL3 ELSE NULL END )    AS R400_COL1, 
               SUM(CASE WHEN D.CAPITOL = 1127  AND D.RIND IN ('400') THEN D.COL4 ELSE NULL END )    AS R400_COL2,  
                SUM(CASE WHEN D.CAPITOL = 1124  AND D.RIND IN ('150') THEN D.COL1 ELSE NULL END )    AS R150_COL1
               
           FROM  CIS2.VW_DATA_ALL D LEFT JOIN USER_BANCU.PROD_2021 DD ON DD.CUIIO = D.CUIIO  
           
                                    LEFT JOIN USER_BANCU.VW_KATALOG_5_CI_1051 CI ON CI.CUIIO = D.CUIIO     
           
                                  
           
           WHERE 
           D.FORM = 64
           AND D.PERIOADA = 2010 
                               
                        
                         
        GROUP BY 
         D.CUIIO,
               D.CUATM,
               D.CUATM_FULL,
               DD.CAEM2,
               CI.CAEM2
        
        ORDER BY 
        D.CUATM_FULL
        
         )  L LEFT JOIN (
         
         







                SELECT
                D.CUIIO, 
                D.FORM  AS RSF1,
                MAX(CASE WHEN D.FORM = 57 AND D.CAPITOL IN (1091) AND D.RIND IN ('6') THEN  D.COL1 ELSE NULL END) AS NUM_MEDIU,
                MAX(CASE WHEN D.FORM = 57 AND D.CAPITOL IN (1091) AND D.RIND IN ('CAEM') THEN  D.COL1 ELSE NULL END) AS CAEM,
                SUM(CASE WHEN D.FORM = 57 AND D.CAPITOL IN (1092) AND D.RIND IN ('010')   THEN  D.COL1 ELSE NULL END) AS COL1,
                SUM(CASE WHEN D.FORM = 57 AND D.CAPITOL IN (1092) AND D.RIND IN ('010')   THEN  D.COL2 ELSE NULL END) AS COL2 
                
                FROM CIS2.VW_DATA_ALL_FR D 
                 
                WHERE 
                
                D.PERIOADA IN (2010)
                AND D.CAPITOL IN (1091,1092)
                AND D.FORM = 57 
                
                GROUP BY 
                D.CUIIO,
                D.FORM 
                
                ORDER BY 
                D.CUIIO 
         ) R ON R.CUIIO = L.CUIIO 
         
         
--         WHERE 
--         
--         R.CUIIO IS NULL 