INSERT INTO CIS2.TABLE_OUT 
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
  COL1, COL2, COL3,  COL4, COL5, COL6, COL7
)

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
   CD.NR_ROW AS NR_ROW,  
   CD.NR_ROW AS ORDINE,
  '0000000' AS DECIMAL_POS,
   CD.NUME_ROW AS NUME_ROW,
 
  CIS2.NVAL(COUNT (DISTINCT(CASE WHEN D.RIND  IN ('161','162','163','164','165') AND D.CAPITOL IN (1181) AND C.FULL_CODE LIKE '%'||CD.CUATM||';%' AND  CIS2.NVAL(D.COL1)>0 THEN D.CUIIO END))) AS COL1, 
  CIS2.NVAL(COUNT (DISTINCT(CASE WHEN D.RIND  IN ('161') AND D.CAPITOL IN (1181) AND C.FULL_CODE LIKE '%'||CD.CUATM||';%' AND  CIS2.NVAL(D.COL1)=1 THEN D.CUIIO END))) AS COL2, 
  CIS2.NVAL(COUNT (DISTINCT(CASE WHEN D.RIND  IN ('162') AND D.CAPITOL IN (1181) AND C.FULL_CODE LIKE '%'||CD.CUATM||';%' AND  CIS2.NVAL(D.COL1)=1 THEN D.CUIIO END))) AS COL3, 
  CIS2.NVAL(COUNT (DISTINCT(CASE WHEN D.RIND  IN ('163') AND D.CAPITOL IN (1181) AND C.FULL_CODE LIKE '%'||CD.CUATM||';%' AND  CIS2.NVAL(D.COL1)=1 THEN D.CUIIO END))) AS COL4, 
  CIS2.NVAL(COUNT (DISTINCT(CASE WHEN D.RIND  IN ('164') AND D.CAPITOL IN (1181) AND C.FULL_CODE LIKE '%'||CD.CUATM||';%' AND  CIS2.NVAL(D.COL1)=1 THEN D.CUIIO END))) AS COL5, 
  CIS2.NVAL(COUNT (DISTINCT(CASE WHEN D.RIND  IN ('165') AND D.CAPITOL IN (1181) AND C.FULL_CODE LIKE '%'||CD.CUATM||';%' AND  CIS2.NVAL(D.COL1)=1 THEN D.CUIIO END))) AS COL6,
  CIS2.NVAL(COUNT (DISTINCT(CASE WHEN D.RIND  IN ('170') AND D.CAPITOL IN (1181) AND C.FULL_CODE LIKE '%'||CD.CUATM||';%' AND  CIS2.NVAL(D.COL1)=1 THEN D.CUIIO END))) AS COL7  
  
  FROM
      CIS2.VW_DATA_ALL D        
     INNER JOIN CIS2.VW_CL_CUATM C ON (D.CUATM=C.CODUL) 
   --  INNER JOIN CIS2.VW_CL_CUATM CC ON C.FULL_CODE LIKE '%'||CC.CODUL||'%'
          
         CROSS JOIN 

