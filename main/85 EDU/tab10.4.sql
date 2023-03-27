INSERT INTO TABLE_OUT 
(
    PERIOADA,
    FORM,
    FORM_VERS,
    ID_MDTABLE,
    COD_CUATM,
    NR_SECTIE,
    NUME_SECTIE,
    NR_SECTIE1,
    NUME_SECTIE1,
    NR_SECTIE2,
    NUME_SECTIE2,
    NR_ROW,
    ORDINE,
    DECIMAL_POS,
    NUME_ROW,
    COL1, 
    COL2,
    COL3,
    COL4,
    COL5,
    COL6 
)
 -- 12 ROWS  AND 6 COLUMNS
  
SELECT  
        :pPERIOADA AS PERIOADA,
        :pFORM AS FORM,
        :pFORM_VERS AS FORM_VERS,
        :pID_MDTABLE AS ID_MDTABLE,
        :pCOD_CUATM AS COD_CUATM,
         DC.NR_SECTIE AS NR_SECTIE,
         DC.NUME_SECTIE AS NUME_SECTIE,
        '0' AS NR_SECTIE1,
        '0' AS NUME_SECTIE1,
        '0' AS NR_SECTIE2,
        '0' AS NUME_SECTIE2,
         DC.NR_ROW_CUATM AS NR_ROW,
         DC.ORDINE_CUATM AS  ORDINE,
        '000000'AS DECIMAL_POS,
         DC.NUME_ROW_CUATM AS NUME_ROW,       
        CASE WHEN  DC.COL1 = 0 THEN NULL ELSE DC.COL1 END AS COL1,
        CASE WHEN  DC.COL2 = 0 THEN NULL ELSE DC.COL2 END AS COL2,
        CASE WHEN  DC.COL3 = 0 THEN NULL ELSE DC.COL3 END AS COL3,
        CASE WHEN  DC.COL4 = 0 THEN NULL ELSE DC.COL4 END AS COL4,
        CASE WHEN  DC.COL5 = 0 THEN NULL ELSE DC.COL5 END AS COL5,
        CASE WHEN  DC.COL6 = 0 THEN NULL ELSE DC.COL6 END AS COL6
       

      -- 12 ROWS  AND 6 COLUMNS
      
      FROM 
  (  -- ROWS 1 
SELECT
     :pID_MDTABLE -1,
     :pCOD_CUATM AS COD_CUATM,
      CD.NR_ROW AS NR_SECTIE,
      CD.NUME_ROW AS NUME_SECTIE,
     '01' AS NR_ROW_CUATM,
      1  AS ORDINE_CUATM,
     'Total' AS NUME_ROW_CUATM,
      CIS2.NVAL(COUNT(DISTINCT CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1004) AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END))  AS  COL1, 
      CIS2.NVAL(ROUND(SUM(CASE WHEN   VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND     D.CAPITOL IN (1001)  AND  D.RIND IN ('010') THEN D.COL1 ELSE NULL END),1)) AS  COL2,
      
      CIS2.NVAL(ROUND(SUM(CASE WHEN   VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND    D.CAPITOL IN (1001)  AND  D.RIND IN ('010') THEN D.COL1 ELSE NULL END),1)) 
      - CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1001)  AND  D.RIND IN ('020') THEN D.COL1 ELSE NULL END),1))  AS  COL3,
      
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1001)  AND  D.RIND IN ('010') THEN D.COL2 ELSE NULL END),1))  AS  COL4,
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') THEN D.COL1 ELSE NULL END),1))  AS  COL5,
       
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('010')  THEN D.COL5 ELSE NULL END),1))   + 
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('010')  THEN D.COL6 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('010')  THEN D.COL7 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('010')  THEN D.COL8 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('010')  THEN D.COL9 ELSE NULL END),1)) AS  COL6
       
       FROM    
             CIS2.VW_DATA_ALL D    
                      
               INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS)  
               
               -------------------------------------------------------------------------------------                           
               INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL) --(NIÎP).(Col.6) <> 6 --- NT.CODUL <> 6  
               INNER JOIN CIS2.VW_CL_CUATM VC ON (VC.CODUL = RN.CUATM )  
               --------------------------------------------------------------------------------------------------        
  
  CROSS JOIN
                                    
  ( 
    SELECT 'Total' AS NUME_ROW,                                   '01' AS NR_ROW, '0000000' AS CUATM FROM DUAL UNION
    SELECT 'Mun. Chișinau' AS NUME_ROW,                           '02' AS NR_ROW, '0100000' AS CUATM FROM DUAL UNION 
    SELECT 'NORD' AS NUME_ROW,                                    '03' AS NR_ROW, '1111111' AS CUATM FROM DUAL UNION 
    SELECT 'Mun. Balți' AS NUME_ROW,                              '04' AS NR_ROW, '0300000' AS CUATM FROM DUAL UNION 
    SELECT 'Briceni' AS NUME_ROW,                                 '05' AS NR_ROW, '1400000' AS CUATM FROM DUAL UNION 
    SELECT 'Dondușeni' AS NUME_ROW,                               '06' AS NR_ROW, '3400000' AS CUATM FROM DUAL UNION 
    SELECT 'Drochia' AS NUME_ROW,                                 '07' AS NR_ROW, '3600000' AS CUATM FROM DUAL UNION 
    SELECT 'Edineț' AS NUME_ROW,                                  '08' AS NR_ROW, '4100000' AS CUATM FROM DUAL UNION 
    SELECT 'Falești' AS NUME_ROW,                                 '09' AS NR_ROW, '4300000' AS CUATM FROM DUAL UNION 
    SELECT 'Florești' AS NUME_ROW,                                '10' AS NR_ROW, '4500000' AS CUATM FROM DUAL UNION 
    SELECT 'Glodeni' AS NUME_ROW,                                 '11' AS NR_ROW, '4800000' AS CUATM FROM DUAL UNION
    SELECT 'Ocnița' AS NUME_ROW,                                  '12' AS NR_ROW, '6200000' AS CUATM FROM DUAL UNION 
    SELECT 'Rișcani' AS NUME_ROW,                                 '13' AS NR_ROW, '7100000' AS CUATM FROM DUAL UNION 
    SELECT 'Sîngerei' AS NUME_ROW,                                '14' AS NR_ROW, '7400000' AS CUATM FROM DUAL UNION 
    SELECT 'Soroca' AS NUME_ROW,                                  '15' AS NR_ROW, '7800000' AS CUATM FROM DUAL UNION 
    SELECT 'CENTRU' AS NUME_ROW,                                  '16' AS NR_ROW, '2222222' AS CUATM FROM DUAL UNION 
    SELECT 'Anenii Noi' AS NUME_ROW,                              '17' AS NR_ROW, '1000000' AS CUATM FROM DUAL UNION 
    SELECT 'Calarași' AS NUME_ROW,                                '18' AS NR_ROW, '2500000' AS CUATM FROM DUAL UNION 
    SELECT 'Criuleni' AS NUME_ROW,                                '19' AS NR_ROW, '3100000' AS CUATM FROM DUAL UNION 
    SELECT 'Dubăsari' AS NUME_ROW,                                '20' AS NR_ROW, '3800000' AS CUATM FROM DUAL UNION
    SELECT 'Hincești' AS NUME_ROW,                                '21' AS NR_ROW, '5300000' AS CUATM FROM DUAL UNION
    SELECT 'Ialoveni' AS NUME_ROW,                                '22' AS NR_ROW, '5500000' AS CUATM FROM DUAL UNION 
    SELECT 'Nisporeni' AS NUME_ROW,                               '23' AS NR_ROW, '6000000' AS CUATM FROM DUAL UNION 
    SELECT 'Orhei' AS NUME_ROW,                                   '24' AS NR_ROW, '6400000' AS CUATM FROM DUAL UNION 
    SELECT 'Rezina' AS NUME_ROW,                                  '25' AS NR_ROW, '6700000' AS CUATM FROM DUAL UNION 
    SELECT 'Strașeni' AS NUME_ROW,                                '26' AS NR_ROW, '8000000' AS CUATM FROM DUAL UNION 
    SELECT 'Șoldanești' AS NUME_ROW,                              '27' AS NR_ROW, '8300000' AS CUATM FROM DUAL UNION 
    SELECT 'Telenești' AS NUME_ROW,                               '28' AS NR_ROW, '8900000' AS CUATM FROM DUAL UNION 
    SELECT 'Ungheni' AS NUME_ROW,                                 '29' AS NR_ROW, '9200000' AS CUATM FROM DUAL UNION 
    SELECT 'SUD' AS NUME_ROW,                                     '30' AS NR_ROW, '3333333' AS CUATM FROM DUAL UNION 
    SELECT 'Basarabeasca' AS NUME_ROW,                            '31' AS NR_ROW, '1200000' AS CUATM FROM DUAL UNION
    SELECT 'Cahul' AS NUME_ROW,                                   '32' AS NR_ROW, '1700000' AS CUATM FROM DUAL UNION 
    SELECT 'Cantemir' AS NUME_ROW,                                '33' AS NR_ROW, '2100000' AS CUATM FROM DUAL UNION 
    SELECT 'Căușeni' AS NUME_ROW,                                 '34' AS NR_ROW, '2700000' AS CUATM FROM DUAL UNION 
    SELECT 'Cimișlia' AS NUME_ROW,                                '35' AS NR_ROW, '2900000' AS CUATM FROM DUAL UNION 
    SELECT 'Leova' AS NUME_ROW,                                   '36' AS NR_ROW, '5700000' AS CUATM FROM DUAL UNION 
    SELECT 'Ștefan Vodă' AS NUME_ROW,                             '37' AS NR_ROW, '8500000' AS CUATM FROM DUAL UNION 
    SELECT 'Taraclia' AS NUME_ROW,                                '38' AS NR_ROW, '8700000' AS CUATM FROM DUAL UNION 
    SELECT 'UAT Găgăuzia' AS NUME_ROW,                            '39' AS NR_ROW, '9600000' AS CUATM FROM DUAL UNION
    SELECT 'UAT dS Nistrului' AS NUME_ROW,                        '40' AS NR_ROW, '9800000' AS CUATM FROM DUAL UNION
    SELECT 'Mun.Bender' AS NUME_ROW,                              '41' AS NR_ROW, '0501000' AS CUATM FROM DUAL
      ) CD
      
               
               
               
                
                WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17 AND
               D.CAPITOL IN (1001,1002,1004)
               
               GROUP BY
               CD.NR_ROW,   
               CD.NUME_ROW
               
--               HAVING 
--               CIS2.NVAL(COUNT(DISTINCT CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1004)  AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END)) >0 OR 
--      CIS2.NVAL(ROUND(SUM(CASE WHEN   VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND     D.CAPITOL IN (1001)  AND  D.RIND IN ('010') THEN D.COL1 ELSE NULL END),1)) >0 OR
--      
--      CIS2.NVAL(ROUND(SUM(CASE WHEN   VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND    D.CAPITOL IN (1001)  AND  D.RIND IN ('010') THEN D.COL1 ELSE NULL END),1)) 
--      - CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1001)  AND  D.RIND IN ('020') THEN D.COL1 ELSE NULL END),1))  >0 OR
--      
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1001)  AND  D.RIND IN ('010') THEN D.COL2 ELSE NULL END),1))  >0 OR
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') THEN D.COL1 ELSE NULL END),1))  >0 OR
--       
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('010')  THEN D.COL5 ELSE NULL END),1))   + 
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('010')  THEN D.COL6 ELSE NULL END),1))   +
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('010')  THEN D.COL7 ELSE NULL END),1))   +
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('010')  THEN D.COL8 ELSE NULL END),1))   +
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('010')  THEN D.COL9 ELSE NULL END),1)) >0 
----                   
UNION
  -- ROWS 02               
             SELECT
     :pID_MDTABLE -1,
     :pCOD_CUATM AS COD_CUATM,
     CD.NR_ROW AS NR_SECTIE,
     CD.NUME_ROW AS NUME_SECTIE,
     '02' AS NR_ROW_CUATM,
      2  AS ORDINE_CUATM,
     'inclusiv cu destinaţie:generală' AS NUME_ROW_CUATM,
       CIS2.NVAL(COUNT(DISTINCT CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1004)  AND ND.CODUL = 1 AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END)) AS  COL1,
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND ND.CODUL = 1 THEN D.COL1 ELSE NULL END),1))  AS  COL2,
        CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND ND.CODUL = 1 THEN D.COL1 ELSE NULL END),1)) 
      - CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('020') AND ND.CODUL = 1 THEN D.COL1 ELSE NULL END),1))  AS  COL3, 
       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND ND.CODUL = 1 THEN D.COL2 ELSE NULL END),1))   AS  COL4, 
       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 1 THEN D.COL1 ELSE NULL END),1))  AS  COL5, 
       
       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 1 THEN D.COL5 ELSE NULL END),1))   + 
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 1 THEN D.COL6 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 1 THEN D.COL7 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 1 THEN D.COL8 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 1 THEN D.COL9 ELSE NULL END),1))  AS  COL6
       
       FROM    
             CIS2.VW_DATA_ALL D    
                      
               INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS)  
               ----------------------------------------------------------------------------------------------------                          
               INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL) --(NIÎP).(Col.6) <> 6 --- NT.CODUL <> 6  
               ----------------------------------------------------------------------------------------------------
               INNER JOIN CIS2.CL_N85_NDIIP ND ON (RN.N85_NDIIP=ND.CODUL) -- care (NIÎP).(Col.7) = 1 ---ND.CODUL = 1 
                INNER JOIN CIS2.VW_CL_CUATM VC ON (VC.CODUL = RN.CUATM )  
               --------------------------------------------------------------------------------------------------        
  
  CROSS JOIN
                                    
  ( 
    SELECT 'Total' AS NUME_ROW,                                   '01' AS NR_ROW, '0000000' AS CUATM FROM DUAL UNION
    SELECT 'Mun. Chișinau' AS NUME_ROW,                           '02' AS NR_ROW, '0100000' AS CUATM FROM DUAL UNION 
    SELECT 'NORD' AS NUME_ROW,                                    '03' AS NR_ROW, '1111111' AS CUATM FROM DUAL UNION 
    SELECT 'Mun. Balți' AS NUME_ROW,                              '04' AS NR_ROW, '0300000' AS CUATM FROM DUAL UNION 
    SELECT 'Briceni' AS NUME_ROW,                                 '05' AS NR_ROW, '1400000' AS CUATM FROM DUAL UNION 
    SELECT 'Dondușeni' AS NUME_ROW,                               '06' AS NR_ROW, '3400000' AS CUATM FROM DUAL UNION 
    SELECT 'Drochia' AS NUME_ROW,                                 '07' AS NR_ROW, '3600000' AS CUATM FROM DUAL UNION 
    SELECT 'Edineț' AS NUME_ROW,                                  '08' AS NR_ROW, '4100000' AS CUATM FROM DUAL UNION 
    SELECT 'Falești' AS NUME_ROW,                                 '09' AS NR_ROW, '4300000' AS CUATM FROM DUAL UNION 
    SELECT 'Florești' AS NUME_ROW,                                '10' AS NR_ROW, '4500000' AS CUATM FROM DUAL UNION 
    SELECT 'Glodeni' AS NUME_ROW,                                 '11' AS NR_ROW, '4800000' AS CUATM FROM DUAL UNION
    SELECT 'Ocnița' AS NUME_ROW,                                  '12' AS NR_ROW, '6200000' AS CUATM FROM DUAL UNION 
    SELECT 'Rișcani' AS NUME_ROW,                                 '13' AS NR_ROW, '7100000' AS CUATM FROM DUAL UNION 
    SELECT 'Sîngerei' AS NUME_ROW,                                '14' AS NR_ROW, '7400000' AS CUATM FROM DUAL UNION 
    SELECT 'Soroca' AS NUME_ROW,                                  '15' AS NR_ROW, '7800000' AS CUATM FROM DUAL UNION 
    SELECT 'CENTRU' AS NUME_ROW,                                  '16' AS NR_ROW, '2222222' AS CUATM FROM DUAL UNION 
    SELECT 'Anenii Noi' AS NUME_ROW,                              '17' AS NR_ROW, '1000000' AS CUATM FROM DUAL UNION 
    SELECT 'Calarași' AS NUME_ROW,                                '18' AS NR_ROW, '2500000' AS CUATM FROM DUAL UNION 
    SELECT 'Criuleni' AS NUME_ROW,                                '19' AS NR_ROW, '3100000' AS CUATM FROM DUAL UNION 
    SELECT 'Dubăsari' AS NUME_ROW,                                '20' AS NR_ROW, '3800000' AS CUATM FROM DUAL UNION
    SELECT 'Hincești' AS NUME_ROW,                                '21' AS NR_ROW, '5300000' AS CUATM FROM DUAL UNION
    SELECT 'Ialoveni' AS NUME_ROW,                                '22' AS NR_ROW, '5500000' AS CUATM FROM DUAL UNION 
    SELECT 'Nisporeni' AS NUME_ROW,                               '23' AS NR_ROW, '6000000' AS CUATM FROM DUAL UNION 
    SELECT 'Orhei' AS NUME_ROW,                                   '24' AS NR_ROW, '6400000' AS CUATM FROM DUAL UNION 
    SELECT 'Rezina' AS NUME_ROW,                                  '25' AS NR_ROW, '6700000' AS CUATM FROM DUAL UNION 
    SELECT 'Strașeni' AS NUME_ROW,                                '26' AS NR_ROW, '8000000' AS CUATM FROM DUAL UNION 
    SELECT 'Șoldanești' AS NUME_ROW,                              '27' AS NR_ROW, '8300000' AS CUATM FROM DUAL UNION 
    SELECT 'Telenești' AS NUME_ROW,                               '28' AS NR_ROW, '8900000' AS CUATM FROM DUAL UNION 
    SELECT 'Ungheni' AS NUME_ROW,                                 '29' AS NR_ROW, '9200000' AS CUATM FROM DUAL UNION 
    SELECT 'SUD' AS NUME_ROW,                                     '30' AS NR_ROW, '3333333' AS CUATM FROM DUAL UNION 
    SELECT 'Basarabeasca' AS NUME_ROW,                            '31' AS NR_ROW, '1200000' AS CUATM FROM DUAL UNION
    SELECT 'Cahul' AS NUME_ROW,                                   '32' AS NR_ROW, '1700000' AS CUATM FROM DUAL UNION 
    SELECT 'Cantemir' AS NUME_ROW,                                '33' AS NR_ROW, '2100000' AS CUATM FROM DUAL UNION 
    SELECT 'Căușeni' AS NUME_ROW,                                 '34' AS NR_ROW, '2700000' AS CUATM FROM DUAL UNION 
    SELECT 'Cimișlia' AS NUME_ROW,                                '35' AS NR_ROW, '2900000' AS CUATM FROM DUAL UNION 
    SELECT 'Leova' AS NUME_ROW,                                   '36' AS NR_ROW, '5700000' AS CUATM FROM DUAL UNION 
    SELECT 'Ștefan Vodă' AS NUME_ROW,                             '37' AS NR_ROW, '8500000' AS CUATM FROM DUAL UNION 
    SELECT 'Taraclia' AS NUME_ROW,                                '38' AS NR_ROW, '8700000' AS CUATM FROM DUAL UNION 
    SELECT 'UAT Găgăuzia' AS NUME_ROW,                            '39' AS NR_ROW, '9600000' AS CUATM FROM DUAL UNION
    SELECT 'UAT dS Nistrului' AS NUME_ROW,                        '40' AS NR_ROW, '9800000' AS CUATM FROM DUAL UNION
    SELECT 'Mun.Bender' AS NUME_ROW,                              '41' AS NR_ROW, '0501000' AS CUATM FROM DUAL
      ) CD
       
                
                WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17 AND
               D.CAPITOL IN (1001,1002,1004) 
               
               GROUP BY
               CD.NR_ROW,   
               CD.NUME_ROW 
               
