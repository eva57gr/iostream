  SELECT       
               DISTINCT  
               D.CUIIO,
               D.CUATM,
               MAX(CASE WHEN D.CAPITOL = 1129  AND D.RIND IN ('8') THEN D.COL31 ELSE NULL END )    AS CAEM_ASA,
               D.CUATM_FULL,
               DD.CAEM2  CAEM_PRODMOLD,
               CI.CAEM2 CAEM_5CI,
               
               MAX(CASE WHEN D.CAPITOL = 1129  AND D.RIND IN ('8') THEN D.COL31 ELSE NULL END )    AS CAEM_ASA,
              
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