(   SELECT 'TOTAL' AS NUME_ROW,                                   '01' AS NR_ROW, '0000000' AS CUATM FROM DUAL UNION
    SELECT 'Mun. CHISINAU' AS NUME_ROW,                           '02' AS NR_ROW, '0100000' AS CUATM FROM DUAL UNION  
    SELECT 'NORD' AS NUME_ROW,                                    '03' AS NR_ROW, '1111111' AS CUATM FROM DUAL UNION 
    SELECT 'Mun. Balti' AS NUME_ROW,                              '04' AS NR_ROW, '0300000' AS CUATM FROM DUAL UNION 
    SELECT 'r-l Briceni' AS NUME_ROW,                             '05' AS NR_ROW, '1400000' AS CUATM FROM DUAL UNION    
    SELECT 'r-l Donduseni' AS NUME_ROW,                           '06' AS NR_ROW, '3400000' AS CUATM FROM DUAL UNION    
    SELECT 'r-l Drochia' AS NUME_ROW,                             '07' AS NR_ROW, '3600000' AS CUATM FROM DUAL UNION    
    SELECT 'r-l Edinet' AS NUME_ROW,                              '08' AS NR_ROW, '4100000' AS CUATM FROM DUAL UNION    
    SELECT 'r-l Falesti' AS NUME_ROW,                             '09' AS NR_ROW, '4300000' AS CUATM FROM DUAL UNION    
    SELECT 'r-l Floresti' AS NUME_ROW,                            '10' AS NR_ROW, '4500000' AS CUATM FROM DUAL UNION    
    SELECT 'r-l Glodeni' AS NUME_ROW,                             '11' AS NR_ROW, '4800000' AS CUATM FROM DUAL UNION   
    SELECT 'r-l Ocnita' AS NUME_ROW,                              '12' AS NR_ROW, '6200000' AS CUATM FROM DUAL UNION     
    SELECT 'r-l Riscani' AS NUME_ROW,                             '13' AS NR_ROW, '7100000' AS CUATM FROM DUAL UNION 
    SELECT 'r-l Singerei' AS NUME_ROW,                            '14' AS NR_ROW, '7400000' AS CUATM FROM DUAL UNION     
    SELECT 'r-l Soroca' AS NUME_ROW,                              '15' AS NR_ROW, '7800000' AS CUATM FROM DUAL UNION  
    SELECT 'CENTRU' AS NUME_ROW,                                  '16' AS NR_ROW, '2222222' AS CUATM FROM DUAL UNION 
    SELECT 'r-l Anenii Noi' AS NUME_ROW,                          '17' AS NR_ROW, '1000000' AS CUATM FROM DUAL UNION        
    SELECT 'r-l Calaras' AS NUME_ROW,                             '18' AS NR_ROW, '2500000' AS CUATM FROM DUAL UNION    
    SELECT 'r-l Criuleni' AS NUME_ROW,                            '19' AS NR_ROW, '3100000' AS CUATM FROM DUAL UNION   
    SELECT 'Dubasari' AS NUME_ROW,                                '20' AS NR_ROW, '3800000' AS CUATM FROM DUAL UNION
    SELECT 'r-l Hincesti' AS NUME_ROW,                            '21' AS NR_ROW, '5300000' AS CUATM FROM DUAL UNION   
    SELECT 'r-l Ialoveni' AS NUME_ROW,                            '22' AS NR_ROW, '5500000' AS CUATM FROM DUAL UNION    
    SELECT 'r-l Nisporeni' AS NUME_ROW,                           '23' AS NR_ROW, '6000000' AS CUATM FROM DUAL UNION    
    SELECT 'r-l Orhei' AS NUME_ROW,                               '24' AS NR_ROW, '6400000' AS CUATM FROM DUAL UNION    
    SELECT 'r-l Rezina' AS NUME_ROW,                              '25' AS NR_ROW, '6700000' AS CUATM FROM DUAL UNION   
    SELECT 'r-l Straseni' AS NUME_ROW,                            '26' AS NR_ROW, '8000000' AS CUATM FROM DUAL UNION     
    SELECT 'r-l Soldanesti' AS NUME_ROW,                          '28' AS NR_ROW, '8300000' AS CUATM FROM DUAL UNION   
    SELECT 'r-l Telenesti' AS NUME_ROW,                           '29' AS NR_ROW, '8900000' AS CUATM FROM DUAL UNION 
    SELECT 'r-l Ungheni' AS NUME_ROW,                             '30' AS NR_ROW, '9200000' AS CUATM FROM DUAL UNION 
    SELECT 'SUD' AS NUME_ROW,                                     '31' AS NR_ROW, '3333333' AS CUATM FROM DUAL UNION 
    SELECT 'r-l Basarabeasca' AS NUME_ROW,                        '32' AS NR_ROW, '1200000' AS CUATM FROM DUAL UNION   
    SELECT 'r-l Cahul' AS NUME_ROW,                               '34' AS NR_ROW, '1700000' AS CUATM FROM DUAL UNION   
    SELECT 'r-l Cantemir' AS NUME_ROW,                            '35' AS NR_ROW, '2100000' AS CUATM FROM DUAL UNION     
    SELECT 'r-l Causeni' AS NUME_ROW,                             '36' AS NR_ROW, '2700000' AS CUATM FROM DUAL UNION    
    SELECT 'r-l Cimislia' AS NUME_ROW,                            '37' AS NR_ROW, '2900000' AS CUATM FROM DUAL UNION   
    SELECT 'r-l Leovo' AS NUME_ROW,                               '38' AS NR_ROW, '5700000' AS CUATM FROM DUAL UNION    
    SELECT 'r-l Stefan Voda' AS NUME_ROW,                         '39' AS NR_ROW, '8500000' AS CUATM FROM DUAL UNION   
    SELECT 'r-l Taraclia' AS NUME_ROW,                            '40' AS NR_ROW, '8700000' AS CUATM FROM DUAL UNION   
    SELECT 'UTA Gagauzia' AS NUME_ROW,                            '41' AS NR_ROW, '9600000' AS CUATM FROM DUAL     
      ) CD


WHERE  D.PERIOADA IN (:pPERIOADA) AND
       D.FORM = :pFORM AND
       D.FORM_VERS = :pFORM_VERS  AND  
      (:pID_MDTABLE=:pID_MDTABLE) AND
       D.FORM = 71 AND
       D.CAPITOL IN (1181) AND
       C.FULL_CODE LIKE '%'||:pCOD_CUATM||'%'
       
      --AND D.CUIIO= 411016
GROUP BY  CD.NR_ROW , CD.NUME_ROW
ORDER BY  CD.NR_ROW