--               HAVING 
--               CIS2.NVAL(COUNT(DISTINCT CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1004) AND ND.CODUL = 1 AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END)) >0 OR 
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND ND.CODUL = 1 THEN D.COL1 ELSE NULL END),1))  >0 OR 
--        CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND ND.CODUL = 1 THEN D.COL1 ELSE NULL END),1)) 
--      - CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('020') AND ND.CODUL = 1 THEN D.COL1 ELSE NULL END),1))  >0 OR  
--       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND ND.CODUL = 1 THEN D.COL2 ELSE NULL END),1))   >0 OR  
--       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 1 THEN D.COL1 ELSE NULL END),1))  >0 OR 
--       
--       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 1 THEN D.COL5 ELSE NULL END),1))   + 
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 1 THEN D.COL6 ELSE NULL END),1))   +
--       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 1 THEN D.COL7 ELSE NULL END),1))   +
--       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 1 THEN D.COL8 ELSE NULL END),1))   +
--       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 1 THEN D.COL9 ELSE NULL END),1))  >0 
               
               UNION
  -- ROWS 03               
             SELECT
     :pID_MDTABLE -1,
     :pCOD_CUATM AS COD_CUATM,
     CD.NR_ROW AS NR_SECTIE,
     CD.NUME_ROW AS NUME_SECTIE,
     '03' AS NR_ROW_CUATM,
      3  AS ORDINE_CUATM,
     'sanatorială' AS NUME_ROW_CUATM,
       CIS2.NVAL(COUNT(DISTINCT CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1004)  AND ND.CODUL = 2 AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END))  AS  COL1, 
       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND ND.CODUL = 2 THEN D.COL1 ELSE NULL END),1))  AS  COL2,
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND ND.CODUL = 2 THEN D.COL1 ELSE NULL END),1)) 
      - CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('020') AND ND.CODUL =2 THEN D.COL1 ELSE NULL END),1))  AS  COL3,
       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND ND.CODUL = 2 THEN D.COL2 ELSE NULL END),1))  AS  COL4,
       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 2 THEN D.COL1 ELSE NULL END),1))  AS  COL5,
       
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 2 THEN D.COL5 ELSE NULL END),1))   + 
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 2 THEN D.COL6 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 2 THEN D.COL7 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 2 THEN D.COL8 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 2 THEN D.COL9 ELSE NULL END),1)) AS  COL6
       
       FROM    
             CIS2.VW_DATA_ALL D    
                      
               INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS)  
               ----------------------------------------------------------------------------------------------------                          
               INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL) --(NIÎP).(Col.6) <> 6 --- NT.CODUL <> 6  
               ----------------------------------------------------------------------------------------------------
               INNER JOIN CIS2.CL_N85_NDIIP ND ON (RN.N85_NDIIP=ND.CODUL) -- care (NIÎP).(Col.7) = 1 ---ND.CODUL = 1 
                INNER JOIN CIS2.VW_CL_CUATM VC ON (VC.CODUL = RN.CUATM )  
               --------------------------------------------------------------------------------------------------        
  
  CROSS JOIN
                                    
  ( 
    SELECT 'Total' AS NUME_ROW,                                   '01' AS NR_ROW, '0000000' AS CUATM FROM DUAL UNION
    SELECT 'Mun. Chișinau' AS NUME_ROW,                           '02' AS NR_ROW, '0100000' AS CUATM FROM DUAL UNION 
    SELECT 'NORD' AS NUME_ROW,                                    '03' AS NR_ROW, '1111111' AS CUATM FROM DUAL UNION 
    SELECT 'Mun. Balți' AS NUME_ROW,                              '04' AS NR_ROW, '0300000' AS CUATM FROM DUAL UNION 
    SELECT 'Briceni' AS NUME_ROW,                                 '05' AS NR_ROW, '1400000' AS CUATM FROM DUAL UNION 
    SELECT 'Dondușeni' AS NUME_ROW,                               '06' AS NR_ROW, '3400000' AS CUATM FROM DUAL UNION 
    SELECT 'Drochia' AS NUME_ROW,                                 '07' AS NR_ROW, '3600000' AS CUATM FROM DUAL UNION 
    SELECT 'Edineț' AS NUME_ROW,                                  '08' AS NR_ROW, '4100000' AS CUATM FROM DUAL UNION 
    SELECT 'Falești' AS NUME_ROW,                                 '09' AS NR_ROW, '4300000' AS CUATM FROM DUAL UNION 
    SELECT 'Florești' AS NUME_ROW,                                '10' AS NR_ROW, '4500000' AS CUATM FROM DUAL UNION 
    SELECT 'Glodeni' AS NUME_ROW,                                 '11' AS NR_ROW, '4800000' AS CUATM FROM DUAL UNION
    SELECT 'Ocnița' AS NUME_ROW,                                  '12' AS NR_ROW, '6200000' AS CUATM FROM DUAL UNION 
    SELECT 'Rișcani' AS NUME_ROW,                                 '13' AS NR_ROW, '7100000' AS CUATM FROM DUAL UNION 
    SELECT 'Sîngerei' AS NUME_ROW,                                '14' AS NR_ROW, '7400000' AS CUATM FROM DUAL UNION 
    SELECT 'Soroca' AS NUME_ROW,                                  '15' AS NR_ROW, '7800000' AS CUATM FROM DUAL UNION 
    SELECT 'CENTRU' AS NUME_ROW,                                  '16' AS NR_ROW, '2222222' AS CUATM FROM DUAL UNION 
    SELECT 'Anenii Noi' AS NUME_ROW,                              '17' AS NR_ROW, '1000000' AS CUATM FROM DUAL UNION 
    SELECT 'Calarași' AS NUME_ROW,                                '18' AS NR_ROW, '2500000' AS CUATM FROM DUAL UNION 
    SELECT 'Criuleni' AS NUME_ROW,                                '19' AS NR_ROW, '3100000' AS CUATM FROM DUAL UNION 
    SELECT 'Dubăsari' AS NUME_ROW,                                '20' AS NR_ROW, '3800000' AS CUATM FROM DUAL UNION
    SELECT 'Hincești' AS NUME_ROW,                                '21' AS NR_ROW, '5300000' AS CUATM FROM DUAL UNION
    SELECT 'Ialoveni' AS NUME_ROW,                                '22' AS NR_ROW, '5500000' AS CUATM FROM DUAL UNION 
    SELECT 'Nisporeni' AS NUME_ROW,                               '23' AS NR_ROW, '6000000' AS CUATM FROM DUAL UNION 
    SELECT 'Orhei' AS NUME_ROW,                                   '24' AS NR_ROW, '6400000' AS CUATM FROM DUAL UNION 
    SELECT 'Rezina' AS NUME_ROW,                                  '25' AS NR_ROW, '6700000' AS CUATM FROM DUAL UNION 
    SELECT 'Strașeni' AS NUME_ROW,                                '26' AS NR_ROW, '8000000' AS CUATM FROM DUAL UNION 
    SELECT 'Șoldanești' AS NUME_ROW,                              '27' AS NR_ROW, '8300000' AS CUATM FROM DUAL UNION 
    SELECT 'Telenești' AS NUME_ROW,                               '28' AS NR_ROW, '8900000' AS CUATM FROM DUAL UNION 
    SELECT 'Ungheni' AS NUME_ROW,                                 '29' AS NR_ROW, '9200000' AS CUATM FROM DUAL UNION 
    SELECT 'SUD' AS NUME_ROW,                                     '30' AS NR_ROW, '3333333' AS CUATM FROM DUAL UNION 
    SELECT 'Basarabeasca' AS NUME_ROW,                            '31' AS NR_ROW, '1200000' AS CUATM FROM DUAL UNION
    SELECT 'Cahul' AS NUME_ROW,                                   '32' AS NR_ROW, '1700000' AS CUATM FROM DUAL UNION 
    SELECT 'Cantemir' AS NUME_ROW,                                '33' AS NR_ROW, '2100000' AS CUATM FROM DUAL UNION 
    SELECT 'Căușeni' AS NUME_ROW,                                 '34' AS NR_ROW, '2700000' AS CUATM FROM DUAL UNION 
    SELECT 'Cimișlia' AS NUME_ROW,                                '35' AS NR_ROW, '2900000' AS CUATM FROM DUAL UNION 
    SELECT 'Leova' AS NUME_ROW,                                   '36' AS NR_ROW, '5700000' AS CUATM FROM DUAL UNION 
    SELECT 'Ștefan Vodă' AS NUME_ROW,                             '37' AS NR_ROW, '8500000' AS CUATM FROM DUAL UNION 
    SELECT 'Taraclia' AS NUME_ROW,                                '38' AS NR_ROW, '8700000' AS CUATM FROM DUAL UNION 
    SELECT 'UAT Găgăuzia' AS NUME_ROW,                            '39' AS NR_ROW, '9600000' AS CUATM FROM DUAL UNION
    SELECT 'UAT dS Nistrului' AS NUME_ROW,                        '40' AS NR_ROW, '9800000' AS CUATM FROM DUAL UNION
    SELECT 'Mun.Bender' AS NUME_ROW,                              '41' AS NR_ROW, '0501000' AS CUATM FROM DUAL
      ) CD
        
                
                WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17 AND
               D.CAPITOL IN (1001,1002,1004) 
               
               GROUP BY
               CD.NR_ROW,   
               CD.NUME_ROW 
               
