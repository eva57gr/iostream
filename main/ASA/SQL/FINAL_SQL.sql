
SELECT 
    CUIIO,
    CASE WHEN FORM = 57 THEN 'RSF1'
         WHEN FORM = 63 THEN 'RSFPrescurtat' 
         ELSE TO_CHAR(FORM) END   AS  Raportul, 
    CUATM,
    CAEM_ASA,
    CAEM_SF, 
    CAEM_PRODMOLD,
    CAEM_ASA_2,
    R400_COL1,
    R400_COL2,
    NUM_MEDIU, 
    R150_COL1,
    RIN_010_COL1,
    RIN_010_COL2
   
FROM
(

SELECT 

D.CUIIO,
MAX(D.FORM) AS FORM,
MAX(D.CUATM) CUATM,
MAX(D.CAEM_ASA)  CAEM_ASA,
MAX(D.CAEM_SF) CAEM_SF, 
MAX(D.CAEM_PRODMOLD) CAEM_PRODMOLD,
MAX(D.CAEM_ASA_2) CAEM_ASA_2,
MAX(D.R400_COL1)  R400_COL1,
MAX(D.R400_COL2)  R400_COL2,
MAX(D.NUM_MEDIU)  NUM_MEDIU, 
MAX(D.R150_COL1) R150_COL1,
MAX(D.RIN_010_COL1) RIN_010_COL1,
MAX(D.RIN_010_COL2) RIN_010_COL2

FROM 
(



SELECT

L.CUIIO,
R.FORM,
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
               
           FROM  CIS2.VW_DATA_ALL D LEFT JOIN ( SELECT 
        DISTINCT CUIIO,
        CAEM2
        FROM  USER_BANCU.PROD_2021 
        
        ORDER BY 
        CUIIO) DD ON DD.CUIIO = D.CUIIO  
           
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
                D.FORM,
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
         
         
         
         UNION 
         
         
         
         SELECT

L.CUIIO,
R.FORM,
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
               
           FROM  CIS2.VW_DATA_ALL D LEFT JOIN ( SELECT 
        DISTINCT CUIIO,
        CAEM2
        FROM  USER_BANCU.PROD_2021 
        
        ORDER BY 
        CUIIO) DD ON DD.CUIIO = D.CUIIO  
           
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
                D.FORM,
                MAX(CASE WHEN D.FORM = 63 AND D.CAPITOL IN (1119) AND D.RIND IN ('3') THEN  D.COL1 ELSE NULL END) AS NUM_MEDIU,
                MAX(CASE WHEN D.FORM = 63 AND D.CAPITOL IN (1119) AND D.RIND IN ('CAEM') THEN  D.COL1 ELSE NULL END) AS CAEM,
                SUM(CASE WHEN D.FORM = 63 AND D.CAPITOL IN (1121) AND D.RIND IN ('010')   THEN  D.COL1 ELSE NULL END) AS COL1,
                SUM(CASE WHEN D.FORM = 63 AND D.CAPITOL IN (1121) AND D.RIND IN ('010')   THEN  D.COL2 ELSE NULL END) AS COL2 
                
                FROM CIS2.VW_DATA_ALL_FR D 
                 
                WHERE 
                
                D.PERIOADA IN (2010)
                AND D.CAPITOL IN (1119,1121)
                AND D.FORM = 63 
                --AND D.CUIIO = 2936183
                GROUP BY 
                D.CUIIO,
                D.FORM 
                
                ORDER BY 
                D.CUIIO 
         ) R ON R.CUIIO = L.CUIIO 
         



        ORDER BY 
        CUIIO 
        
        ) D
        
        
        
        
        GROUP BY 
        D.CUIIO
        

--D.CUATM,
--D.CAEM_ASA,
--D.CAEM_SF, 
--D.CAEM_PRODMOLD,
--D.CAEM_ASA_2,
--D.R400_COL1,
--D.R400_COL2,
--D.NUM_MEDIU, 
--D.R150_COL1,
--D.RIN_010_COL1,
--D.RIN_010_COL2,
--FORM



--HAVING 
--FORM  IS NOT NULL 
ORDER BY 
CUIIO
)


--)
--
--
--GROUP BY 
--CUIIO
--
--HAVING 
--
--COUNT (CUIIO)  = 1 
--ORDER BY 
--CUIIO