--
--
--INSERT INTO TABLE_OUT 
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
-- COL1, COL2, COL3,COL4, COL5, COL6, COL7  
--)


SELECT 

    :pPERIOADA AS PERIOADA,
    :pFORM AS FORM,
    :pFORM_VERS AS FORM_VERS,
    :pID_MDTABLE AS ID_MDTABLE,
    :pCOD_CUATM AS COD_CUATM,
     CODUL AS NR_SECTIE,
     DENUMIRE AS NUME_SECTIE,
    '0' AS NR_SECTIE1,
    '0' AS NUME_SECTIE1,
    '0' AS NR_SECTIE2,
    '0' AS NUME_SECTIE2,
     ROWNUM   NR_ROW,
     ROWNUM   ORDINE,
    '00000000' AS DECIMAL_POS,
     NUME_ROW,
     CUIIO COL1,
     COL1 COL2,
     COL2 COL3,
     COL3 COL4,
     COL4 COL5,
     COL5 COL6,
     COL6 COL7

FROM 
(
SELECT 
        1 ORDINE, 
        CODUL,
        DENUMIRE,
        FULL_CODE,
        0000000 CUIIO,
        'Total' AS NUME_ROW,
        SUM(COL1) AS COL1,
        SUM(COL2) AS COL2,
        SUM(COL3) AS COL3,
        SUM(COL4) AS COL4,
        SUM(COL5) AS COL5,
        SUM(COL6) AS COL6
        FROM
        
(

SELECT  
                           CC.CODUL,
                           CC.DENUMIRE,
                           CC.FULL_CODE,
                           D.CUIIO,
                           MAX(R.DENUMIRE)  NUME_ROW,
                           SUM(CASE WHEN MR.CAPITOL IN (1022) AND MR.RIND IN ('19') THEN D.COL14 ELSE NULL END ) AS COL1, 
                           SUM(CASE WHEN MR.CAPITOL IN (1031) AND MR.RIND IN ('01') THEN D.COL1 ELSE NULL END )  AS COL2, 
                           SUM(CASE WHEN MR.CAPITOL IN (1031) AND MR.RIND IN ('02') THEN D.COL1 ELSE NULL END )  AS COL3,
                           SUM(CASE WHEN MR.CAPITOL IN (1031) AND MR.RIND IN ('03') THEN D.COL1 ELSE NULL END )  AS COL4,
                           SUM(CASE WHEN MR.CAPITOL IN (1031) AND MR.RIND IN ('16') THEN D.COL1 ELSE NULL END )  AS COL5,
                           SUM(CASE WHEN MR.CAPITOL IN (1032) AND MR.RIND IN ('070') THEN D.COL1 ELSE NULL END )  AS COL6
                              
                        FROM CIS2.DATA_ALL D
                              
                                INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS
                                INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM
                                INNER JOIN CIS2.VW_CL_CUATM CC ON C.FULL_CODE LIKE '%'||CC.CODUL||';%'
                                INNER JOIN CIS2.MD_RIND MR  ON   MR.ID_MD =D.ID_MD 
                                
                                
                                
                         WHERE 
                         
                         D.PERIOADA IN (:pPERIOADA)  
                         AND D.FORM IN (:pFORM) 
                         AND  (D.FORM_VERS =:pFORM_VERS) AND 
                         (:pID_MDTABLE=:pID_MDTABLE)  AND 
                         D.FORM = 40  
                      
                        AND   (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
                        AND CC.PRGS IN ('2') 
                        AND CC.CODUL  NOT IN ('1111111','2222222','3333333')
                   
                        
                        GROUP BY 
                        D.CUIIO,
                        CC.CODUL,
                        CC.DENUMIRE,
                        CC.FULL_CODE

                        ORDER BY
                        CC.FULL_CODE
                        
                        
                        
                       )
                        
                       
                       GROUP BY 
                        CODUL,
                        DENUMIRE,
                        FULL_CODE
                        
                        
                        UNION 
                        
                        
                        SELECT 
     2 ORDINE,
     CODUL,
     DENUMIRE,
     FULL_CODE,
     CUIIO,
     NUME_ROW,
     COL1,
     COL2,
     COL3,
     COL4,
     COL5,
     COL6
     FROM
            (

                     SELECT 
                           CC.CODUL,
                           CC.DENUMIRE,
                           CC.FULL_CODE, 
                           D.CUIIO,
                           MAX(R.DENUMIRE)  NUME_ROW,
                           SUM(CASE WHEN MR.CAPITOL IN (1022) AND MR.RIND IN ('19') THEN D.COL14 ELSE NULL END ) AS COL1, 
                           SUM(CASE WHEN MR.CAPITOL IN (1031) AND MR.RIND IN ('01') THEN D.COL1 ELSE NULL END )  AS COL2, 
                           SUM(CASE WHEN MR.CAPITOL IN (1031) AND MR.RIND IN ('02') THEN D.COL1 ELSE NULL END )  AS COL3,
                           SUM(CASE WHEN MR.CAPITOL IN (1031) AND MR.RIND IN ('03') THEN D.COL1 ELSE NULL END )  AS COL4,
                           SUM(CASE WHEN MR.CAPITOL IN (1031) AND MR.RIND IN ('16') THEN D.COL1 ELSE NULL END )  AS COL5,
                           SUM(CASE WHEN MR.CAPITOL IN (1032) AND MR.RIND IN ('070') THEN D.COL1 ELSE NULL END )  AS COL6
                              
                        FROM CIS2.DATA_ALL D
                              
                                INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS
                                INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM
                                INNER JOIN CIS2.MD_RIND MR  ON   MR.ID_MD =D.ID_MD 
                                INNER JOIN CIS2.VW_CL_CUATM CC ON C.FULL_CODE LIKE '%'||CC.CODUL||';%'
                                
                                
                         WHERE 
                         
                         D.PERIOADA IN (:pPERIOADA)  
                         AND D.FORM IN (:pFORM) 
                         AND  (D.FORM_VERS =:pFORM_VERS) AND 
                         (:pID_MDTABLE=:pID_MDTABLE)  AND 
                         D.FORM = 40 
                      
                        AND   (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%')  
                        AND CC.PRGS IN ('2') 
                        AND CC.CODUL  NOT IN ('1111111','2222222','3333333','0000000')
                   --     AND D.CUIIO IN (7001770)  
                        
                        GROUP BY 
                        CC.CODUL,
                        CC.DENUMIRE,
                        CC.FULL_CODE,
                        D.CUIIO
                        
                        )
                        
                        
                        )
                        ORDER BY 
                        
                        ORDINE,
                        FULL_CODE