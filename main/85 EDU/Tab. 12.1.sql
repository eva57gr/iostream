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
--    COL5,
--    COL6
--   )

    SELECT   
--    :pPERIOADA AS PERIOADA,
--    :pFORM AS FORM,
--    :pFORM_VERS AS FORM_VERS,
--    :pID_MDTABLE AS ID_MDTABLE,
--    :pCOD_CUATM AS COD_CUATM,
--    '0' AS NR_SECTIE,
--    '0' AS NUME_SECTIE,
--    '0' AS NR_SECTIE1,
--    '0' AS NUME_SECTIE1,
--    '0' AS NR_SECTIE2,
--    '0' AS NUME_SECTIE2,


     DC.NR_ROW,
     DC.ORDINE,
     DC.DECIMAL_POS,
     DC.NUME_ROW,
        CASE WHEN  DC.COL1 = 0 THEN NULL ELSE DC.COL1 END AS COL1,
        CASE WHEN  DC.COL2 = 0 THEN NULL ELSE DC.COL2 END AS COL2,
        CASE WHEN  DC.COL3 = 0 THEN NULL ELSE DC.COL3 END AS COL3,
        CASE WHEN  DC.COL4 = 0 THEN NULL ELSE DC.COL4 END AS COL4,
        CASE WHEN  DC.COL5 = 0 THEN NULL ELSE DC.COL5 END AS COL5,
        CASE WHEN  DC.COL6 = 0 THEN NULL ELSE DC.COL6 END AS COL6
        FROM
       

     (
     SELECT
     CD.NR_ROW AS NR_ROW,
     CD.NR_ROW  AS ORDINE,
    '000000' AS DECIMAL_POS,
     CD.NUME_ROW AS NUME_ROW,
     
     ROUND(COUNT (DISTINCT CASE WHEN VC.FUlL_CODE LIKE '%'||CD.CUATM||';%'   AND  D.CAPITOL IN (1002)    THEN D.CUIIO  ELSE NULL END),1)  AS COL1,
     
     COUNT( DISTINCT CASE WHEN VC.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND  D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  CIS2.NVAL(D.COL5) <> 0  
     AND  D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  CIS2.NVAL(D.COL6) = 0  AND  D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  CIS2.NVAL(D.COL7) = 0
     AND  D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  CIS2.NVAL(D.COL8) = 0 AND  D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  CIS2.NVAL(D.COL9) = 0
     AND  D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  CIS2.NVAL(D.COL10) = 0 
   
     THEN D.CUIIO  ELSE NULL END)  AS COL2,
     
     ROUND(COUNT( DISTINCT CASE WHEN VC.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND  D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  CIS2.NVAL(D.COL6) <> 0  
     AND  D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  CIS2.NVAL(D.COL5) = 0  AND  D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  CIS2.NVAL(D.COL7) = 0
     AND  D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  CIS2.NVAL(D.COL8) = 0 AND  D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  CIS2.NVAL(D.COL9) = 0
     AND  D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  CIS2.NVAL(D.COL10) = 0 
   
     THEN D.CUIIO  ELSE NULL END),1)  AS COL3,
    
    
     ROUND(COUNT( DISTINCT CASE WHEN VC.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND  D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  CIS2.NVAL(D.COL7) <> 0  
     AND  D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  CIS2.NVAL(D.COL5) = 0  AND  D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  CIS2.NVAL(D.COL6) = 0
     AND  D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  CIS2.NVAL(D.COL8) = 0 AND  D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  CIS2.NVAL(D.COL9) = 0
     AND  D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  CIS2.NVAL(D.COL10) = 0 
   
     THEN D.CUIIO  ELSE NULL END),1)  AS COL4,
    
    
     ROUND(COUNT( DISTINCT CASE WHEN VC.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND  D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  CIS2.NVAL(D.COL8) <> 0  
     AND  D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  CIS2.NVAL(D.COL5) = 0  AND  D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  CIS2.NVAL(D.COL6) = 0
     AND  D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  CIS2.NVAL(D.COL7) = 0 AND  D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  CIS2.NVAL(D.COL9) = 0
     AND  D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  CIS2.NVAL(D.COL10) = 0 
   
     THEN D.CUIIO  ELSE NULL END),1)  AS COL5,
    
     ROUND(COUNT (DISTINCT CASE WHEN VC.FUlL_CODE LIKE '%'||CD.CUATM||';%'  AND ( D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  CIS2.NVAL(D.COL5) <> 0  
    
    AND   VC.FUlL_CODE LIKE '%'||CD.CUATM||';%'  AND  D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  CIS2.NVAL(D.COL6) <> 0 )
    
    
    OR   VC.FUlL_CODE LIKE '%'||CD.CUATM||';%'  AND  D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  CIS2.NVAL(D.COL8)  <> 0
  
    THEN D.CUIIO  ELSE NULL END),1)  AS COL6
   
       
    FROM CIS2.VW_DATA_ALL D 
    
    INNER JOIN CIS2.MD_RIND MR ON (D.ID_MD = MR.ID_MD)
    
    
    --------------------------------------------------------------------------------------------------------------------
    
    ---------------------------------------------------------------------------------------------------------------------
    INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS)
    
    INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL) --(NIÎP).(Col.6) <> 6 --- NT.CODUL <> 6 
    
    INNER JOIN CIS2.VW_CL_CUATM VC ON (D.CUATM=VC.CODUL)
    CROSS JOIN
                                    
  ( 
   
    SELECT 'Total' AS NUME_ROW,                                    '01' AS NR_ROW, '0000000' AS CUATM FROM DUAL UNION
    SELECT 'Mun. Chi?inau' AS NUME_ROW,                           '02' AS NR_ROW, '0100000' AS CUATM FROM DUAL UNION 
    SELECT 'NORD' AS NUME_ROW,                                    '03' AS NR_ROW, '1111111' AS CUATM FROM DUAL UNION 
    SELECT 'Mun. Bal?i' AS NUME_ROW,                              '04' AS NR_ROW, '0300000' AS CUATM FROM DUAL UNION 
    SELECT 'Briceni' AS NUME_ROW,                                 '05' AS NR_ROW, '1400000' AS CUATM FROM DUAL UNION 
    SELECT 'Dondu?eni' AS NUME_ROW,                               '06' AS NR_ROW, '3400000' AS CUATM FROM DUAL UNION 
    SELECT 'Drochia' AS NUME_ROW,                                 '07' AS NR_ROW, '3600000' AS CUATM FROM DUAL UNION 
    SELECT 'Edine?' AS NUME_ROW,                                  '08' AS NR_ROW, '4100000' AS CUATM FROM DUAL UNION 
    SELECT 'Fale?ti' AS NUME_ROW,                                 '09' AS NR_ROW, '4300000' AS CUATM FROM DUAL UNION 
    SELECT 'Flore?ti' AS NUME_ROW,                                '10' AS NR_ROW, '4500000' AS CUATM FROM DUAL UNION 
    SELECT 'Glodeni' AS NUME_ROW,                                 '11' AS NR_ROW, '4800000' AS CUATM FROM DUAL UNION
    SELECT 'Ocni?a' AS NUME_ROW,                                  '12' AS NR_ROW, '6200000' AS CUATM FROM DUAL UNION 
    SELECT 'Ri?cani' AS NUME_ROW,                                 '13' AS NR_ROW, '7100000' AS CUATM FROM DUAL UNION 
    SELECT 'Sîngerei' AS NUME_ROW,                                '14' AS NR_ROW, '7400000' AS CUATM FROM DUAL UNION 
    SELECT 'Soroca' AS NUME_ROW,                                  '15' AS NR_ROW, '7800000' AS CUATM FROM DUAL UNION 
    SELECT 'CENTRU' AS NUME_ROW,                                  '16' AS NR_ROW, '2222222' AS CUATM FROM DUAL UNION 
    SELECT 'Anenii Noi' AS NUME_ROW,                              '17' AS NR_ROW, '1000000' AS CUATM FROM DUAL UNION 
    SELECT 'Calara?i' AS NUME_ROW,                                '18' AS NR_ROW, '2500000' AS CUATM FROM DUAL UNION 
    SELECT 'Criuleni' AS NUME_ROW,                                '19' AS NR_ROW, '3100000' AS CUATM FROM DUAL UNION 
    SELECT 'Dubasari' AS NUME_ROW,                                '20' AS NR_ROW, '3800000' AS CUATM FROM DUAL UNION
    SELECT 'Hince?ti' AS NUME_ROW,                                '21' AS NR_ROW, '5300000' AS CUATM FROM DUAL UNION
    SELECT 'Ialoveni' AS NUME_ROW,                                '22' AS NR_ROW, '5500000' AS CUATM FROM DUAL UNION 
    SELECT 'Nisporeni' AS NUME_ROW,                               '23' AS NR_ROW, '6000000' AS CUATM FROM DUAL UNION 
    SELECT 'Orhei' AS NUME_ROW,                                   '24' AS NR_ROW, '6400000' AS CUATM FROM DUAL UNION 
    SELECT 'Rezina' AS NUME_ROW,                                  '25' AS NR_ROW, '6700000' AS CUATM FROM DUAL UNION 
    SELECT 'Stra?eni' AS NUME_ROW,                                '26' AS NR_ROW, '8000000' AS CUATM FROM DUAL UNION 
    SELECT '?oldane?ti' AS NUME_ROW,                              '27' AS NR_ROW, '8300000' AS CUATM FROM DUAL UNION 
    SELECT 'Telene?ti' AS NUME_ROW,                               '28' AS NR_ROW, '8900000' AS CUATM FROM DUAL UNION 
    SELECT 'Ungheni' AS NUME_ROW,                                 '29' AS NR_ROW, '9200000' AS CUATM FROM DUAL UNION 
    SELECT 'SUD' AS NUME_ROW,                                     '30' AS NR_ROW, '3333333' AS CUATM FROM DUAL UNION 
    SELECT 'Basarabeasca' AS NUME_ROW,                            '31' AS NR_ROW, '1200000' AS CUATM FROM DUAL UNION
    SELECT 'Cahul' AS NUME_ROW,                                   '32' AS NR_ROW, '1700000' AS CUATM FROM DUAL UNION 
    SELECT 'Cantemir' AS NUME_ROW,                                '33' AS NR_ROW, '2100000' AS CUATM FROM DUAL UNION 
    SELECT 'Cau?eni' AS NUME_ROW,                                 '34' AS NR_ROW, '2700000' AS CUATM FROM DUAL UNION 
    SELECT 'Cimi?lia' AS NUME_ROW,                                '35' AS NR_ROW, '2900000' AS CUATM FROM DUAL UNION 
    SELECT 'Leova' AS NUME_ROW,                                   '36' AS NR_ROW, '5700000' AS CUATM FROM DUAL UNION 
    SELECT '?tefan Voda' AS NUME_ROW,                             '37' AS NR_ROW, '8500000' AS CUATM FROM DUAL UNION 
    SELECT 'Taraclia' AS NUME_ROW,                                '38' AS NR_ROW, '8700000' AS CUATM FROM DUAL UNION 
    SELECT 'UAT Gagauzia' AS NUME_ROW,                            '39' AS NR_ROW, '9600000' AS CUATM FROM DUAL UNION
    SELECT 'UAT dS Nistrului' AS NUME_ROW,                        '40' AS NR_ROW, '9800000' AS CUATM FROM DUAL UNION
    SELECT 'Mun.Bender' AS NUME_ROW,                              '41' AS NR_ROW, '0501000' AS CUATM FROM DUAL
      
      ) CD
    
    
    
    WHERE 
    (D.PERIOADA =:pPERIOADA) AND 
    (D.FORM=:pFORM) AND
    (D.FORM_VERS =:pFORM_VERS) AND 
    (:pID_MDTABLE=:pID_MDTABLE) AND
    (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
    D.FORM = 17 AND 
    D.CAPITOL IN (1001,1002) AND
    NT.CODUL <> 6
    
    GROUP BY 
    CD.NR_ROW,
    CD.NUME_ROW
      
    ORDER BY 
    CD.NR_ROW
    ) DC    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