--               HAVING
--                CIS2.NVAL(COUNT(DISTINCT CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1004) AND ND.CODUL = 2 AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END)) >0 OR 
--       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND ND.CODUL = 2 THEN D.COL1 ELSE NULL END),1))  >0 OR 
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND ND.CODUL = 2 THEN D.COL1 ELSE NULL END),1)) 
--      - CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('020') AND ND.CODUL =2 THEN D.COL1 ELSE NULL END),1))  >0 OR 
--       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND ND.CODUL = 2 THEN D.COL2 ELSE NULL END),1)) >0 OR 
--       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 2 THEN D.COL1 ELSE NULL END),1))  >0 OR 
--       
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 2 THEN D.COL5 ELSE NULL END),1))   + 
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 2 THEN D.COL6 ELSE NULL END),1))   +
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 2 THEN D.COL7 ELSE NULL END),1))   +
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 2 THEN D.COL8 ELSE NULL END),1))   +
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 2 THEN D.COL9 ELSE NULL END),1))>0 
       
               
               
      UNION
  -- ROWS 04               
             SELECT
     :pID_MDTABLE -1,
     :pCOD_CUATM AS COD_CUATM,
     CD.NR_ROW AS NR_SECTIE,
     CD.NUME_ROW AS NUME_SECTIE,
     '04' AS NR_ROW_CUATM,
      4  AS ORDINE_CUATM,
     'specială' AS NUME_ROW_CUATM,
       CIS2.NVAL(COUNT(DISTINCT CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1004)   AND ND.CODUL = 3 AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END))  AS  COL1, 
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND ND.CODUL = 3 THEN D.COL1 ELSE NULL END),1))  AS  COL2,
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND ND.CODUL = 3 THEN D.COL1 ELSE NULL END),1)) 
      - CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('020') AND ND.CODUL = 3 THEN D.COL1 ELSE NULL END),1))  AS  COL3,
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND ND.CODUL = 3 THEN D.COL2 ELSE NULL END),1))  AS  COL4,
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 3 THEN D.COL1 ELSE NULL END),1))  AS  COL5,
       
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 3 THEN D.COL5 ELSE NULL END),1))   + 
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 3 THEN D.COL6 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 3 THEN D.COL7 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 3 THEN D.COL8 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 3 THEN D.COL9 ELSE NULL END),1)) AS  COL6 
      
       FROM    
             CIS2.VW_DATA_ALL D    
                      
               INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS)  
               
               ----------------------------------------------------------------------------------------------------                          
               INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL) --(NIÎP).(Col.6) <> 6 --- NT.CODUL <> 6  
               ----------------------------------------------------------------------------------------------------
               INNER JOIN CIS2.CL_N85_NDIIP ND ON (RN.N85_NDIIP=ND.CODUL) -- care (NIÎP).(Col.7) = 1 ---ND.CODUL = 1
                INNER JOIN CIS2.VW_CL_CUATM VC ON (VC.CODUL = RN.CUATM )  
               --------------------------------------------------------------------------------------------------        
  
  CROSS JOIN
                                    
  ( 
    SELECT 'Total' AS NUME_ROW,                                   '01' AS NR_ROW, '0000000' AS CUATM FROM DUAL UNION
    SELECT 'Mun. Chișinau' AS NUME_ROW,                           '02' AS NR_ROW, '0100000' AS CUATM FROM DUAL UNION 
    SELECT 'NORD' AS NUME_ROW,                                    '03' AS NR_ROW, '1111111' AS CUATM FROM DUAL UNION 
    SELECT 'Mun. Balți' AS NUME_ROW,                              '04' AS NR_ROW, '0300000' AS CUATM FROM DUAL UNION 
    SELECT 'Briceni' AS NUME_ROW,                                 '05' AS NR_ROW, '1400000' AS CUATM FROM DUAL UNION 
    SELECT 'Dondușeni' AS NUME_ROW,                               '06' AS NR_ROW, '3400000' AS CUATM FROM DUAL UNION 
    SELECT 'Drochia' AS NUME_ROW,                                 '07' AS NR_ROW, '3600000' AS CUATM FROM DUAL UNION 
    SELECT 'Edineț' AS NUME_ROW,                                  '08' AS NR_ROW, '4100000' AS CUATM FROM DUAL UNION 
    SELECT 'Falești' AS NUME_ROW,                                 '09' AS NR_ROW, '4300000' AS CUATM FROM DUAL UNION 
    SELECT 'Florești' AS NUME_ROW,                                '10' AS NR_ROW, '4500000' AS CUATM FROM DUAL UNION 
    SELECT 'Glodeni' AS NUME_ROW,                                 '11' AS NR_ROW, '4800000' AS CUATM FROM DUAL UNION
    SELECT 'Ocnița' AS NUME_ROW,                                  '12' AS NR_ROW, '6200000' AS CUATM FROM DUAL UNION 
    SELECT 'Rișcani' AS NUME_ROW,                                 '13' AS NR_ROW, '7100000' AS CUATM FROM DUAL UNION 
    SELECT 'Sîngerei' AS NUME_ROW,                                '14' AS NR_ROW, '7400000' AS CUATM FROM DUAL UNION 
    SELECT 'Soroca' AS NUME_ROW,                                  '15' AS NR_ROW, '7800000' AS CUATM FROM DUAL UNION 
    SELECT 'CENTRU' AS NUME_ROW,                                  '16' AS NR_ROW, '2222222' AS CUATM FROM DUAL UNION 
    SELECT 'Anenii Noi' AS NUME_ROW,                              '17' AS NR_ROW, '1000000' AS CUATM FROM DUAL UNION 
    SELECT 'Calarași' AS NUME_ROW,                                '18' AS NR_ROW, '2500000' AS CUATM FROM DUAL UNION 
    SELECT 'Criuleni' AS NUME_ROW,                                '19' AS NR_ROW, '3100000' AS CUATM FROM DUAL UNION 
    SELECT 'Dubăsari' AS NUME_ROW,                                '20' AS NR_ROW, '3800000' AS CUATM FROM DUAL UNION
    SELECT 'Hincești' AS NUME_ROW,                                '21' AS NR_ROW, '5300000' AS CUATM FROM DUAL UNION
    SELECT 'Ialoveni' AS NUME_ROW,                                '22' AS NR_ROW, '5500000' AS CUATM FROM DUAL UNION 
    SELECT 'Nisporeni' AS NUME_ROW,                               '23' AS NR_ROW, '6000000' AS CUATM FROM DUAL UNION 
    SELECT 'Orhei' AS NUME_ROW,                                   '24' AS NR_ROW, '6400000' AS CUATM FROM DUAL UNION 
    SELECT 'Rezina' AS NUME_ROW,                                  '25' AS NR_ROW, '6700000' AS CUATM FROM DUAL UNION 
    SELECT 'Strașeni' AS NUME_ROW,                                '26' AS NR_ROW, '8000000' AS CUATM FROM DUAL UNION 
    SELECT 'Șoldanești' AS NUME_ROW,                              '27' AS NR_ROW, '8300000' AS CUATM FROM DUAL UNION 
    SELECT 'Telenești' AS NUME_ROW,                               '28' AS NR_ROW, '8900000' AS CUATM FROM DUAL UNION 
    SELECT 'Ungheni' AS NUME_ROW,                                 '29' AS NR_ROW, '9200000' AS CUATM FROM DUAL UNION 
    SELECT 'SUD' AS NUME_ROW,                                     '30' AS NR_ROW, '3333333' AS CUATM FROM DUAL UNION 
    SELECT 'Basarabeasca' AS NUME_ROW,                            '31' AS NR_ROW, '1200000' AS CUATM FROM DUAL UNION
    SELECT 'Cahul' AS NUME_ROW,                                   '32' AS NR_ROW, '1700000' AS CUATM FROM DUAL UNION 
    SELECT 'Cantemir' AS NUME_ROW,                                '33' AS NR_ROW, '2100000' AS CUATM FROM DUAL UNION 
    SELECT 'Căușeni' AS NUME_ROW,                                 '34' AS NR_ROW, '2700000' AS CUATM FROM DUAL UNION 
    SELECT 'Cimișlia' AS NUME_ROW,                                '35' AS NR_ROW, '2900000' AS CUATM FROM DUAL UNION 
    SELECT 'Leova' AS NUME_ROW,                                   '36' AS NR_ROW, '5700000' AS CUATM FROM DUAL UNION 
    SELECT 'Ștefan Vodă' AS NUME_ROW,                             '37' AS NR_ROW, '8500000' AS CUATM FROM DUAL UNION 
    SELECT 'Taraclia' AS NUME_ROW,                                '38' AS NR_ROW, '8700000' AS CUATM FROM DUAL UNION 
    SELECT 'UAT Găgăuzia' AS NUME_ROW,                            '39' AS NR_ROW, '9600000' AS CUATM FROM DUAL UNION
    SELECT 'UAT dS Nistrului' AS NUME_ROW,                        '40' AS NR_ROW, '9800000' AS CUATM FROM DUAL UNION
    SELECT 'Mun.Bender' AS NUME_ROW,                              '41' AS NR_ROW, '0501000' AS CUATM FROM DUAL
      ) CD
          
                
                WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17 AND
               D.CAPITOL IN (1001,1002,1004) 
               GROUP BY
               CD.NR_ROW,   
               CD.NUME_ROW 
               
--               HAVING 
--                CIS2.NVAL(COUNT(DISTINCT CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1004)  AND ND.CODUL = 3 AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END))  >0 OR 
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND ND.CODUL = 3 THEN D.COL1 ELSE NULL END),1))  >0 OR 
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND ND.CODUL = 3 THEN D.COL1 ELSE NULL END),1)) 
--      - CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('020') AND ND.CODUL = 3 THEN D.COL1 ELSE NULL END),1))   >0 OR 
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND ND.CODUL = 3 THEN D.COL2 ELSE NULL END),1))   >0 OR 
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 3 THEN D.COL1 ELSE NULL END),1))   >0 OR 
--       
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 3 THEN D.COL5 ELSE NULL END),1))   + 
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 3 THEN D.COL6 ELSE NULL END),1))   +
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 3 THEN D.COL7 ELSE NULL END),1))   +
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 3 THEN D.COL8 ELSE NULL END),1))   +
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 3 THEN D.COL9 ELSE NULL END),1))  >0 
--               
               UNION 
               
                   
--               
--     UNION
  -- ROWS 05               
             SELECT
     :pID_MDTABLE -1,
     :pCOD_CUATM AS COD_CUATM,
     CD.NR_ROW AS NR_SECTIE,
     CD.NUME_ROW AS NUME_SECTIE,
     '05' AS NR_ROW_CUATM,
      5  AS ORDINE_CUATM,
    'Din rînd. 02 instituţii care au grupe sanatoriale' AS NUME_ROW_CUATM,
       CIS2.NVAL(COUNT(DISTINCT CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  CIS2.NVAL(D.COL3) <> 0 AND ND.CODUL = 1 AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END))   AS  COL1, 
       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND ND.CODUL = 1 THEN D.COL3 ELSE NULL END),1)) AS  COL2,
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND ND.CODUL = 1 THEN D.COL3 ELSE NULL END),1)) 
      - CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('020') AND ND.CODUL = 1 THEN D.COL3 ELSE NULL END),1))  AS  COL3,
      
       NULL  AS  COL4,
       
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('110') AND ND.CODUL = 1 THEN D.COL1 ELSE NULL END),1))  AS  COL5,
       
       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('110') AND ND.CODUL = 1 THEN D.COL5 ELSE NULL END),1))   + 
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('110') AND ND.CODUL = 1 THEN D.COL6 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('110') AND ND.CODUL = 1 THEN D.COL7 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('110') AND ND.CODUL = 1 THEN D.COL8 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('110') AND ND.CODUL = 1 THEN D.COL9 ELSE NULL END),1))
      
       AS  COL6
       
       FROM    
             CIS2.VW_DATA_ALL D    
                      
               INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS)  
               ----------------------------------------------------------------------------------------------------                          
               INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL) --(NIÎP).(Col.6) <> 6 --- NT.CODUL <> 6  
               ----------------------------------------------------------------------------------------------------
               INNER JOIN CIS2.CL_N85_NDIIP ND ON (RN.N85_NDIIP=ND.CODUL) -- care (NIÎP).(Col.7) = 1 ---ND.CODUL = 1  
                INNER JOIN CIS2.VW_CL_CUATM VC ON (VC.CODUL = RN.CUATM )  
               --------------------------------------------------------------------------------------------------        
  
  CROSS JOIN
                                    
  ( 
    SELECT 'Total' AS NUME_ROW,                                   '01' AS NR_ROW, '0000000' AS CUATM FROM DUAL UNION
    SELECT 'Mun. Chișinau' AS NUME_ROW,                           '02' AS NR_ROW, '0100000' AS CUATM FROM DUAL UNION 
    SELECT 'NORD' AS NUME_ROW,                                    '03' AS NR_ROW, '1111111' AS CUATM FROM DUAL UNION 
    SELECT 'Mun. Balți' AS NUME_ROW,                              '04' AS NR_ROW, '0300000' AS CUATM FROM DUAL UNION 
    SELECT 'Briceni' AS NUME_ROW,                                 '05' AS NR_ROW, '1400000' AS CUATM FROM DUAL UNION 
    SELECT 'Dondușeni' AS NUME_ROW,                               '06' AS NR_ROW, '3400000' AS CUATM FROM DUAL UNION 
    SELECT 'Drochia' AS NUME_ROW,                                 '07' AS NR_ROW, '3600000' AS CUATM FROM DUAL UNION 
    SELECT 'Edineț' AS NUME_ROW,                                  '08' AS NR_ROW, '4100000' AS CUATM FROM DUAL UNION 
    SELECT 'Falești' AS NUME_ROW,                                 '09' AS NR_ROW, '4300000' AS CUATM FROM DUAL UNION 
    SELECT 'Florești' AS NUME_ROW,                                '10' AS NR_ROW, '4500000' AS CUATM FROM DUAL UNION 
    SELECT 'Glodeni' AS NUME_ROW,                                 '11' AS NR_ROW, '4800000' AS CUATM FROM DUAL UNION
    SELECT 'Ocnița' AS NUME_ROW,                                  '12' AS NR_ROW, '6200000' AS CUATM FROM DUAL UNION 
    SELECT 'Rișcani' AS NUME_ROW,                                 '13' AS NR_ROW, '7100000' AS CUATM FROM DUAL UNION 
    SELECT 'Sîngerei' AS NUME_ROW,                                '14' AS NR_ROW, '7400000' AS CUATM FROM DUAL UNION 
    SELECT 'Soroca' AS NUME_ROW,                                  '15' AS NR_ROW, '7800000' AS CUATM FROM DUAL UNION 
    SELECT 'CENTRU' AS NUME_ROW,                                  '16' AS NR_ROW, '2222222' AS CUATM FROM DUAL UNION 
    SELECT 'Anenii Noi' AS NUME_ROW,                              '17' AS NR_ROW, '1000000' AS CUATM FROM DUAL UNION 
    SELECT 'Calarași' AS NUME_ROW,                                '18' AS NR_ROW, '2500000' AS CUATM FROM DUAL UNION 
    SELECT 'Criuleni' AS NUME_ROW,                                '19' AS NR_ROW, '3100000' AS CUATM FROM DUAL UNION 
    SELECT 'Dubăsari' AS NUME_ROW,                                '20' AS NR_ROW, '3800000' AS CUATM FROM DUAL UNION
    SELECT 'Hincești' AS NUME_ROW,                                '21' AS NR_ROW, '5300000' AS CUATM FROM DUAL UNION
    SELECT 'Ialoveni' AS NUME_ROW,                                '22' AS NR_ROW, '5500000' AS CUATM FROM DUAL UNION 
    SELECT 'Nisporeni' AS NUME_ROW,                               '23' AS NR_ROW, '6000000' AS CUATM FROM DUAL UNION 
    SELECT 'Orhei' AS NUME_ROW,                                   '24' AS NR_ROW, '6400000' AS CUATM FROM DUAL UNION 
    SELECT 'Rezina' AS NUME_ROW,                                  '25' AS NR_ROW, '6700000' AS CUATM FROM DUAL UNION 
    SELECT 'Strașeni' AS NUME_ROW,                                '26' AS NR_ROW, '8000000' AS CUATM FROM DUAL UNION 
    SELECT 'Șoldanești' AS NUME_ROW,                              '27' AS NR_ROW, '8300000' AS CUATM FROM DUAL UNION 
    SELECT 'Telenești' AS NUME_ROW,                               '28' AS NR_ROW, '8900000' AS CUATM FROM DUAL UNION 
    SELECT 'Ungheni' AS NUME_ROW,                                 '29' AS NR_ROW, '9200000' AS CUATM FROM DUAL UNION 
    SELECT 'SUD' AS NUME_ROW,                                     '30' AS NR_ROW, '3333333' AS CUATM FROM DUAL UNION 
    SELECT 'Basarabeasca' AS NUME_ROW,                            '31' AS NR_ROW, '1200000' AS CUATM FROM DUAL UNION
    SELECT 'Cahul' AS NUME_ROW,                                   '32' AS NR_ROW, '1700000' AS CUATM FROM DUAL UNION 
    SELECT 'Cantemir' AS NUME_ROW,                                '33' AS NR_ROW, '2100000' AS CUATM FROM DUAL UNION 
    SELECT 'Căușeni' AS NUME_ROW,                                 '34' AS NR_ROW, '2700000' AS CUATM FROM DUAL UNION 
    SELECT 'Cimișlia' AS NUME_ROW,                                '35' AS NR_ROW, '2900000' AS CUATM FROM DUAL UNION 
    SELECT 'Leova' AS NUME_ROW,                                   '36' AS NR_ROW, '5700000' AS CUATM FROM DUAL UNION 
    SELECT 'Ștefan Vodă' AS NUME_ROW,                             '37' AS NR_ROW, '8500000' AS CUATM FROM DUAL UNION 
    SELECT 'Taraclia' AS NUME_ROW,                                '38' AS NR_ROW, '8700000' AS CUATM FROM DUAL UNION 
    SELECT 'UAT Găgăuzia' AS NUME_ROW,                            '39' AS NR_ROW, '9600000' AS CUATM FROM DUAL UNION
    SELECT 'UAT dS Nistrului' AS NUME_ROW,                        '40' AS NR_ROW, '9800000' AS CUATM FROM DUAL UNION
    SELECT 'Mun.Bender' AS NUME_ROW,                              '41' AS NR_ROW, '0501000' AS CUATM FROM DUAL
      ) CD
        
                
                WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17 AND
               D.CAPITOL IN (1001,1002,1004)
               GROUP BY
               CD.NR_ROW,   
               CD.NUME_ROW  
               
