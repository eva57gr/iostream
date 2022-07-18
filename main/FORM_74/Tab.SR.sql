--INSERT INTO CIS2.TABLE_OUT 
--(
--  PERIOADA,
--  FORM,
--  FORM_VERS,
--  ID_MDTABLE,
--  COD_CUATM,
--  NR_SECTIE,
--  NUME_SECTIE,
--  NR_SECTIE1,
--  NUME_SECTIE1,
--  NR_SECTIE2,
--  NUME_SECTIE2,
--  NR_ROW,
--  ORDINE,
--  DECIMAL_POS,
--  NUME_ROW,  
--  COL1, COL2, COL3,COL4,COL5, COL6, COL7, COL8
--)

SELECT 
:pPERIOADA AS PERIOADA,
:pFORM AS FORM,
:pFORM_VERS AS FORM_VERS,
:pID_MDTABLE AS ID_MDTABLE,
:pCOD_CUATM AS COD_CUATM,    
'0' AS NR_SECTIE,
'0' AS NUME_SECTIE,
'0' AS NR_SECTIE1,
'0' AS NUME_SECTIE1,
'0' AS NR_SECTIE2,
'0' AS NUME_SECTIE2, 
ROWNUM  NR_ROW,
ROWNUM AS ORDINE,
'00000000' AS DECIMAL_POS, 
NUME_ROW,
COL1,COL2, COL3,COL4,COL5,COL6, COL7, COL8
FROM
(





                    SELECT 
                    CC.CODUL NR_ROW , 
                    CC.DENUMIRE NUME_ROW,      
                    CC.FULL_CODE,
                    COUNT(DISTINCT CASE WHEN  D.CUIIO = D.CUIIO THEN  D.CUIIO ELSE NULL END) AS COL1,              
                    COUNT(DISTINCT CASE WHEN D.CAPITOL  = 1199 AND D.RIND IN ('1') THEN  D.CUIIO ELSE NULL END) AS COL2,
                    COUNT(DISTINCT CASE WHEN D.CAPITOL  = 1199 AND D.RIND IN ('2') THEN  D.CUIIO ELSE NULL END) AS COL3,
                    COUNT(DISTINCT CASE WHEN D.CAPITOL  = 1199 AND D.RIND IN ('3') THEN  D.CUIIO ELSE NULL END) AS COL4,
                    COUNT(DISTINCT CASE WHEN D.CAPITOL  = 1199 AND D.RIND IN ('4') THEN  D.CUIIO ELSE NULL END) AS COL5,
                    COUNT(DISTINCT CASE WHEN D.CAPITOL  = 1199 AND D.RIND IN ('5') THEN  D.CUIIO ELSE NULL END) AS COL6,
                    COUNT(DISTINCT CASE WHEN D.CAPITOL  = 1199 AND D.RIND IN ('6') THEN  D.CUIIO ELSE NULL END) AS COL7,
                    COUNT(DISTINCT CASE WHEN D.CAPITOL  = 1199 AND D.RIND IN ('7') THEN  D.CUIIO ELSE NULL END) AS COL8
                    FROM CIS2.VW_DATA_ALL D 
                    
                    INNER JOIN  CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
                    INNER JOIN  CIS2.VW_CL_CUATM CC ON C.FULL_CODE LIKE '%'||CC.CODUL||';%' 
                                     
                     
 
                    
                    WHERE
                   (D.FORM=:pFORM) AND
                   (D.FORM_VERS=:pFORM_VERS) AND
                  
                   (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND   
                    D.PERIOADA IN (:pPERIOADA) AND
                    D.FORM IN (74) 
                    AND CC.PRGS IN ('2') 
                    
                    GROUP BY 
                    CC.CODUL,
                    CC.DENUMIRE,
                    CC.FULL_CODE
                    
                    ORDER BY 
                    CC.FULL_CODE
                      )