--INSERT INTO TABLE_OUT 
--(
--    PERIOADA,
--    FORM,
--    FORM_VERS,
--    ID_MDTABLE,
--    COD_CUATM,
--    NR_SECTIE,
--    NUME_SECTIE,
--    NR_SECTIE1,
--    NUME_SECTIE1,
--    NR_SECTIE2,
--    NUME_SECTIE2,
--    NR_ROW,
--    ORDINE,
--    DECIMAL_POS,
--    NUME_ROW,
--    COL1, 
--    COL2,
--    COL3,
--    COL4,
--    COL5
--)
 -- 04 ROWS  AND 5 COLUMNS  
 

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
         DC.NR_ROW AS NR_ROW,
         DC.ORDINE AS  ORDINE,
        '00000'AS DECIMAL_POS,
         DC.NUME_ROW AS NUME_ROW,       
        CASE WHEN  DC.COL1 = 0 THEN NULL ELSE DC.COL1 END AS COL1,
        CASE WHEN  DC.COL2 = 0 THEN NULL ELSE DC.COL2 END AS COL2,
        CASE WHEN  DC.COL3 = 0 THEN NULL ELSE DC.COL3 END AS COL3,
        CASE WHEN  DC.COL4 = 0 THEN NULL ELSE DC.COL4 END AS COL4,
        CASE WHEN  DC.COL5 = 0 THEN NULL ELSE DC.COL5 END AS COL5
       
        
        
       ---- 04 ROWS  AND 5 COLUMNS  
        
    FROM 
  (  -- ROWS 1 
SELECT
     :pID_MDTABLE -1,
     :pCOD_CUATM AS COD_CUATM,
     '01' AS NR_ROW,
      1  AS ORDINE,
       'Total' AS NUME_ROW, 
       CIS2.NVAL(COUNT(DISTINCT CASE WHEN  D.CAPITOL IN (1004) AND D.RIND_VERS IN (2011)  AND  NT.CODUL <> '6' THEN D.CUIIO ELSE NULL END))  AS  COL1, 
       CIS2.NVAL(SUM(CASE WHEN  D.CAPITOL IN (1001) AND D.RIND IN ('010')  THEN D.COL1 ELSE NULL END))   AS   COL2,
       CIS2.NVAL(SUM(CASE WHEN  D.CAPITOL IN (1001) AND D.RIND IN ('010')  THEN D.COL2 ELSE NULL END))   AS   COL3,
       CIS2.NVAL(SUM(CASE WHEN  D.CAPITOL IN (1002) AND D.RIND IN ('010')  THEN D.COL1 ELSE NULL END))   AS   COL4,
       CIS2.NVAL(SUM(CASE WHEN  D.CAPITOL IN (1004) AND D.RIND_VERS IN (2011)  AND D.RIND IN ('030')  THEN D.COL1 ELSE NULL END))   AS   COL5
      
      
       FROM    
             CIS2.VW_DATA_ALL D    
               INNER JOIN CIS2.MD_RIND R ON (
               --R.RIND = D.RIND AND R.CAPITOL=D.CAPITOL AND R.CAPITOL_VERS=D.CAPITOL_VERS AND R.RIND_VERS=D.RIND_VERS
               R.ID_MD = D.ID_MD
               )       
               ------------------------------------------------------------------------------------------------------------------------------------
               INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS)                             
               INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL)
               
               
               
               WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17 AND
               D.CAPITOL IN (1001,1002,1004)
               
 UNION 
 --ROWS 2
 SELECT
     :pID_MDTABLE -1,
     :pCOD_CUATM AS COD_CUATM,
     '02' AS NR_ROW,
      2  AS ORDINE,
     'Proprietate publica' AS NUME_ROW, 
      CIS2.NVAL(COUNT(DISTINCT CASE WHEN CD.CFP LIKE '%' ||RN.CFP||'%' AND  D.CAPITOL IN (1004) AND D.RIND_VERS IN (2011)  AND  NT.CODUL <> '6' THEN D.CUIIO ELSE NULL END))    AS   COL1, 
      CIS2.NVAL(SUM(CASE WHEN CD.CFP LIKE '%' ||RN.CFP||'%' AND D.CAPITOL IN (1001) AND D.RIND IN ('010')  THEN D.COL1 ELSE NULL END))   AS   COL2,
      CIS2.NVAL(SUM(CASE WHEN CD.CFP LIKE '%' ||RN.CFP||'%' AND D.CAPITOL IN (1001) AND D.RIND IN ('010')  THEN D.COL2 ELSE NULL END))   AS   COL3,
      CIS2.NVAL(SUM(CASE WHEN CD.CFP LIKE '%' ||RN.CFP||'%' AND D.CAPITOL IN (1002) AND D.RIND IN ('010')  THEN D.COL1 ELSE NULL END))   AS   COL4,
      CIS2.NVAL(SUM(CASE WHEN CD.CFP LIKE '%' ||RN.CFP||'%' AND D.CAPITOL IN (1004) AND D.RIND_VERS IN (2011)  AND D.RIND IN ('030')  THEN D.COL1 ELSE NULL END))   AS   COL5
      
       FROM    
             CIS2.VW_DATA_ALL D    
                      
               INNER JOIN CIS2.RENIM RN ON (RN.CUIIO= D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS)                             
               INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL)
               ------------------------------------------------------------------------------------
               
               INNER JOIN CIS2.VW_CL_CFP CP ON (RN.CFP = CP.CODUL) 
  CROSS JOIN
  (     
    --SELECT 'Forme de Proprietate - Total pe Republica' AS NUME_ROW,            '01' AS NR_ROW, '11-12-13-14-15-16-17-18-19-20-22-23-24-25-26-27-28-29' AS CFP FROM DUAL UNION
    SELECT 'Proprietate proprietatea publica' AS NUME_ROW,                    '02' AS NR_ROW, '11-12-13'          AS CFP FROM DUAL --UNION 
   -- SELECT 'Proprietate proprietatea privata - total' AS NUME_ROW,            '03' AS NR_ROW, '14-15-16-17-18-19-29' AS CFP FROM DUAL --UNION     
    --SELECT 'Proprietate proprietatea mixta (publica si privata)' AS NUME_ROW, '04' AS NR_ROW, '20'                AS CFP FROM DUAL UNION 
    --SELECT 'Proprietate proprietatea straina' AS NUME_ROW,                    '05' AS NR_ROW, '22-23-24-25-26-27' AS CFP FROM DUAL UNION 
    --SELECT 'Proprietate a intreprinderilor mixte' AS NUME_ROW,                '06' AS NR_ROW, '28'                AS CFP FROM DUAL    

  ) CD
               