--               HAVING  
--       CIS2.NVAL(COUNT(DISTINCT CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  CIS2.NVAL(D.COL3) <> 0 AND ND.CODUL = 1 AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END))  >0 OR 
--       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND ND.CODUL = 1 THEN D.COL3 ELSE NULL END),1)) >0 OR 
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND ND.CODUL = 1 THEN D.COL3 ELSE NULL END),1)) 
--      - CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('020') AND ND.CODUL = 1 THEN D.COL3 ELSE NULL END),1))  >0 OR 
--      
--      -- NULL  AS  COL4,
--       
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('110') AND ND.CODUL = 1 THEN D.COL1 ELSE NULL END),1)) >0 OR 
--       
--       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('110') AND ND.CODUL = 1 THEN D.COL5 ELSE NULL END),1))   + 
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('110') AND ND.CODUL = 1 THEN D.COL6 ELSE NULL END),1))   +
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('110') AND ND.CODUL = 1 THEN D.COL7 ELSE NULL END),1))   +
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('110') AND ND.CODUL = 1 THEN D.COL8 ELSE NULL END),1))   +
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('110') AND ND.CODUL = 1 THEN D.COL9 ELSE NULL END),1)) >0 
               
                UNION
  -- ROWS 06               
             SELECT
     :pID_MDTABLE -1,
     :pCOD_CUATM AS COD_CUATM,
     CD.NR_ROW AS NR_SECTIE,
      CD.NUME_ROW AS NUME_SECTIE,
     '06' AS NR_ROW_CUATM,
      6  AS ORDINE_CUATM,
    'cu destinaţie specială:' AS NUME_ROW_CUATM,
       CIS2.NVAL(COUNT(DISTINCT CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  CIS2.NVAL(D.COL4) <> 0 AND ND.CODUL = 1 AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END))  AS  COL1, 
       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND ND.CODUL = 1 THEN D.COL4 ELSE NULL END),1)) AS  COL2,
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND ND.CODUL = 1 THEN D.COL4 ELSE NULL END),1)) 
      - CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('020') AND ND.CODUL = 1 THEN D.COL4 ELSE NULL END),1))  AS  COL3,
      
       NULL AS  COL4,
      
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND ND.CODUL = 1 THEN D.COL1 ELSE NULL END),1)) AS  COL5,
       
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND ND.CODUL = 1 THEN D.COL5 ELSE NULL END),1))   + 
       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND ND.CODUL = 1 THEN D.COL6 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND ND.CODUL = 1 THEN D.COL7 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND ND.CODUL = 1 THEN D.COL8 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND ND.CODUL = 1 THEN D.COL9 ELSE NULL END),1))
       AS  COL6
       
       FROM    
             CIS2.VW_DATA_ALL D    
                      
               INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS)  
               
               ----------------------------------------------------------------------------------------------------                          
               INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL) --(NIÎP).(Col.6) <> 6 --- NT.CODUL <> 6  
               ----------------------------------------------------------------------------------------------------
               INNER JOIN CIS2.CL_N85_NDIIP ND ON (RN.N85_NDIIP=ND.CODUL) -- care (NIÎP).(Col.7) = 1 ---ND.CODUL = 1 
               
               ---------------------------------------------------------------------------------------------------
                INNER JOIN CIS2.VW_CL_CUATM VC ON (VC.CODUL = RN.CUATM )  
               --------------------------------------------------------------------------------------------------        
  
  CROSS JOIN
                                    
  ( 
    SELECT 'Total' AS NUME_ROW,                                   '01' AS NR_ROW, '0000000' AS CUATM FROM DUAL UNION
    SELECT 'Mun. Chișinau' AS NUME_ROW,                           '02' AS NR_ROW, '0100000' AS CUATM FROM DUAL UNION 
    SELECT 'NORD' AS NUME_ROW,                                    '03' AS NR_ROW, '1111111' AS CUATM FROM DUAL UNION 
    SELECT 'Mun. Balți' AS NUME_ROW,                              '04' AS NR_ROW, '0300000' AS CUATM FROM DUAL UNION 
    SELECT 'Briceni' AS NUME_ROW,                                 '05' AS NR_ROW, '1400000' AS CUATM FROM DUAL UNION 
    SELECT 'Dondușeni' AS NUME_ROW,                               '06' AS NR_ROW, '3400000' AS CUATM FROM DUAL UNION 
    SELECT 'Drochia' AS NUME_ROW,                                 '07' AS NR_ROW, '3600000' AS CUATM FROM DUAL UNION 
    SELECT 'Edineț' AS NUME_ROW,                                  '08' AS NR_ROW, '4100000' AS CUATM FROM DUAL UNION 
    SELECT 'Falești' AS NUME_ROW,                                 '09' AS NR_ROW, '4300000' AS CUATM FROM DUAL UNION 
    SELECT 'Florești' AS NUME_ROW,                                '10' AS NR_ROW, '4500000' AS CUATM FROM DUAL UNION 
    SELECT 'Glodeni' AS NUME_ROW,                                 '11' AS NR_ROW, '4800000' AS CUATM FROM DUAL UNION
    SELECT 'Ocnița' AS NUME_ROW,                                  '12' AS NR_ROW, '6200000' AS CUATM FROM DUAL UNION 
    SELECT 'Rișcani' AS NUME_ROW,                                 '13' AS NR_ROW, '7100000' AS CUATM FROM DUAL UNION 
    SELECT 'Sîngerei' AS NUME_ROW,                                '14' AS NR_ROW, '7400000' AS CUATM FROM DUAL UNION 
    SELECT 'Soroca' AS NUME_ROW,                                  '15' AS NR_ROW, '7800000' AS CUATM FROM DUAL UNION 
    SELECT 'CENTRU' AS NUME_ROW,                                  '16' AS NR_ROW, '2222222' AS CUATM FROM DUAL UNION 
    SELECT 'Anenii Noi' AS NUME_ROW,                              '17' AS NR_ROW, '1000000' AS CUATM FROM DUAL UNION 
    SELECT 'Calarași' AS NUME_ROW,                                '18' AS NR_ROW, '2500000' AS CUATM FROM DUAL UNION 
    SELECT 'Criuleni' AS NUME_ROW,                                '19' AS NR_ROW, '3100000' AS CUATM FROM DUAL UNION 
    SELECT 'Dubăsari' AS NUME_ROW,                                '20' AS NR_ROW, '3800000' AS CUATM FROM DUAL UNION
    SELECT 'Hincești' AS NUME_ROW,                                '21' AS NR_ROW, '5300000' AS CUATM FROM DUAL UNION
    SELECT 'Ialoveni' AS NUME_ROW,                                '22' AS NR_ROW, '5500000' AS CUATM FROM DUAL UNION 
    SELECT 'Nisporeni' AS NUME_ROW,                               '23' AS NR_ROW, '6000000' AS CUATM FROM DUAL UNION 
    SELECT 'Orhei' AS NUME_ROW,                                   '24' AS NR_ROW, '6400000' AS CUATM FROM DUAL UNION 
    SELECT 'Rezina' AS NUME_ROW,                                  '25' AS NR_ROW, '6700000' AS CUATM FROM DUAL UNION 
    SELECT 'Strașeni' AS NUME_ROW,                                '26' AS NR_ROW, '8000000' AS CUATM FROM DUAL UNION 
    SELECT 'Șoldanești' AS NUME_ROW,                              '27' AS NR_ROW, '8300000' AS CUATM FROM DUAL UNION 
    SELECT 'Telenești' AS NUME_ROW,                               '28' AS NR_ROW, '8900000' AS CUATM FROM DUAL UNION 
    SELECT 'Ungheni' AS NUME_ROW,                                 '29' AS NR_ROW, '9200000' AS CUATM FROM DUAL UNION 
    SELECT 'SUD' AS NUME_ROW,                                     '30' AS NR_ROW, '3333333' AS CUATM FROM DUAL UNION 
    SELECT 'Basarabeasca' AS NUME_ROW,                            '31' AS NR_ROW, '1200000' AS CUATM FROM DUAL UNION
    SELECT 'Cahul' AS NUME_ROW,                                   '32' AS NR_ROW, '1700000' AS CUATM FROM DUAL UNION 
    SELECT 'Cantemir' AS NUME_ROW,                                '33' AS NR_ROW, '2100000' AS CUATM FROM DUAL UNION 
    SELECT 'Căușeni' AS NUME_ROW,                                 '34' AS NR_ROW, '2700000' AS CUATM FROM DUAL UNION 
    SELECT 'Cimișlia' AS NUME_ROW,                                '35' AS NR_ROW, '2900000' AS CUATM FROM DUAL UNION 
    SELECT 'Leova' AS NUME_ROW,                                   '36' AS NR_ROW, '5700000' AS CUATM FROM DUAL UNION 
    SELECT 'Ștefan Vodă' AS NUME_ROW,                             '37' AS NR_ROW, '8500000' AS CUATM FROM DUAL UNION 
    SELECT 'Taraclia' AS NUME_ROW,                                '38' AS NR_ROW, '8700000' AS CUATM FROM DUAL UNION 
    SELECT 'UAT Găgăuzia' AS NUME_ROW,                            '39' AS NR_ROW, '9600000' AS CUATM FROM DUAL UNION
    SELECT 'UAT dS Nistrului' AS NUME_ROW,                        '40' AS NR_ROW, '9800000' AS CUATM FROM DUAL UNION
    SELECT 'Mun.Bender' AS NUME_ROW,                              '41' AS NR_ROW, '0501000' AS CUATM FROM DUAL
      ) CD
      
                
                WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17 AND
               D.CAPITOL IN (1001,1002,1004)   
               
               GROUP BY
               CD.NR_ROW,   
               CD.NUME_ROW       
                    
--              HAVING 
--    CIS2.NVAL(COUNT(DISTINCT CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  CIS2.NVAL(D.COL4) <> 0 AND ND.CODUL = 1 AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END))  >0 OR 
--    CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND ND.CODUL = 1 THEN D.COL4 ELSE NULL END),1))>0 OR 
--    CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND ND.CODUL = 1 THEN D.COL4 ELSE NULL END),1)) 
--      - CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('020') AND ND.CODUL = 1 THEN D.COL4 ELSE NULL END),1)) >0 OR 
--      
----       NULL AS  COL4,
--      
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND ND.CODUL = 1 THEN D.COL1 ELSE NULL END),1)) >0 OR 
--       
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND ND.CODUL = 1 THEN D.COL5 ELSE NULL END),1))   + 
--       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND ND.CODUL = 1 THEN D.COL6 ELSE NULL END),1))   +
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND ND.CODUL = 1 THEN D.COL7 ELSE NULL END),1))   +
--       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND ND.CODUL = 1 THEN D.COL8 ELSE NULL END),1))   +
--       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND ND.CODUL = 1 THEN D.COL9 ELSE NULL END),1)) > 0 
      
      UNION  
      
 -- add row 7 
 
 -- ROWS 07               
             SELECT
     :pID_MDTABLE -1,
     :pCOD_CUATM AS COD_CUATM,
     CD.NR_ROW AS NR_SECTIE,
     CD.NUME_ROW AS NUME_SECTIE,
     '07' AS NR_ROW_CUATM,
      7  AS ORDINE_CUATM,
     'Din rînd.(04+06) pentru copii cu dereglări:' AS NUME_ROW_CUATM,
       CIS2.NVAL(COUNT(DISTINCT CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.FORM = 17 AND
               D.CAPITOL IN (1001,1002,1003,1004,1005,1006,1007) AND  D.RIND IN ('010','020','030','040','050','060','070','080','090','100','110','120','130') AND NP.CODUL <> 0 AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END))  AS  COL1, 
      
      
      
        CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL <> 0  THEN D.COL4 ELSE NULL END),1))  AS  COL2,
        
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL <> 0 THEN D.COL4 ELSE NULL END),1)) 
      - CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('020') AND NP.CODUL <> 0 THEN D.COL4 ELSE NULL END),1)) AS  COL3,
       NULL AS  COL4,
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL <> 0 THEN D.COL1 ELSE NULL END),1))  AS  COL5,
       
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL <> 0 THEN D.COL5 ELSE NULL END),1))   + 
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL <> 0 THEN D.COL6 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL <> 0  THEN D.COL7 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL <> 0 THEN D.COL8 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL <> 0 THEN D.COL9 ELSE NULL END),1)) AS  COL6
       
       FROM    
             CIS2.VW_DATA_ALL D    
                      
              
               
               INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS) 
               
               -------------------------------------------------------------------------------------- 
               INNER JOIN CIS2.CL_N85_NPDS NP ON (RN.N85_NPDS=NP.CODUL) -- (NIÎP).(Col.8) = 1  -- NP.CODUL = 1
              
               -------------------------------------------------------------------------------------- 
                                         
               INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL) --(NIÎP).(Col.6) <> 6 --- NT.CODUL <> 6 
               INNER JOIN CIS2.VW_CL_CUATM VC ON (VC.CODUL = RN.CUATM )  
               --------------------------------------------------------------------------------------------------        
  
  CROSS JOIN
                                    
  ( 
    SELECT 'Total' AS NUME_ROW,                                   '01' AS NR_ROW, '0000000' AS CUATM FROM DUAL UNION
    SELECT 'Mun. Chișinau' AS NUME_ROW,                           '02' AS NR_ROW, '0100000' AS CUATM FROM DUAL UNION 
    SELECT 'NORD' AS NUME_ROW,                                    '03' AS NR_ROW, '1111111' AS CUATM FROM DUAL UNION 
    SELECT 'Mun. Balți' AS NUME_ROW,                              '04' AS NR_ROW, '0300000' AS CUATM FROM DUAL UNION 
    SELECT 'Briceni' AS NUME_ROW,                                 '05' AS NR_ROW, '1400000' AS CUATM FROM DUAL UNION 
    SELECT 'Dondușeni' AS NUME_ROW,                               '06' AS NR_ROW, '3400000' AS CUATM FROM DUAL UNION 
    SELECT 'Drochia' AS NUME_ROW,                                 '07' AS NR_ROW, '3600000' AS CUATM FROM DUAL UNION 
    SELECT 'Edineț' AS NUME_ROW,                                  '08' AS NR_ROW, '4100000' AS CUATM FROM DUAL UNION 
    SELECT 'Falești' AS NUME_ROW,                                 '09' AS NR_ROW, '4300000' AS CUATM FROM DUAL UNION 
    SELECT 'Florești' AS NUME_ROW,                                '10' AS NR_ROW, '4500000' AS CUATM FROM DUAL UNION 
    SELECT 'Glodeni' AS NUME_ROW,                                 '11' AS NR_ROW, '4800000' AS CUATM FROM DUAL UNION
    SELECT 'Ocnița' AS NUME_ROW,                                  '12' AS NR_ROW, '6200000' AS CUATM FROM DUAL UNION 
    SELECT 'Rișcani' AS NUME_ROW,                                 '13' AS NR_ROW, '7100000' AS CUATM FROM DUAL UNION 
    SELECT 'Sîngerei' AS NUME_ROW,                                '14' AS NR_ROW, '7400000' AS CUATM FROM DUAL UNION 
    SELECT 'Soroca' AS NUME_ROW,                                  '15' AS NR_ROW, '7800000' AS CUATM FROM DUAL UNION 
    SELECT 'CENTRU' AS NUME_ROW,                                  '16' AS NR_ROW, '2222222' AS CUATM FROM DUAL UNION 
    SELECT 'Anenii Noi' AS NUME_ROW,                              '17' AS NR_ROW, '1000000' AS CUATM FROM DUAL UNION 
    SELECT 'Calarași' AS NUME_ROW,                                '18' AS NR_ROW, '2500000' AS CUATM FROM DUAL UNION 
    SELECT 'Criuleni' AS NUME_ROW,                                '19' AS NR_ROW, '3100000' AS CUATM FROM DUAL UNION 
    SELECT 'Dubăsari' AS NUME_ROW,                                '20' AS NR_ROW, '3800000' AS CUATM FROM DUAL UNION
    SELECT 'Hincești' AS NUME_ROW,                                '21' AS NR_ROW, '5300000' AS CUATM FROM DUAL UNION
    SELECT 'Ialoveni' AS NUME_ROW,                                '22' AS NR_ROW, '5500000' AS CUATM FROM DUAL UNION 
    SELECT 'Nisporeni' AS NUME_ROW,                               '23' AS NR_ROW, '6000000' AS CUATM FROM DUAL UNION 
    SELECT 'Orhei' AS NUME_ROW,                                   '24' AS NR_ROW, '6400000' AS CUATM FROM DUAL UNION 
    SELECT 'Rezina' AS NUME_ROW,                                  '25' AS NR_ROW, '6700000' AS CUATM FROM DUAL UNION 
    SELECT 'Strașeni' AS NUME_ROW,                                '26' AS NR_ROW, '8000000' AS CUATM FROM DUAL UNION 
    SELECT 'Șoldanești' AS NUME_ROW,                              '27' AS NR_ROW, '8300000' AS CUATM FROM DUAL UNION 
    SELECT 'Telenești' AS NUME_ROW,                               '28' AS NR_ROW, '8900000' AS CUATM FROM DUAL UNION 
    SELECT 'Ungheni' AS NUME_ROW,                                 '29' AS NR_ROW, '9200000' AS CUATM FROM DUAL UNION 
    SELECT 'SUD' AS NUME_ROW,                                     '30' AS NR_ROW, '3333333' AS CUATM FROM DUAL UNION 
    SELECT 'Basarabeasca' AS NUME_ROW,                            '31' AS NR_ROW, '1200000' AS CUATM FROM DUAL UNION
    SELECT 'Cahul' AS NUME_ROW,                                   '32' AS NR_ROW, '1700000' AS CUATM FROM DUAL UNION 
    SELECT 'Cantemir' AS NUME_ROW,                                '33' AS NR_ROW, '2100000' AS CUATM FROM DUAL UNION 
    SELECT 'Căușeni' AS NUME_ROW,                                 '34' AS NR_ROW, '2700000' AS CUATM FROM DUAL UNION 
    SELECT 'Cimișlia' AS NUME_ROW,                                '35' AS NR_ROW, '2900000' AS CUATM FROM DUAL UNION 
    SELECT 'Leova' AS NUME_ROW,                                   '36' AS NR_ROW, '5700000' AS CUATM FROM DUAL UNION 
    SELECT 'Ștefan Vodă' AS NUME_ROW,                             '37' AS NR_ROW, '8500000' AS CUATM FROM DUAL UNION 
    SELECT 'Taraclia' AS NUME_ROW,                                '38' AS NR_ROW, '8700000' AS CUATM FROM DUAL UNION 
    SELECT 'UAT Găgăuzia' AS NUME_ROW,                            '39' AS NR_ROW, '9600000' AS CUATM FROM DUAL UNION
    SELECT 'UAT dS Nistrului' AS NUME_ROW,                        '40' AS NR_ROW, '9800000' AS CUATM FROM DUAL UNION
    SELECT 'Mun.Bender' AS NUME_ROW,                              '41' AS NR_ROW, '0501000' AS CUATM FROM DUAL
      ) CD
                
               
                WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17 
               
               AND
               D.CAPITOL IN (1001,1002,1003,1004,1005,1006,1007) 
               GROUP BY
               CD.NR_ROW,   
               CD.NUME_ROW   
                     
