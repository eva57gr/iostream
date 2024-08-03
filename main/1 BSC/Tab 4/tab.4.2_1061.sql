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
--    COL3
--    
--
-- )
--------------------------------------------------------------------------------
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
    ROUND(AA.COL1,1) ||'~'||   ROWNUM  AS NR_ROW,  AA.ORDINE  AS ORDINE,
    '0000' AS DECIMAL_POS,
     AA.NUME_ROW AS NUME_ROW,
     ROUND(AA.COL2,1) AS COL1,
     ROUND(AA.COL3,1) AS COL2,
     ROUND(AA.COL4,1) AS COL3
     

    
 

     FROM
    
(
--
 SELECT
 
   
     CD.NR_ROW   AS NR_ROW,
     CD.NR_ROW   AS ORDINE,
     CD.NUME_ROW AS NUME_ROW,
     ROUND(SUM(CASE WHEN VC.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND  D.RIND IN ('000') THEN CIS2.NVAL(D.COL1)+CIS2.NVAL(D.COL3)+CIS2.NVAL(D.COL5) ELSE NULL END),1)  
     AS COL1,
     
     
     ROUND(SUM(CASE WHEN VC.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND  D.RIND IN ('999')  THEN CIS2.NVAL(D.COL1)+CIS2.NVAL(D.COL3)+CIS2.NVAL(D.COL5) ELSE 0 END),1) 
     AS COL2,
     
         ROUND(SUM(CASE WHEN VC.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND  D.RIND IN ('000') THEN CIS2.NVAL(D.COL2)+CIS2.NVAL(D.COL4)+CIS2.NVAL(D.COL6) ELSE NULL END),1)  
     AS COL3,
     
     
     ROUND(SUM(CASE WHEN VC.FUlL_CODE LIKE '%'||CD.CUATM||';%' AND  D.RIND IN ('999')  THEN CIS2.NVAL(D.COL2)+CIS2.NVAL(D.COL4)+CIS2.NVAL(D.COL6) ELSE 0 END),1) 
     AS COL4
     
         

        
    FROM
    
     CIS2.VW_DATA_ALL D
  
         INNER JOIN
         (
           SELECT P.PERIOADA FROM CIS2.VW_MD_PERIOADA P 
           WHERE P.PERIOADA = :pPERIOADA 
    
           UNION   
   
           SELECT P.PERIOADA - 1 FROM CIS2.VW_MD_PERIOADA P INNER JOIN CIS2.VW_MD_PERIOADA T ON(P.ANUL=T.ANUL AND P.TIP_PERIOADA=7) 
           WHERE T.PERIOADA = :pPERIOADA
   
        ) P ON(D.PERIOADA=P.PERIOADA)
    
 
     
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
    SELECT 'UAT Gagauzia' AS NUME_ROW,                            '39' AS NR_ROW, '9600000' AS CUATM FROM DUAL 
    
   ) CD
      
     WHERE 
   (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (19) AND
  D.CAPITOL IN (1017)
--  AND D.CUIIO = 297922
  
   
       
 
    GROUP BY 
    CD.NR_ROW,
    CD.NUME_ROW
      
    ORDER BY 
    CD.NR_ROW
    ) AA
    
    
    ORDER BY AA.ORDINE
    