--               INNER JOIN CIS2.VW_CL_CFP CC ON  (CC.CODUL=D.CFP)
--               INNER JOIN CIS2.VW_CL_CFP CFP ON (CC.FULL_CODE LIKE '%'||CFP.CODUL||';%')
--               
               WHERE  
               
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17 AND
               D.CAPITOL IN (1001,1002,1004) 
               
--               AND 
--               CIS2.CFP.GRUPA IN (11)
              
 UNION 
 --ROWS 3               
 
 SELECT
     :pID_MDTABLE -1,
     :pCOD_CUATM AS COD_CUATM,
     '03' AS NR_ROW,
      3  AS ORDINE,
     'Proprietate privata' AS NUME_ROW, 
     CIS2.NVAL(COUNT(DISTINCT CASE WHEN CD.CFP LIKE '%' ||RN.CFP||'%' AND D.CAPITOL IN (1004) AND D.RIND_VERS IN (2011)  AND  NT.CODUL <> '6' THEN D.CUIIO ELSE NULL END))    AS   COL1, 
     CIS2.NVAL(SUM(CASE WHEN CD.CFP LIKE '%' ||RN.CFP||'%' AND D.CAPITOL IN (1001) AND D.RIND IN ('010')  THEN D.COL1 ELSE NULL END))   AS   COL2,
     CIS2.NVAL(SUM(CASE WHEN CD.CFP LIKE '%' ||RN.CFP||'%' AND D.CAPITOL IN (1001) AND D.RIND IN ('010')  THEN D.COL2 ELSE NULL END))   AS   COL3,
     CIS2.NVAL(SUM(CASE WHEN CD.CFP LIKE '%' ||RN.CFP||'%' AND D.CAPITOL IN (1002) AND D.RIND IN ('010')  THEN D.COL1 ELSE NULL END))   AS   COL4,
     CIS2.NVAL(SUM(CASE WHEN CD.CFP LIKE '%' ||RN.CFP||'%' AND D.CAPITOL IN (1004) AND D.RIND_VERS IN (2011)  AND D.RIND IN ('030')  THEN D.COL1 ELSE NULL END))   AS   COL5
      
       FROM    
             CIS2.VW_DATA_ALL D    
                      
               INNER JOIN CIS2.RENIM RN ON (RN.CUIIO= D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS)                             
               INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL)