--               HAVING
--                CIS2.NVAL(COUNT(DISTINCT CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.FORM = 17 AND
--               D.CAPITOL IN (1001,1002,1003,1004,1005,1006,1007) AND  D.RIND IN ('010','020','030','040','050','060','070','080','090','100','110','120','130') AND NP.CODUL <> 0 AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END))  >0 OR 
--      
--      
--      
--        CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL <> 0  THEN D.COL4 ELSE NULL END),1))  >0 OR
--        
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL <> 0 THEN D.COL4 ELSE NULL END),1)) 
--      - CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('020') AND NP.CODUL <> 0 THEN D.COL4 ELSE NULL END),1)) >0 OR
--      -- NULL AS  COL4,
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL <> 0 THEN D.COL1 ELSE NULL END),1)) >0 OR
--       
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL <> 0 THEN D.COL5 ELSE NULL END),1))   + 
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL <> 0 THEN D.COL6 ELSE NULL END),1))   +
--       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL <> 0  THEN D.COL7 ELSE NULL END),1))   +
--       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL <> 0 THEN D.COL8 ELSE NULL END),1))   +
--       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL <> 0 THEN D.COL9 ELSE NULL END),1)) >0 
                    
             UNION             
                 
               
     -- ROWS 07               
             SELECT
     :pID_MDTABLE -1,
     :pCOD_CUATM AS COD_CUATM,
     CD.NR_ROW AS NR_SECTIE,
     CD.NUME_ROW AS NUME_SECTIE,
     '08' AS NR_ROW_CUATM,
      8  AS ORDINE_CUATM,
     'de auz:' AS NUME_ROW_CUATM,
       CIS2.NVAL(COUNT(DISTINCT CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.FORM = 17 AND
               D.CAPITOL IN (1001,1002,1003,1004,1005,1006,1007) AND  D.RIND IN ('010','020','030','040','050','060','070','080','090','100','110','120','130') AND NP.CODUL = 1 AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END))  AS  COL1, 
      
      
      
        CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL = 1 THEN D.COL4 ELSE NULL END),1))  AS  COL2,
        
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL = 1 THEN D.COL4 ELSE NULL END),1)) 
      - CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('020') AND NP.CODUL = 1 THEN D.COL4 ELSE NULL END),1)) AS  COL3,
       NULL AS  COL4,
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 1 THEN D.COL1 ELSE NULL END),1))  AS  COL5,
       
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 1 THEN D.COL5 ELSE NULL END),1))   + 
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 1 THEN D.COL6 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 1 THEN D.COL7 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 1 THEN D.COL8 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 1 THEN D.COL9 ELSE NULL END),1)) AS  COL6
       
       FROM    
             CIS2.VW_DATA_ALL D    
                      
              
               
               INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS) 
               
               -------------------------------------------------------------------------------------- 
               INNER JOIN CIS2.CL_N85_NPDS NP ON (RN.N85_NPDS=NP.CODUL) -- (NIÎP).(Col.8) = 1  -- NP.CODUL = 1
              
               -------------------------------------------------------------------------------------- 
                                         
               INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL) --(NIÎP).(Col.6) <> 6 --- NT.CODUL <> 6 
               
               INNER JOIN CIS2.VW_CL_CUATM VC ON (VC.CODUL = RN.CUATM )  
               --------------------------------------------------------------------------------------------------        
  
  CROSS JOIN
                                    
  ( 
    SELECT 'Total' AS NUME_ROW,                                   '01' AS NR_ROW, '0000000' AS CUATM FROM DUAL UNION
    SELECT 'Mun. Chișinau' AS NUME_ROW,                           '02' AS NR_ROW, '0100000' AS CUATM FROM DUAL UNION 
    SELECT 'NORD' AS NUME_ROW,                                    '03' AS NR_ROW, '1111111' AS CUATM FROM DUAL UNION 
    SELECT 'Mun. Balți' AS NUME_ROW,                              '04' AS NR_ROW, '0300000' AS CUATM FROM DUAL UNION 
    SELECT 'Briceni' AS NUME_ROW,                                 '05' AS NR_ROW, '1400000' AS CUATM FROM DUAL UNION 
    SELECT 'Dondușeni' AS NUME_ROW,                               '06' AS NR_ROW, '3400000' AS CUATM FROM DUAL UNION 
    SELECT 'Drochia' AS NUME_ROW,                                 '07' AS NR_ROW, '3600000' AS CUATM FROM DUAL UNION 
    SELECT 'Edineț' AS NUME_ROW,                                  '08' AS NR_ROW, '4100000' AS CUATM FROM DUAL UNION 
    SELECT 'Falești' AS NUME_ROW,                                 '09' AS NR_ROW, '4300000' AS CUATM FROM DUAL UNION 
    SELECT 'Florești' AS NUME_ROW,                                '10' AS NR_ROW, '4500000' AS CUATM FROM DUAL UNION 
    SELECT 'Glodeni' AS NUME_ROW,                                 '11' AS NR_ROW, '4800000' AS CUATM FROM DUAL UNION
    SELECT 'Ocnița' AS NUME_ROW,                                  '12' AS NR_ROW, '6200000' AS CUATM FROM DUAL UNION 
    SELECT 'Rișcani' AS NUME_ROW,                                 '13' AS NR_ROW, '7100000' AS CUATM FROM DUAL UNION 
    SELECT 'Sîngerei' AS NUME_ROW,                                '14' AS NR_ROW, '7400000' AS CUATM FROM DUAL UNION 
    SELECT 'Soroca' AS NUME_ROW,                                  '15' AS NR_ROW, '7800000' AS CUATM FROM DUAL UNION 
    SELECT 'CENTRU' AS NUME_ROW,                                  '16' AS NR_ROW, '2222222' AS CUATM FROM DUAL UNION 
    SELECT 'Anenii Noi' AS NUME_ROW,                              '17' AS NR_ROW, '1000000' AS CUATM FROM DUAL UNION 
    SELECT 'Calarași' AS NUME_ROW,                                '18' AS NR_ROW, '2500000' AS CUATM FROM DUAL UNION 
    SELECT 'Criuleni' AS NUME_ROW,                                '19' AS NR_ROW, '3100000' AS CUATM FROM DUAL UNION 
    SELECT 'Dubăsari' AS NUME_ROW,                                '20' AS NR_ROW, '3800000' AS CUATM FROM DUAL UNION
    SELECT 'Hincești' AS NUME_ROW,                                '21' AS NR_ROW, '5300000' AS CUATM FROM DUAL UNION
    SELECT 'Ialoveni' AS NUME_ROW,                                '22' AS NR_ROW, '5500000' AS CUATM FROM DUAL UNION 
    SELECT 'Nisporeni' AS NUME_ROW,                               '23' AS NR_ROW, '6000000' AS CUATM FROM DUAL UNION 
    SELECT 'Orhei' AS NUME_ROW,                                   '24' AS NR_ROW, '6400000' AS CUATM FROM DUAL UNION 
    SELECT 'Rezina' AS NUME_ROW,                                  '25' AS NR_ROW, '6700000' AS CUATM FROM DUAL UNION 
    SELECT 'Strașeni' AS NUME_ROW,                                '26' AS NR_ROW, '8000000' AS CUATM FROM DUAL UNION 
    SELECT 'Șoldanești' AS NUME_ROW,                              '27' AS NR_ROW, '8300000' AS CUATM FROM DUAL UNION 
    SELECT 'Telenești' AS NUME_ROW,                               '28' AS NR_ROW, '8900000' AS CUATM FROM DUAL UNION 
    SELECT 'Ungheni' AS NUME_ROW,                                 '29' AS NR_ROW, '9200000' AS CUATM FROM DUAL UNION 
    SELECT 'SUD' AS NUME_ROW,                                     '30' AS NR_ROW, '3333333' AS CUATM FROM DUAL UNION 
    SELECT 'Basarabeasca' AS NUME_ROW,                            '31' AS NR_ROW, '1200000' AS CUATM FROM DUAL UNION
    SELECT 'Cahul' AS NUME_ROW,                                   '32' AS NR_ROW, '1700000' AS CUATM FROM DUAL UNION 
    SELECT 'Cantemir' AS NUME_ROW,                                '33' AS NR_ROW, '2100000' AS CUATM FROM DUAL UNION 
    SELECT 'Căușeni' AS NUME_ROW,                                 '34' AS NR_ROW, '2700000' AS CUATM FROM DUAL UNION 
    SELECT 'Cimișlia' AS NUME_ROW,                                '35' AS NR_ROW, '2900000' AS CUATM FROM DUAL UNION 
    SELECT 'Leova' AS NUME_ROW,                                   '36' AS NR_ROW, '5700000' AS CUATM FROM DUAL UNION 
    SELECT 'Ștefan Vodă' AS NUME_ROW,                             '37' AS NR_ROW, '8500000' AS CUATM FROM DUAL UNION 
    SELECT 'Taraclia' AS NUME_ROW,                                '38' AS NR_ROW, '8700000' AS CUATM FROM DUAL UNION 
    SELECT 'UAT Găgăuzia' AS NUME_ROW,                            '39' AS NR_ROW, '9600000' AS CUATM FROM DUAL UNION
    SELECT 'UAT dS Nistrului' AS NUME_ROW,                        '40' AS NR_ROW, '9800000' AS CUATM FROM DUAL UNION
    SELECT 'Mun.Bender' AS NUME_ROW,                              '41' AS NR_ROW, '0501000' AS CUATM FROM DUAL
      ) CD 
               
                WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17 
               
               AND
               D.CAPITOL IN (1001,1002,1003,1004,1005,1006,1007)  
               GROUP BY
               CD.NR_ROW,   
               CD.NUME_ROW        
               
--               HAVING
-- CIS2.NVAL(COUNT(DISTINCT CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.FORM = 17 AND
--               D.CAPITOL IN (1001,1002,1003,1004,1005,1006,1007) AND  D.RIND IN ('010','020','030','040','050','060','070','080','090','100','110','120','130') AND NP.CODUL = 1 AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END))  >0 OR  
--      
--      
--      
--        CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL = 1 THEN D.COL4 ELSE NULL END),1))  >0 OR 
--        
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL = 1 THEN D.COL4 ELSE NULL END),1)) 
--      - CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('020') AND NP.CODUL = 1 THEN D.COL4 ELSE NULL END),1)) >0 OR 
--      -- NULL AS  COL4,
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 1 THEN D.COL1 ELSE NULL END),1))  >0 OR 
--       
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 1 THEN D.COL5 ELSE NULL END),1))   + 
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 1 THEN D.COL6 ELSE NULL END),1))   +
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 1 THEN D.COL7 ELSE NULL END),1))   +
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 1 THEN D.COL8 ELSE NULL END),1))   +
--       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 1 THEN D.COL9 ELSE NULL END),1)) > 0             
               
                    
             UNION             
               
     -- ROWS 08               
             SELECT
     :pID_MDTABLE -1,
     :pCOD_CUATM AS COD_CUATM,
     CD.NR_ROW AS NR_SECTIE,
     CD.NUME_ROW AS NUME_SECTIE,
     '09' AS NR_ROW_CUATM,
      9  AS ORDINE_CUATM,
    'de vorbire' AS NUME_ROW_CUATM,
       CIS2.NVAL(COUNT(DISTINCT CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.FORM = 17 AND
               D.CAPITOL IN (1001,1002,1003,1004,1005,1006,1007) AND  D.RIND IN ('010','020','030','040','050','060','070','080','090','100','110','120','130') AND NP.CODUL = 2 AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END))  AS  COL1, 
      
        CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL = 2 THEN D.COL4 ELSE NULL END),1))  AS  COL2,
         
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL = 2 THEN D.COL4 ELSE NULL END),1)) 
      - CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('020') AND NP.CODUL = 2 THEN D.COL4 ELSE NULL END),1))  AS  COL3,
      NULL  AS  COL4,
      CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 2 THEN D.COL1 ELSE NULL END),1))  AS  COL5,
       
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 2 THEN D.COL5 ELSE NULL END),1))   + 
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 2 THEN D.COL6 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 2 THEN D.COL7 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 2 THEN D.COL8 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 2 THEN D.COL9 ELSE NULL END),1)) AS  COL6
       
       FROM    
             CIS2.VW_DATA_ALL D    
                      
               INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS)  
                 -------------------------------------------------------------------------------------- 
               INNER JOIN CIS2.CL_N85_NPDS NP ON (RN.N85_NPDS=NP.CODUL) -- (NIÎP).(Col.8) = 1  -- NP.CODUL = 1
              
               -------------------------------------------------------------------------------------- 
                                         
               INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL) --(NIÎP).(Col.6) <> 6 --- NT.CODUL <> 6  
               INNER JOIN CIS2.VW_CL_CUATM VC ON (VC.CODUL = RN.CUATM )  
               --------------------------------------------------------------------------------------------------        
  
  CROSS JOIN
                                    
  ( 
    SELECT 'Total' AS NUME_ROW,                                   '01' AS NR_ROW, '0000000' AS CUATM FROM DUAL UNION
    SELECT 'Mun. Chișinau' AS NUME_ROW,                           '02' AS NR_ROW, '0100000' AS CUATM FROM DUAL UNION 
    SELECT 'NORD' AS NUME_ROW,                                    '03' AS NR_ROW, '1111111' AS CUATM FROM DUAL UNION 
    SELECT 'Mun. Balți' AS NUME_ROW,                              '04' AS NR_ROW, '0300000' AS CUATM FROM DUAL UNION 
    SELECT 'Briceni' AS NUME_ROW,                                 '05' AS NR_ROW, '1400000' AS CUATM FROM DUAL UNION 
    SELECT 'Dondușeni' AS NUME_ROW,                               '06' AS NR_ROW, '3400000' AS CUATM FROM DUAL UNION 
    SELECT 'Drochia' AS NUME_ROW,                                 '07' AS NR_ROW, '3600000' AS CUATM FROM DUAL UNION 
    SELECT 'Edineț' AS NUME_ROW,                                  '08' AS NR_ROW, '4100000' AS CUATM FROM DUAL UNION 
    SELECT 'Falești' AS NUME_ROW,                                 '09' AS NR_ROW, '4300000' AS CUATM FROM DUAL UNION 
    SELECT 'Florești' AS NUME_ROW,                                '10' AS NR_ROW, '4500000' AS CUATM FROM DUAL UNION 
    SELECT 'Glodeni' AS NUME_ROW,                                 '11' AS NR_ROW, '4800000' AS CUATM FROM DUAL UNION
    SELECT 'Ocnița' AS NUME_ROW,                                  '12' AS NR_ROW, '6200000' AS CUATM FROM DUAL UNION 
    SELECT 'Rișcani' AS NUME_ROW,                                 '13' AS NR_ROW, '7100000' AS CUATM FROM DUAL UNION 
    SELECT 'Sîngerei' AS NUME_ROW,                                '14' AS NR_ROW, '7400000' AS CUATM FROM DUAL UNION 
    SELECT 'Soroca' AS NUME_ROW,                                  '15' AS NR_ROW, '7800000' AS CUATM FROM DUAL UNION 
    SELECT 'CENTRU' AS NUME_ROW,                                  '16' AS NR_ROW, '2222222' AS CUATM FROM DUAL UNION 
    SELECT 'Anenii Noi' AS NUME_ROW,                              '17' AS NR_ROW, '1000000' AS CUATM FROM DUAL UNION 
    SELECT 'Calarași' AS NUME_ROW,                                '18' AS NR_ROW, '2500000' AS CUATM FROM DUAL UNION 
    SELECT 'Criuleni' AS NUME_ROW,                                '19' AS NR_ROW, '3100000' AS CUATM FROM DUAL UNION 
    SELECT 'Dubăsari' AS NUME_ROW,                                '20' AS NR_ROW, '3800000' AS CUATM FROM DUAL UNION
    SELECT 'Hincești' AS NUME_ROW,                                '21' AS NR_ROW, '5300000' AS CUATM FROM DUAL UNION
    SELECT 'Ialoveni' AS NUME_ROW,                                '22' AS NR_ROW, '5500000' AS CUATM FROM DUAL UNION 
    SELECT 'Nisporeni' AS NUME_ROW,                               '23' AS NR_ROW, '6000000' AS CUATM FROM DUAL UNION 
    SELECT 'Orhei' AS NUME_ROW,                                   '24' AS NR_ROW, '6400000' AS CUATM FROM DUAL UNION 
    SELECT 'Rezina' AS NUME_ROW,                                  '25' AS NR_ROW, '6700000' AS CUATM FROM DUAL UNION 
    SELECT 'Strașeni' AS NUME_ROW,                                '26' AS NR_ROW, '8000000' AS CUATM FROM DUAL UNION 
    SELECT 'Șoldanești' AS NUME_ROW,                              '27' AS NR_ROW, '8300000' AS CUATM FROM DUAL UNION 
    SELECT 'Telenești' AS NUME_ROW,                               '28' AS NR_ROW, '8900000' AS CUATM FROM DUAL UNION 
    SELECT 'Ungheni' AS NUME_ROW,                                 '29' AS NR_ROW, '9200000' AS CUATM FROM DUAL UNION 
    SELECT 'SUD' AS NUME_ROW,                                     '30' AS NR_ROW, '3333333' AS CUATM FROM DUAL UNION 
    SELECT 'Basarabeasca' AS NUME_ROW,                            '31' AS NR_ROW, '1200000' AS CUATM FROM DUAL UNION
    SELECT 'Cahul' AS NUME_ROW,                                   '32' AS NR_ROW, '1700000' AS CUATM FROM DUAL UNION 
    SELECT 'Cantemir' AS NUME_ROW,                                '33' AS NR_ROW, '2100000' AS CUATM FROM DUAL UNION 
    SELECT 'Căușeni' AS NUME_ROW,                                 '34' AS NR_ROW, '2700000' AS CUATM FROM DUAL UNION 
    SELECT 'Cimișlia' AS NUME_ROW,                                '35' AS NR_ROW, '2900000' AS CUATM FROM DUAL UNION 
    SELECT 'Leova' AS NUME_ROW,                                   '36' AS NR_ROW, '5700000' AS CUATM FROM DUAL UNION 
    SELECT 'Ștefan Vodă' AS NUME_ROW,                             '37' AS NR_ROW, '8500000' AS CUATM FROM DUAL UNION 
    SELECT 'Taraclia' AS NUME_ROW,                                '38' AS NR_ROW, '8700000' AS CUATM FROM DUAL UNION 
    SELECT 'UAT Găgăuzia' AS NUME_ROW,                            '39' AS NR_ROW, '9600000' AS CUATM FROM DUAL UNION
    SELECT 'UAT dS Nistrului' AS NUME_ROW,                        '40' AS NR_ROW, '9800000' AS CUATM FROM DUAL UNION
    SELECT 'Mun.Bender' AS NUME_ROW,                              '41' AS NR_ROW, '0501000' AS CUATM FROM DUAL
      ) CD
                
                
                WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17 
               
               AND
               D.CAPITOL IN (1001,1002,1003,1004,1005,1006,1007)  
               GROUP BY
               CD.NR_ROW,   
               CD.NUME_ROW  
                     
--               HAVING
--                CIS2.NVAL(COUNT(DISTINCT CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.FORM = 17 AND
--               D.CAPITOL IN (1001,1002,1003,1004,1005,1006,1007) AND  D.RIND IN ('010','020','030','040','050','060','070','080','090','100','110','120','130') AND NP.CODUL = 2 AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END))   >0 OR  
--      
--        CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL = 2 THEN D.COL4 ELSE NULL END),1))  >0 OR 
--         
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL = 2 THEN D.COL4 ELSE NULL END),1)) 
--      - CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('020') AND NP.CODUL = 2 THEN D.COL4 ELSE NULL END),1))   >0 OR 
--     -- NULL  AS  COL4,
--      CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 2 THEN D.COL1 ELSE NULL END),1))  >0 OR 
--       
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 2 THEN D.COL5 ELSE NULL END),1))   + 
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 2 THEN D.COL6 ELSE NULL END),1))   +
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 2 THEN D.COL7 ELSE NULL END),1))   +
--       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 2 THEN D.COL8 ELSE NULL END),1))   +
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 2 THEN D.COL9 ELSE NULL END),1)) >0  
                    
             UNION             
               
     -- ROWS 09               
             SELECT
     :pID_MDTABLE -1,
     :pCOD_CUATM AS COD_CUATM,
     CD.NR_ROW AS NR_SECTIE,
     CD.NUME_ROW AS NUME_SECTIE,
     '10' AS NR_ROW_CUATM,
      10  AS ORDINE_CUATM,
     'de vedere' AS NUME_ROW_CUATM,
      CIS2.NVAL(COUNT(DISTINCT CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.FORM = 17 AND
               D.CAPITOL IN (1001,1002,1003,1004,1005,1006,1007) AND  D.RIND IN ('010','020','030','040','050','060','070','080','090','100','110','120','130') AND NP.CODUL = 3 AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END))  AS  COL1, 
       
     
      
       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL = 3 THEN D.COL4 ELSE NULL END),1))  AS  COL2,
         
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL = 3 THEN D.COL4 ELSE NULL END),1)) 
      - CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('020') AND NP.CODUL = 3 THEN D.COL4 ELSE NULL END),1))  AS  COL3,
       NULL AS  COL4,
      CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 3 THEN D.COL1 ELSE NULL END),1))  AS  COL5,
       
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 3 THEN D.COL5 ELSE NULL END),1))   + 
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 3 THEN D.COL6 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 3 THEN D.COL7 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 3 THEN D.COL8 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 3 THEN D.COL9 ELSE NULL END),1)) AS  COL6
       
       FROM    
             CIS2.VW_DATA_ALL D    
                      
               INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS) 
                
               -------------------------------------------------------------------------------------- 
               INNER JOIN CIS2.CL_N85_NPDS NP ON (RN.N85_NPDS=NP.CODUL) -- (NIÎP).(Col.8) = 1  -- NP.CODUL = 1
              
               -------------------------------------------------------------------------------------- 
                                         
               INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL) --(NIÎP).(Col.6) <> 6 --- NT.CODUL <> 6  
               INNER JOIN CIS2.VW_CL_CUATM VC ON (VC.CODUL = RN.CUATM )  
               --------------------------------------------------------------------------------------------------        
  
  CROSS JOIN
                                    
  ( 
    SELECT 'Total' AS NUME_ROW,                                   '01' AS NR_ROW, '0000000' AS CUATM FROM DUAL UNION
    SELECT 'Mun. Chișinau' AS NUME_ROW,                           '02' AS NR_ROW, '0100000' AS CUATM FROM DUAL UNION 
    SELECT 'NORD' AS NUME_ROW,                                    '03' AS NR_ROW, '1111111' AS CUATM FROM DUAL UNION 
    SELECT 'Mun. Balți' AS NUME_ROW,                              '04' AS NR_ROW, '0300000' AS CUATM FROM DUAL UNION 
    SELECT 'Briceni' AS NUME_ROW,                                 '05' AS NR_ROW, '1400000' AS CUATM FROM DUAL UNION 
    SELECT 'Dondușeni' AS NUME_ROW,                               '06' AS NR_ROW, '3400000' AS CUATM FROM DUAL UNION 
    SELECT 'Drochia' AS NUME_ROW,                                 '07' AS NR_ROW, '3600000' AS CUATM FROM DUAL UNION 
    SELECT 'Edineț' AS NUME_ROW,                                  '08' AS NR_ROW, '4100000' AS CUATM FROM DUAL UNION 
    SELECT 'Falești' AS NUME_ROW,                                 '09' AS NR_ROW, '4300000' AS CUATM FROM DUAL UNION 
    SELECT 'Florești' AS NUME_ROW,                                '10' AS NR_ROW, '4500000' AS CUATM FROM DUAL UNION 
    SELECT 'Glodeni' AS NUME_ROW,                                 '11' AS NR_ROW, '4800000' AS CUATM FROM DUAL UNION
    SELECT 'Ocnița' AS NUME_ROW,                                  '12' AS NR_ROW, '6200000' AS CUATM FROM DUAL UNION 
    SELECT 'Rișcani' AS NUME_ROW,                                 '13' AS NR_ROW, '7100000' AS CUATM FROM DUAL UNION 
    SELECT 'Sîngerei' AS NUME_ROW,                                '14' AS NR_ROW, '7400000' AS CUATM FROM DUAL UNION 
    SELECT 'Soroca' AS NUME_ROW,                                  '15' AS NR_ROW, '7800000' AS CUATM FROM DUAL UNION 
    SELECT 'CENTRU' AS NUME_ROW,                                  '16' AS NR_ROW, '2222222' AS CUATM FROM DUAL UNION 
    SELECT 'Anenii Noi' AS NUME_ROW,                              '17' AS NR_ROW, '1000000' AS CUATM FROM DUAL UNION 
    SELECT 'Calarași' AS NUME_ROW,                                '18' AS NR_ROW, '2500000' AS CUATM FROM DUAL UNION 
    SELECT 'Criuleni' AS NUME_ROW,                                '19' AS NR_ROW, '3100000' AS CUATM FROM DUAL UNION 
    SELECT 'Dubăsari' AS NUME_ROW,                                '20' AS NR_ROW, '3800000' AS CUATM FROM DUAL UNION
    SELECT 'Hincești' AS NUME_ROW,                                '21' AS NR_ROW, '5300000' AS CUATM FROM DUAL UNION
    SELECT 'Ialoveni' AS NUME_ROW,                                '22' AS NR_ROW, '5500000' AS CUATM FROM DUAL UNION 
    SELECT 'Nisporeni' AS NUME_ROW,                               '23' AS NR_ROW, '6000000' AS CUATM FROM DUAL UNION 
    SELECT 'Orhei' AS NUME_ROW,                                   '24' AS NR_ROW, '6400000' AS CUATM FROM DUAL UNION 
    SELECT 'Rezina' AS NUME_ROW,                                  '25' AS NR_ROW, '6700000' AS CUATM FROM DUAL UNION 
    SELECT 'Strașeni' AS NUME_ROW,                                '26' AS NR_ROW, '8000000' AS CUATM FROM DUAL UNION 
    SELECT 'Șoldanești' AS NUME_ROW,                              '27' AS NR_ROW, '8300000' AS CUATM FROM DUAL UNION 
    SELECT 'Telenești' AS NUME_ROW,                               '28' AS NR_ROW, '8900000' AS CUATM FROM DUAL UNION 
    SELECT 'Ungheni' AS NUME_ROW,                                 '29' AS NR_ROW, '9200000' AS CUATM FROM DUAL UNION 
    SELECT 'SUD' AS NUME_ROW,                                     '30' AS NR_ROW, '3333333' AS CUATM FROM DUAL UNION 
    SELECT 'Basarabeasca' AS NUME_ROW,                            '31' AS NR_ROW, '1200000' AS CUATM FROM DUAL UNION
    SELECT 'Cahul' AS NUME_ROW,                                   '32' AS NR_ROW, '1700000' AS CUATM FROM DUAL UNION 
    SELECT 'Cantemir' AS NUME_ROW,                                '33' AS NR_ROW, '2100000' AS CUATM FROM DUAL UNION 
    SELECT 'Căușeni' AS NUME_ROW,                                 '34' AS NR_ROW, '2700000' AS CUATM FROM DUAL UNION 
    SELECT 'Cimișlia' AS NUME_ROW,                                '35' AS NR_ROW, '2900000' AS CUATM FROM DUAL UNION 
    SELECT 'Leova' AS NUME_ROW,                                   '36' AS NR_ROW, '5700000' AS CUATM FROM DUAL UNION 
    SELECT 'Ștefan Vodă' AS NUME_ROW,                             '37' AS NR_ROW, '8500000' AS CUATM FROM DUAL UNION 
    SELECT 'Taraclia' AS NUME_ROW,                                '38' AS NR_ROW, '8700000' AS CUATM FROM DUAL UNION 
    SELECT 'UAT Găgăuzia' AS NUME_ROW,                            '39' AS NR_ROW, '9600000' AS CUATM FROM DUAL UNION
    SELECT 'UAT dS Nistrului' AS NUME_ROW,                        '40' AS NR_ROW, '9800000' AS CUATM FROM DUAL UNION
    SELECT 'Mun.Bender' AS NUME_ROW,                              '41' AS NR_ROW, '0501000' AS CUATM FROM DUAL
      ) CD
               
                
                
                WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17  AND
               D.CAPITOL IN (1001,1002,1003,1004,1005,1006,1007) 
               GROUP BY
               CD.NR_ROW,   
               CD.NUME_ROW 
               