-----------------------------------------------------------------------------------------------------------------
              INNER JOIN CIS2.VW_CL_CFP CP ON (RN.CFP = CP.CODUL) 
  CROSS JOIN
  (     
    --SELECT 'Forme de Proprietate - Total pe Republica' AS NUME_ROW,            '01' AS NR_ROW, '11-12-13-14-15-16-17-18-19-20-22-23-24-25-26-27-28-29' AS CFP FROM DUAL UNION
    --SELECT 'Proprietate proprietatea publica' AS NUME_ROW,                    '02' AS NR_ROW, '11-12-13'          AS CFP FROM DUAL --UNION 
   SELECT 'Proprietate proprietatea privata - total' AS NUME_ROW,            '03' AS NR_ROW, '14-15-16-17-18-19-29' AS CFP FROM DUAL --UNION     
    --SELECT 'Proprietate proprietatea mixta (publica si privata)' AS NUME_ROW, '04' AS NR_ROW, '20'                AS CFP FROM DUAL UNION 
    --SELECT 'Proprietate proprietatea straina' AS NUME_ROW,                    '05' AS NR_ROW, '22-23-24-25-26-27' AS CFP FROM DUAL UNION 
    --SELECT 'Proprietate a intreprinderilor mixte' AS NUME_ROW,                '06' AS NR_ROW, '28'                AS CFP FROM DUAL    

  ) CD 
               
               
--               INNER JOIN CIS2.VW_CL_CFP CC ON  (CC.CODUL=D.CFP)
--               INNER JOIN CIS2.VW_CL_CFP CFP ON (CC.FULL_CODE LIKE '%'||CFP.CODUL||';%')
               
               
               WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17 AND
               D.CAPITOL IN (1001,1002,1004) 
               
--               AND 
--               CIS2.CFP.GRUPA IN (14)
 UNION 
 --ROWS 4
 
 SELECT
     :pID_MDTABLE -1,
     :pCOD_CUATM AS COD_CUATM,
     '04' AS NR_ROW,
      4  AS ORDINE,
     'Proprietate mixta' AS NUME_ROW, 
     CIS2.NVAL(COUNT(DISTINCT CASE WHEN   D.CAPITOL IN (1004) AND D.RIND_VERS IN (2011)  AND  NT.CODUL <> '6' THEN D.CUIIO ELSE NULL END))    AS   COL1, 
     CIS2.NVAL(SUM(CASE WHEN  D.CAPITOL IN (1001) AND D.RIND IN ('010')  THEN D.COL1 ELSE NULL END))   AS   COL2,
     CIS2.NVAL(SUM(CASE WHEN  D.CAPITOL IN (1001) AND D.RIND IN ('010')  THEN D.COL2 ELSE NULL END))   AS   COL3,
     CIS2.NVAL(SUM(CASE WHEN  D.CAPITOL IN (1002) AND D.RIND IN ('010')  THEN D.COL1 ELSE NULL END))   AS   COL4,
     CIS2.NVAL(SUM(CASE WHEN  D.CAPITOL IN (1004) AND D.RIND_VERS IN (2011)  AND D.RIND IN ('030')  THEN D.COL1 ELSE NULL END))   AS   COL5
      
       FROM    
             CIS2.VW_DATA_ALL D    
                      
               INNER JOIN CIS2.RENIM RN ON (RN.CUIIO= D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS)                             
               INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL)
               
               INNER JOIN CIS2.VW_CL_CFP CC ON  (CC.CODUL=D.CFP)
               INNER JOIN CIS2.VW_CL_CFP CFP ON (CC.FULL_CODE LIKE '%'||CFP.CODUL||';%')
               
               WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17 AND
               D.CAPITOL IN (1001,1002,1004) AND
               CIS2.CFP.GRUPA IN (16)
 
 ) DC 
 
                          
 
              ORDER BY DC.NR_ROW