--               HAVING 
--              
--       CIS2.NVAL(COUNT(DISTINCT CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.FORM = 17 AND
--               D.CAPITOL IN (1001,1002,1003,1004,1005,1006,1007) AND  D.RIND IN ('010','020','030','040','050','060','070','080','090','100','110','120','130') AND NP.CODUL = 3 AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END))  >0 OR  
--       
--     
--      
--       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL = 3 THEN D.COL4 ELSE NULL END),1)) >0 OR 
--         
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL = 3 THEN D.COL4 ELSE NULL END),1)) 
--      - CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('020') AND NP.CODUL = 3 THEN D.COL4 ELSE NULL END),1))  >0 OR 
--      -- NULL AS  COL4,
--      CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 3 THEN D.COL1 ELSE NULL END),1))  >0 OR 
--       
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 3 THEN D.COL5 ELSE NULL END),1))   + 
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 3 THEN D.COL6 ELSE NULL END),1))   +
--       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 3 THEN D.COL7 ELSE NULL END),1))   +
--       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 3 THEN D.COL8 ELSE NULL END),1))   +
--       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 3 THEN D.COL9 ELSE NULL END),1)) >0 
--       
                UNION             
               
     -- ROWS 10               
             SELECT
     :pID_MDTABLE -1,
     :pCOD_CUATM AS COD_CUATM,
     CD.NR_ROW AS NR_SECTIE,
     CD.NUME_ROW AS NUME_SECTIE,
     '11' AS NR_ROW_CUATM,
      11  AS ORDINE_CUATM,
    'de intelect' AS NUME_ROW_CUATM,
      CIS2.NVAL(COUNT(DISTINCT CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.FORM = 17 AND
               D.CAPITOL IN (1001,1002,1003,1004,1005,1006,1007) AND  D.RIND IN ('010','020','030','040','050','060','070','080','090','100','110','120','130') AND NP.CODUL = 4 AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END))  AS  COL1, 
       
    
      
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL = 4 THEN D.COL4 ELSE NULL END),1))  AS  COL2,
         
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL = 4 THEN D.COL4 ELSE NULL END),1)) 
      - CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('020') AND NP.CODUL = 4 THEN D.COL4 ELSE NULL END),1))  AS  COL3,
       NULL AS  COL4,
      CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 4 THEN D.COL1 ELSE NULL END),1))  AS  COL5,
       
       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 4 THEN D.COL5 ELSE NULL END),1))   + 
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 4 THEN D.COL6 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 4 THEN D.COL7 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 4 THEN D.COL8 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 4 THEN D.COL9 ELSE NULL END),1)) AS  COL6
       
       FROM    
             CIS2.VW_DATA_ALL D    
                      
               INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS)  
                -------------------------------------------------------------------------------------- 
               INNER JOIN CIS2.CL_N85_NPDS NP ON (RN.N85_NPDS=NP.CODUL) -- (NIÎP).(Col.8) = 1  -- NP.CODUL = 1
              
               -------------------------------------------------------------------------------------- 
                                         
               INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL) --(NIÎP).(Col.6) <> 6 --- NT.CODUL <> 6 
               INNER JOIN CIS2.VW_CL_CUATM VC ON (VC.CODUL = RN.CUATM )  
               --------------------------------------------------------------------------------------------------        
  
  CROSS JOIN
                                    
  ( 
    SELECT 'Total' AS NUME_ROW,                                   '01' AS NR_ROW, '0000000' AS CUATM FROM DUAL UNION
    SELECT 'Mun. Chișinau' AS NUME_ROW,                           '02' AS NR_ROW, '0100000' AS CUATM FROM DUAL UNION 
    SELECT 'NORD' AS NUME_ROW,                                    '03' AS NR_ROW, '1111111' AS CUATM FROM DUAL UNION 
    SELECT 'Mun. Balți' AS NUME_ROW,                              '04' AS NR_ROW, '0300000' AS CUATM FROM DUAL UNION 
    SELECT 'Briceni' AS NUME_ROW,                                 '05' AS NR_ROW, '1400000' AS CUATM FROM DUAL UNION 
    SELECT 'Dondușeni' AS NUME_ROW,                               '06' AS NR_ROW, '3400000' AS CUATM FROM DUAL UNION 
    SELECT 'Drochia' AS NUME_ROW,                                 '07' AS NR_ROW, '3600000' AS CUATM FROM DUAL UNION 
    SELECT 'Edineț' AS NUME_ROW,                                  '08' AS NR_ROW, '4100000' AS CUATM FROM DUAL UNION 
    SELECT 'Falești' AS NUME_ROW,                                 '09' AS NR_ROW, '4300000' AS CUATM FROM DUAL UNION 
    SELECT 'Florești' AS NUME_ROW,                                '10' AS NR_ROW, '4500000' AS CUATM FROM DUAL UNION 
    SELECT 'Glodeni' AS NUME_ROW,                                 '11' AS NR_ROW, '4800000' AS CUATM FROM DUAL UNION
    SELECT 'Ocnița' AS NUME_ROW,                                  '12' AS NR_ROW, '6200000' AS CUATM FROM DUAL UNION 
    SELECT 'Rișcani' AS NUME_ROW,                                 '13' AS NR_ROW, '7100000' AS CUATM FROM DUAL UNION 
    SELECT 'Sîngerei' AS NUME_ROW,                                '14' AS NR_ROW, '7400000' AS CUATM FROM DUAL UNION 
    SELECT 'Soroca' AS NUME_ROW,                                  '15' AS NR_ROW, '7800000' AS CUATM FROM DUAL UNION 
    SELECT 'CENTRU' AS NUME_ROW,                                  '16' AS NR_ROW, '2222222' AS CUATM FROM DUAL UNION 
    SELECT 'Anenii Noi' AS NUME_ROW,                              '17' AS NR_ROW, '1000000' AS CUATM FROM DUAL UNION 
    SELECT 'Calarași' AS NUME_ROW,                                '18' AS NR_ROW, '2500000' AS CUATM FROM DUAL UNION 
    SELECT 'Criuleni' AS NUME_ROW,                                '19' AS NR_ROW, '3100000' AS CUATM FROM DUAL UNION 
    SELECT 'Dubăsari' AS NUME_ROW,                                '20' AS NR_ROW, '3800000' AS CUATM FROM DUAL UNION
    SELECT 'Hincești' AS NUME_ROW,                                '21' AS NR_ROW, '5300000' AS CUATM FROM DUAL UNION
    SELECT 'Ialoveni' AS NUME_ROW,                                '22' AS NR_ROW, '5500000' AS CUATM FROM DUAL UNION 
    SELECT 'Nisporeni' AS NUME_ROW,                               '23' AS NR_ROW, '6000000' AS CUATM FROM DUAL UNION 
    SELECT 'Orhei' AS NUME_ROW,                                   '24' AS NR_ROW, '6400000' AS CUATM FROM DUAL UNION 
    SELECT 'Rezina' AS NUME_ROW,                                  '25' AS NR_ROW, '6700000' AS CUATM FROM DUAL UNION 
    SELECT 'Strașeni' AS NUME_ROW,                                '26' AS NR_ROW, '8000000' AS CUATM FROM DUAL UNION 
    SELECT 'Șoldanești' AS NUME_ROW,                              '27' AS NR_ROW, '8300000' AS CUATM FROM DUAL UNION 
    SELECT 'Telenești' AS NUME_ROW,                               '28' AS NR_ROW, '8900000' AS CUATM FROM DUAL UNION 
    SELECT 'Ungheni' AS NUME_ROW,                                 '29' AS NR_ROW, '9200000' AS CUATM FROM DUAL UNION 
    SELECT 'SUD' AS NUME_ROW,                                     '30' AS NR_ROW, '3333333' AS CUATM FROM DUAL UNION 
    SELECT 'Basarabeasca' AS NUME_ROW,                            '31' AS NR_ROW, '1200000' AS CUATM FROM DUAL UNION
    SELECT 'Cahul' AS NUME_ROW,                                   '32' AS NR_ROW, '1700000' AS CUATM FROM DUAL UNION 
    SELECT 'Cantemir' AS NUME_ROW,                                '33' AS NR_ROW, '2100000' AS CUATM FROM DUAL UNION 
    SELECT 'Căușeni' AS NUME_ROW,                                 '34' AS NR_ROW, '2700000' AS CUATM FROM DUAL UNION 
    SELECT 'Cimișlia' AS NUME_ROW,                                '35' AS NR_ROW, '2900000' AS CUATM FROM DUAL UNION 
    SELECT 'Leova' AS NUME_ROW,                                   '36' AS NR_ROW, '5700000' AS CUATM FROM DUAL UNION 
    SELECT 'Ștefan Vodă' AS NUME_ROW,                             '37' AS NR_ROW, '8500000' AS CUATM FROM DUAL UNION 
    SELECT 'Taraclia' AS NUME_ROW,                                '38' AS NR_ROW, '8700000' AS CUATM FROM DUAL UNION 
    SELECT 'UAT Găgăuzia' AS NUME_ROW,                            '39' AS NR_ROW, '9600000' AS CUATM FROM DUAL UNION
    SELECT 'UAT dS Nistrului' AS NUME_ROW,                        '40' AS NR_ROW, '9800000' AS CUATM FROM DUAL UNION
    SELECT 'Mun.Bender' AS NUME_ROW,                              '41' AS NR_ROW, '0501000' AS CUATM FROM DUAL
      ) CD   
               
                
                WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17 
               
               AND
               D.CAPITOL IN (1001,1002,1003,1004,1005,1006,1007) 
               GROUP BY
               CD.NR_ROW,   
               CD.NUME_ROW 
               
--                HAVING 
-- CIS2.NVAL(COUNT(DISTINCT CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.FORM = 17 AND
--               D.CAPITOL IN (1001,1002,1003,1004,1005,1006,1007) AND  D.RIND IN ('010','020','030','040','050','060','070','080','090','100','110','120','130') AND NP.CODUL = 4 AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END))  >0 OR  
--       
--    
--      
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL = 4 THEN D.COL4 ELSE NULL END),1))  >0 OR 
--         
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL = 4 THEN D.COL4 ELSE NULL END),1)) 
--      - CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('020') AND NP.CODUL = 4 THEN D.COL4 ELSE NULL END),1)) >0 OR 
--    --   NULL AS  COL4,
--      CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 4 THEN D.COL1 ELSE NULL END),1))  >0 OR 
--       
--       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 4 THEN D.COL5 ELSE NULL END),1))   + 
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 4 THEN D.COL6 ELSE NULL END),1))   +
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 4 THEN D.COL7 ELSE NULL END),1))   +
--       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 4 THEN D.COL8 ELSE NULL END),1))   +
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 4 THEN D.COL9 ELSE NULL END),1)) >0               
               
               UNION             
               
     -- ROWS 11               
             SELECT
     :pID_MDTABLE -1,
     :pCOD_CUATM AS COD_CUATM,
     CD.NR_ROW AS NR_SECTIE,
     CD.NUME_ROW AS NUME_SECTIE,
     '12' AS NR_ROW_CUATM,
      12  AS ORDINE_CUATM,
    'cu dereglări ale aparatului locomotor' AS NUME_ROW_CUATM,
        CIS2.NVAL(COUNT(DISTINCT CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.FORM = 17 AND
               D.CAPITOL IN (1001,1002,1003,1004,1005,1006,1007) AND  D.RIND IN ('010','020','030','040','050','060','070','080','090','100','110','120','130') AND NP.CODUL = 5 AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END))  AS  COL1, 
       
   
      
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL = 5 THEN D.COL4 ELSE NULL END),1))  AS  COL2,
         
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL = 5 THEN D.COL4 ELSE NULL END),1)) 
      - CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('020') AND NP.CODUL = 5 THEN D.COL4 ELSE NULL END),1))  AS  COL3,
       NULL AS  COL4,
      CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 5 THEN D.COL1 ELSE NULL END),1))  AS  COL5,
       
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 5 THEN D.COL5 ELSE NULL END),1))   + 
       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 5 THEN D.COL6 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 5 THEN D.COL7 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 5 THEN D.COL8 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 5 THEN D.COL9 ELSE NULL END),1)) AS  COL6
       
       FROM    
             CIS2.VW_DATA_ALL D    
                      
               INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS)  
               
                -------------------------------------------------------------------------------------- 
               INNER JOIN CIS2.CL_N85_NPDS NP ON (RN.N85_NPDS=NP.CODUL) -- (NIÎP).(Col.8) = 1  -- NP.CODUL = 1
              
               -------------------------------------------------------------------------------------- 
                                         
               INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL) --(NIÎP).(Col.6) <> 6 --- NT.CODUL <> 6   
               INNER JOIN CIS2.VW_CL_CUATM VC ON (VC.CODUL = RN.CUATM )  
               --------------------------------------------------------------------------------------------------        
  
  CROSS JOIN
                                    
  ( 
    SELECT 'Total' AS NUME_ROW,                                   '01' AS NR_ROW, '0000000' AS CUATM FROM DUAL UNION
    SELECT 'Mun. Chișinau' AS NUME_ROW,                           '02' AS NR_ROW, '0100000' AS CUATM FROM DUAL UNION 
    SELECT 'NORD' AS NUME_ROW,                                    '03' AS NR_ROW, '1111111' AS CUATM FROM DUAL UNION 
    SELECT 'Mun. Balți' AS NUME_ROW,                              '04' AS NR_ROW, '0300000' AS CUATM FROM DUAL UNION 
    SELECT 'Briceni' AS NUME_ROW,                                 '05' AS NR_ROW, '1400000' AS CUATM FROM DUAL UNION 
    SELECT 'Dondușeni' AS NUME_ROW,                               '06' AS NR_ROW, '3400000' AS CUATM FROM DUAL UNION 
    SELECT 'Drochia' AS NUME_ROW,                                 '07' AS NR_ROW, '3600000' AS CUATM FROM DUAL UNION 
    SELECT 'Edineț' AS NUME_ROW,                                  '08' AS NR_ROW, '4100000' AS CUATM FROM DUAL UNION 
    SELECT 'Falești' AS NUME_ROW,                                 '09' AS NR_ROW, '4300000' AS CUATM FROM DUAL UNION 
    SELECT 'Florești' AS NUME_ROW,                                '10' AS NR_ROW, '4500000' AS CUATM FROM DUAL UNION 
    SELECT 'Glodeni' AS NUME_ROW,                                 '11' AS NR_ROW, '4800000' AS CUATM FROM DUAL UNION
    SELECT 'Ocnița' AS NUME_ROW,                                  '12' AS NR_ROW, '6200000' AS CUATM FROM DUAL UNION 
    SELECT 'Rișcani' AS NUME_ROW,                                 '13' AS NR_ROW, '7100000' AS CUATM FROM DUAL UNION 
    SELECT 'Sîngerei' AS NUME_ROW,                                '14' AS NR_ROW, '7400000' AS CUATM FROM DUAL UNION 
    SELECT 'Soroca' AS NUME_ROW,                                  '15' AS NR_ROW, '7800000' AS CUATM FROM DUAL UNION 
    SELECT 'CENTRU' AS NUME_ROW,                                  '16' AS NR_ROW, '2222222' AS CUATM FROM DUAL UNION 
    SELECT 'Anenii Noi' AS NUME_ROW,                              '17' AS NR_ROW, '1000000' AS CUATM FROM DUAL UNION 
    SELECT 'Calarași' AS NUME_ROW,                                '18' AS NR_ROW, '2500000' AS CUATM FROM DUAL UNION 
    SELECT 'Criuleni' AS NUME_ROW,                                '19' AS NR_ROW, '3100000' AS CUATM FROM DUAL UNION 
    SELECT 'Dubăsari' AS NUME_ROW,                                '20' AS NR_ROW, '3800000' AS CUATM FROM DUAL UNION
    SELECT 'Hincești' AS NUME_ROW,                                '21' AS NR_ROW, '5300000' AS CUATM FROM DUAL UNION
    SELECT 'Ialoveni' AS NUME_ROW,                                '22' AS NR_ROW, '5500000' AS CUATM FROM DUAL UNION 
    SELECT 'Nisporeni' AS NUME_ROW,                               '23' AS NR_ROW, '6000000' AS CUATM FROM DUAL UNION 
    SELECT 'Orhei' AS NUME_ROW,                                   '24' AS NR_ROW, '6400000' AS CUATM FROM DUAL UNION 
    SELECT 'Rezina' AS NUME_ROW,                                  '25' AS NR_ROW, '6700000' AS CUATM FROM DUAL UNION 
    SELECT 'Strașeni' AS NUME_ROW,                                '26' AS NR_ROW, '8000000' AS CUATM FROM DUAL UNION 
    SELECT 'Șoldanești' AS NUME_ROW,                              '27' AS NR_ROW, '8300000' AS CUATM FROM DUAL UNION 
    SELECT 'Telenești' AS NUME_ROW,                               '28' AS NR_ROW, '8900000' AS CUATM FROM DUAL UNION 
    SELECT 'Ungheni' AS NUME_ROW,                                 '29' AS NR_ROW, '9200000' AS CUATM FROM DUAL UNION 
    SELECT 'SUD' AS NUME_ROW,                                     '30' AS NR_ROW, '3333333' AS CUATM FROM DUAL UNION 
    SELECT 'Basarabeasca' AS NUME_ROW,                            '31' AS NR_ROW, '1200000' AS CUATM FROM DUAL UNION
    SELECT 'Cahul' AS NUME_ROW,                                   '32' AS NR_ROW, '1700000' AS CUATM FROM DUAL UNION 
    SELECT 'Cantemir' AS NUME_ROW,                                '33' AS NR_ROW, '2100000' AS CUATM FROM DUAL UNION 
    SELECT 'Căușeni' AS NUME_ROW,                                 '34' AS NR_ROW, '2700000' AS CUATM FROM DUAL UNION 
    SELECT 'Cimișlia' AS NUME_ROW,                                '35' AS NR_ROW, '2900000' AS CUATM FROM DUAL UNION 
    SELECT 'Leova' AS NUME_ROW,                                   '36' AS NR_ROW, '5700000' AS CUATM FROM DUAL UNION 
    SELECT 'Ștefan Vodă' AS NUME_ROW,                             '37' AS NR_ROW, '8500000' AS CUATM FROM DUAL UNION 
    SELECT 'Taraclia' AS NUME_ROW,                                '38' AS NR_ROW, '8700000' AS CUATM FROM DUAL UNION 
    SELECT 'UAT Găgăuzia' AS NUME_ROW,                            '39' AS NR_ROW, '9600000' AS CUATM FROM DUAL UNION
    SELECT 'UAT dS Nistrului' AS NUME_ROW,                        '40' AS NR_ROW, '9800000' AS CUATM FROM DUAL UNION
    SELECT 'Mun.Bender' AS NUME_ROW,                              '41' AS NR_ROW, '0501000' AS CUATM FROM DUAL
      ) CD 
                
                WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17 
               
               
               AND
               D.CAPITOL IN (1001,1002,1003,1004,1005,1006,1007)  
               GROUP BY
               CD.NR_ROW,   
               CD.NUME_ROW 
               
--                HAVING
--               CIS2.NVAL(COUNT(DISTINCT CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.FORM = 17 AND
--               D.CAPITOL IN (1001,1002,1003,1004,1005,1006,1007) AND  D.RIND IN ('010','020','030','040','050','060','070','080','090','100','110','120','130') AND NP.CODUL = 5 AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END))   >0 OR  
--       
--   
--      
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL = 5 THEN D.COL4 ELSE NULL END),1))   >0 OR 
--         
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL = 5 THEN D.COL4 ELSE NULL END),1)) 
--      - CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('020') AND NP.CODUL = 5 THEN D.COL4 ELSE NULL END),1))  >0 OR 
----       NULL AS  COL4,
--      CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 5 THEN D.COL1 ELSE NULL END),1))   >0 OR 
--       
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 5 THEN D.COL5 ELSE NULL END),1))   + 
--       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 5 THEN D.COL6 ELSE NULL END),1))   +
--       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 5 THEN D.COL7 ELSE NULL END),1))   +
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 5 THEN D.COL8 ELSE NULL END),1))   +
--       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 5 THEN D.COL9 ELSE NULL END),1))  >0  
               
           UNION     
               -- ROWS 12               
             SELECT
     :pID_MDTABLE -1,
     :pCOD_CUATM AS COD_CUATM,
     CD.NR_ROW AS NR_SECTIE,
     CD.NUME_ROW AS NUME_SECTIE,
     '13' AS NR_ROW_CUATM,
      13  AS ORDINE_CUATM,
    'alte' AS NUME_ROW_CUATM,
        CIS2.NVAL(COUNT(DISTINCT CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.FORM = 17 AND
               D.CAPITOL IN (1001,1002,1003,1004,1005,1006,1007) AND  D.RIND IN ('010','020','030','040','050','060','070','080','090','100','110','120','130') AND NP.CODUL = 6 AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END))  AS  COL1, 
       
    
      
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL = 6 THEN D.COL4 ELSE NULL END),1))  AS  COL2,
         
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL = 6 THEN D.COL4 ELSE NULL END),1)) 
      - CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('020') AND NP.CODUL = 6 THEN D.COL4 ELSE NULL END),1))  AS  COL3,
      
      NULL AS  COL4,
       
      CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 6 THEN D.COL1 ELSE NULL END),1))  AS  COL5,
       
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 6 THEN D.COL5 ELSE NULL END),1))   + 
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 6 THEN D.COL6 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 6 THEN D.COL7 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 6 THEN D.COL8 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 6 THEN D.COL9 ELSE NULL END),1)) AS  COL6
       
       FROM    
             CIS2.VW_DATA_ALL D    
                      
               INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS)  
                
                 -------------------------------------------------------------------------------------- 
               INNER JOIN CIS2.CL_N85_NPDS NP ON (RN.N85_NPDS=NP.CODUL) -- (NIÎP).(Col.8) = 1  -- NP.CODUL = 1
              
               -------------------------------------------------------------------------------------- 
                                         
               INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL) --(NIÎP).(Col.6) <> 6 --- NT.CODUL <> 6  
               INNER JOIN CIS2.VW_CL_CUATM VC ON (VC.CODUL = RN.CUATM )  
               --------------------------------------------------------------------------------------------------        
  
  CROSS JOIN
                                    
  ( 
    SELECT 'Total' AS NUME_ROW,                                   '01' AS NR_ROW, '0000000' AS CUATM FROM DUAL UNION
    SELECT 'Mun. Chișinau' AS NUME_ROW,                           '02' AS NR_ROW, '0100000' AS CUATM FROM DUAL UNION 
    SELECT 'NORD' AS NUME_ROW,                                    '03' AS NR_ROW, '1111111' AS CUATM FROM DUAL UNION 
    SELECT 'Mun. Balți' AS NUME_ROW,                              '04' AS NR_ROW, '0300000' AS CUATM FROM DUAL UNION 
    SELECT 'Briceni' AS NUME_ROW,                                 '05' AS NR_ROW, '1400000' AS CUATM FROM DUAL UNION 
    SELECT 'Dondușeni' AS NUME_ROW,                               '06' AS NR_ROW, '3400000' AS CUATM FROM DUAL UNION 
    SELECT 'Drochia' AS NUME_ROW,                                 '07' AS NR_ROW, '3600000' AS CUATM FROM DUAL UNION 
    SELECT 'Edineț' AS NUME_ROW,                                  '08' AS NR_ROW, '4100000' AS CUATM FROM DUAL UNION 
    SELECT 'Falești' AS NUME_ROW,                                 '09' AS NR_ROW, '4300000' AS CUATM FROM DUAL UNION 
    SELECT 'Florești' AS NUME_ROW,                                '10' AS NR_ROW, '4500000' AS CUATM FROM DUAL UNION 
    SELECT 'Glodeni' AS NUME_ROW,                                 '11' AS NR_ROW, '4800000' AS CUATM FROM DUAL UNION
    SELECT 'Ocnița' AS NUME_ROW,                                  '12' AS NR_ROW, '6200000' AS CUATM FROM DUAL UNION 
    SELECT 'Rișcani' AS NUME_ROW,                                 '13' AS NR_ROW, '7100000' AS CUATM FROM DUAL UNION 
    SELECT 'Sîngerei' AS NUME_ROW,                                '14' AS NR_ROW, '7400000' AS CUATM FROM DUAL UNION 
    SELECT 'Soroca' AS NUME_ROW,                                  '15' AS NR_ROW, '7800000' AS CUATM FROM DUAL UNION 
    SELECT 'CENTRU' AS NUME_ROW,                                  '16' AS NR_ROW, '2222222' AS CUATM FROM DUAL UNION 
    SELECT 'Anenii Noi' AS NUME_ROW,                              '17' AS NR_ROW, '1000000' AS CUATM FROM DUAL UNION 
    SELECT 'Calarași' AS NUME_ROW,                                '18' AS NR_ROW, '2500000' AS CUATM FROM DUAL UNION 
    SELECT 'Criuleni' AS NUME_ROW,                                '19' AS NR_ROW, '3100000' AS CUATM FROM DUAL UNION 
    SELECT 'Dubăsari' AS NUME_ROW,                                '20' AS NR_ROW, '3800000' AS CUATM FROM DUAL UNION
    SELECT 'Hincești' AS NUME_ROW,                                '21' AS NR_ROW, '5300000' AS CUATM FROM DUAL UNION
    SELECT 'Ialoveni' AS NUME_ROW,                                '22' AS NR_ROW, '5500000' AS CUATM FROM DUAL UNION 
    SELECT 'Nisporeni' AS NUME_ROW,                               '23' AS NR_ROW, '6000000' AS CUATM FROM DUAL UNION 
    SELECT 'Orhei' AS NUME_ROW,                                   '24' AS NR_ROW, '6400000' AS CUATM FROM DUAL UNION 
    SELECT 'Rezina' AS NUME_ROW,                                  '25' AS NR_ROW, '6700000' AS CUATM FROM DUAL UNION 
    SELECT 'Strașeni' AS NUME_ROW,                                '26' AS NR_ROW, '8000000' AS CUATM FROM DUAL UNION 
    SELECT 'Șoldanești' AS NUME_ROW,                              '27' AS NR_ROW, '8300000' AS CUATM FROM DUAL UNION 
    SELECT 'Telenești' AS NUME_ROW,                               '28' AS NR_ROW, '8900000' AS CUATM FROM DUAL UNION 
    SELECT 'Ungheni' AS NUME_ROW,                                 '29' AS NR_ROW, '9200000' AS CUATM FROM DUAL UNION 
    SELECT 'SUD' AS NUME_ROW,                                     '30' AS NR_ROW, '3333333' AS CUATM FROM DUAL UNION 
    SELECT 'Basarabeasca' AS NUME_ROW,                            '31' AS NR_ROW, '1200000' AS CUATM FROM DUAL UNION
    SELECT 'Cahul' AS NUME_ROW,                                   '32' AS NR_ROW, '1700000' AS CUATM FROM DUAL UNION 
    SELECT 'Cantemir' AS NUME_ROW,                                '33' AS NR_ROW, '2100000' AS CUATM FROM DUAL UNION 
    SELECT 'Căușeni' AS NUME_ROW,                                 '34' AS NR_ROW, '2700000' AS CUATM FROM DUAL UNION 
    SELECT 'Cimișlia' AS NUME_ROW,                                '35' AS NR_ROW, '2900000' AS CUATM FROM DUAL UNION 
    SELECT 'Leova' AS NUME_ROW,                                   '36' AS NR_ROW, '5700000' AS CUATM FROM DUAL UNION 
    SELECT 'Ștefan Vodă' AS NUME_ROW,                             '37' AS NR_ROW, '8500000' AS CUATM FROM DUAL UNION 
    SELECT 'Taraclia' AS NUME_ROW,                                '38' AS NR_ROW, '8700000' AS CUATM FROM DUAL UNION 
    SELECT 'UAT Găgăuzia' AS NUME_ROW,                            '39' AS NR_ROW, '9600000' AS CUATM FROM DUAL UNION
    SELECT 'UAT dS Nistrului' AS NUME_ROW,                        '40' AS NR_ROW, '9800000' AS CUATM FROM DUAL UNION
    SELECT 'Mun.Bender' AS NUME_ROW,                              '41' AS NR_ROW, '0501000' AS CUATM FROM DUAL
      ) CD 
               
                
                WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17 
               
               AND
               D.CAPITOL IN (1001,1002,1003,1004,1005,1006,1007) 
               GROUP BY
               CD.NR_ROW,   
               CD.NUME_ROW
               
--               HAVING
--                CIS2.NVAL(COUNT(DISTINCT CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.FORM = 17 AND
--               D.CAPITOL IN (1001,1002,1003,1004,1005,1006,1007) AND  D.RIND IN ('010','020','030','040','050','060','070','080','090','100','110','120','130') AND NP.CODUL = 6 AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END)) >0 OR  
--       
--    
--      
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL = 6 THEN D.COL4 ELSE NULL END),1)) >0 OR 
--         
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL = 6 THEN D.COL4 ELSE NULL END),1)) 
--      - CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1001)  AND  D.RIND IN ('020') AND NP.CODUL = 6 THEN D.COL4 ELSE NULL END),1)) >0 OR 
--      
--      --NULL AS  COL4,
--       
--      CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 6 THEN D.COL1 ELSE NULL END),1)) >0 OR 
--       
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 6 THEN D.COL5 ELSE NULL END),1))   + 
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 6 THEN D.COL6 ELSE NULL END),1))   +
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 6 THEN D.COL7 ELSE NULL END),1))   +
--       CIS2.NVAL(ROUND(SUM(CASE WHEN VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 6 THEN D.COL8 ELSE NULL END),1))   +
--       CIS2.NVAL(ROUND(SUM(CASE WHEN  VC.FULL_CODE LIKE '%'||CD.CUATM||';%'AND  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 6 THEN D.COL9 ELSE NULL END),1)) >0 
                
               ) DC 
 
    ORDER BY DC.ORDINE_CUATM