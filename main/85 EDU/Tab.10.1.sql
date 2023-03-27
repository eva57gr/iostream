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
--)
 -- 12 ROWS  AND 6 COLUMNS
  
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
        '000000'AS DECIMAL_POS,
         DC.NUME_ROW AS NUME_ROW,       
         COL1, 
         COL2,
         COL3,
         COL4,
         COL5,
         COL6 

      -- 12 ROWS  AND 6 COLUMNS
      
      FROM 
  (  -- ROWS 1 
SELECT
     :pID_MDTABLE -1,
     :pCOD_CUATM AS COD_CUATM,
     '01' AS NR_ROW,
      1  AS ORDINE,
     'Total' AS NUME_ROW,
      CIS2.NVAL(COUNT(DISTINCT CASE WHEN  D.CAPITOL IN (1004)  AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END))  AS  COL1, 
      CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1001)  AND  D.RIND IN ('010') THEN D.COL1 ELSE NULL END),1)) AS  COL2,
      
      CIS2.NVAL(ROUND(SUM(CASE WHEN  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') THEN D.COL1 ELSE NULL END),1)) 
      - CIS2.NVAL(ROUND(SUM(CASE WHEN  D.CAPITOL IN (1001)  AND  D.RIND IN ('020') THEN D.COL1 ELSE NULL END),1))  AS  COL3,
      
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1001)  AND  D.RIND IN ('010') THEN D.COL2 ELSE NULL END),1))  AS  COL4,
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') THEN D.COL1 ELSE NULL END),1))  AS  COL5,
       
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('010')  THEN D.COL5 ELSE NULL END),1))   + 
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('010')  THEN D.COL6 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('010')  THEN D.COL7 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('010')  THEN D.COL8 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('010')  THEN D.COL9 ELSE NULL END),1)) AS  COL6
       
       FROM    
             CIS2.VW_DATA_ALL D    
                      
               INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS)  
               
               -------------------------------------------------------------------------------------                           
               INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL) --(NIÎP).(Col.6) <> 6 --- NT.CODUL <> 6  
               
               
               
                
                WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17 AND
               D.CAPITOL IN (1001,1002,1004)
               
--                    
UNION
  -- ROWS 02               
             SELECT
     :pID_MDTABLE -1,
     :pCOD_CUATM AS COD_CUATM,
     '02' AS NR_ROW,
      2  AS ORDINE,
     'inclusiv cu destinatie:generala' AS NUME_ROW,
       CIS2.NVAL(COUNT(DISTINCT CASE WHEN  D.CAPITOL IN (1004)    AND  ND.CODUL = 1 AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END))  AS  COL1, 
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND ND.CODUL = 1 THEN D.COL1 ELSE NULL END),1)) AS  COL2,
        CIS2.NVAL(ROUND(SUM(CASE WHEN  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND ND.CODUL = 1 THEN D.COL1 ELSE NULL END),1)) 
      - CIS2.NVAL(ROUND(SUM(CASE WHEN  D.CAPITOL IN (1001)  AND  D.RIND IN ('020') AND ND.CODUL = 1 THEN D.COL1 ELSE NULL END),1)) AS  COL3,
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND ND.CODUL = 1 THEN D.COL2 ELSE NULL END),1))  AS  COL4,
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 1 THEN D.COL1 ELSE NULL END),1))  AS  COL5,
       
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 1 THEN D.COL5 ELSE NULL END),1))   + 
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 1 THEN D.COL6 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 1 THEN D.COL7 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 1 THEN D.COL8 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 1 THEN D.COL9 ELSE NULL END),1)) AS  COL6
       
       FROM    
             CIS2.VW_DATA_ALL D    
                      
               INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS)  
               ----------------------------------------------------------------------------------------------------                          
               INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL) --(NIÎP).(Col.6) <> 6 --- NT.CODUL <> 6  
               ----------------------------------------------------------------------------------------------------
               INNER JOIN CIS2.CL_N85_NDIIP ND ON (RN.N85_NDIIP=ND.CODUL) -- care (NIÎP).(Col.7) = 1 ---ND.CODUL = 1  
                
                WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17 AND
               D.CAPITOL IN (1001,1002,1004)  
               
               UNION
  -- ROWS 03               
             SELECT
     :pID_MDTABLE -1,
     :pCOD_CUATM AS COD_CUATM,
     '03' AS NR_ROW,
      3  AS ORDINE,
     'sanatoriala' AS NUME_ROW,
       CIS2.NVAL(COUNT(DISTINCT CASE WHEN  D.CAPITOL IN (1004) AND   ND.CODUL = 2 AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END))  AS  COL1, 
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND ND.CODUL = 2 THEN D.COL1 ELSE NULL END),1))  AS  COL2,
       CIS2.NVAL(ROUND(SUM(CASE WHEN  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND ND.CODUL = 2 THEN D.COL1 ELSE NULL END),1)) 
      - CIS2.NVAL(ROUND(SUM(CASE WHEN  D.CAPITOL IN (1001)  AND  D.RIND IN ('020') AND ND.CODUL =2 THEN D.COL1 ELSE NULL END),1))  AS  COL3,
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND ND.CODUL = 2 THEN D.COL2 ELSE NULL END),1))  AS  COL4,
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 2 THEN D.COL1 ELSE NULL END),1))  AS  COL5,
       
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 2 THEN D.COL5 ELSE NULL END),1))   + 
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 2 THEN D.COL6 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 2 THEN D.COL7 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 2 THEN D.COL8 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 2 THEN D.COL9 ELSE NULL END),1)) AS  COL6
       
       FROM    
             CIS2.VW_DATA_ALL D    
                      
               INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS)  
               ----------------------------------------------------------------------------------------------------                          
               INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL) --(NIÎP).(Col.6) <> 6 --- NT.CODUL <> 6  
               ----------------------------------------------------------------------------------------------------
               INNER JOIN CIS2.CL_N85_NDIIP ND ON (RN.N85_NDIIP=ND.CODUL) -- care (NIÎP).(Col.7) = 1 ---ND.CODUL = 1   
                
                WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17 AND
               D.CAPITOL IN (1001,1002,1004)  
               
               
      UNION
  -- ROWS 04               
             SELECT
     :pID_MDTABLE -1,
     :pCOD_CUATM AS COD_CUATM,
     '04' AS NR_ROW,
      4  AS ORDINE,
     'speciala' AS NUME_ROW,
       CIS2.NVAL(COUNT(DISTINCT CASE WHEN  D.CAPITOL IN (1004)  AND ND.CODUL = 3 AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END))  AS  COL1, 
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND ND.CODUL = 3 THEN D.COL1 ELSE NULL END),1))  AS  COL2,
       CIS2.NVAL(ROUND(SUM(CASE WHEN  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND ND.CODUL = 3 THEN D.COL1 ELSE NULL END),1)) 
      - CIS2.NVAL(ROUND(SUM(CASE WHEN  D.CAPITOL IN (1001)  AND  D.RIND IN ('020') AND ND.CODUL = 3 THEN D.COL1 ELSE NULL END),1))  AS  COL3,
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND ND.CODUL = 3 THEN D.COL2 ELSE NULL END),1))  AS  COL4,
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 3 THEN D.COL1 ELSE NULL END),1))  AS  COL5,
       
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 3 THEN D.COL5 ELSE NULL END),1))   + 
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 3 THEN D.COL6 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 3 THEN D.COL7 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 3 THEN D.COL8 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('010') AND ND.CODUL = 3 THEN D.COL9 ELSE NULL END),1)) AS  COL6 
      
       FROM    
             CIS2.VW_DATA_ALL D    
                      
               INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS)  
               
               ----------------------------------------------------------------------------------------------------                          
               INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL) --(NIÎP).(Col.6) <> 6 --- NT.CODUL <> 6  
               ----------------------------------------------------------------------------------------------------
               INNER JOIN CIS2.CL_N85_NDIIP ND ON (RN.N85_NDIIP=ND.CODUL) -- care (NIÎP).(Col.7) = 1 ---ND.CODUL = 1    
                
                WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17 AND
               D.CAPITOL IN (1001,1002,1004)  
               
               UNION 
               
                   
--               
--     UNION
  -- ROWS 05               
             SELECT
     :pID_MDTABLE -1,
     :pCOD_CUATM AS COD_CUATM,
     '05' AS NR_ROW,
      5  AS ORDINE,
    'Din rînd. 02 institutii care au grupe sanatoriale' AS NUME_ROW,
       CIS2.NVAL(COUNT(DISTINCT CASE WHEN  D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  CIS2.NVAL(D.COL3) <> 0 AND ND.CODUL = 1 AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END))   AS  COL1, 
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND ND.CODUL = 1 THEN D.COL3 ELSE NULL END),1)) AS  COL2,
       CIS2.NVAL(ROUND(SUM(CASE WHEN  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND ND.CODUL = 1 THEN D.COL3 ELSE NULL END),1)) 
      - CIS2.NVAL(ROUND(SUM(CASE WHEN  D.CAPITOL IN (1001)  AND  D.RIND IN ('020') AND ND.CODUL = 1 THEN D.COL3 ELSE NULL END),1))  AS  COL3,
      
       NULL  AS  COL4,
       
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('110') AND ND.CODUL = 1 THEN D.COL1 ELSE NULL END),1))  AS  COL5,
       
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('110') AND ND.CODUL = 1 THEN D.COL5 ELSE NULL END),1))   + 
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('110') AND ND.CODUL = 1 THEN D.COL6 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('110') AND ND.CODUL = 1 THEN D.COL7 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('110') AND ND.CODUL = 1 THEN D.COL8 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('110') AND ND.CODUL = 1 THEN D.COL9 ELSE NULL END),1))
      
       AS  COL6
       
       FROM    
             CIS2.VW_DATA_ALL D    
                      
               INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS)  
               ----------------------------------------------------------------------------------------------------                          
               INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL) --(NIÎP).(Col.6) <> 6 --- NT.CODUL <> 6  
               ----------------------------------------------------------------------------------------------------
               INNER JOIN CIS2.CL_N85_NDIIP ND ON (RN.N85_NDIIP=ND.CODUL) -- care (NIÎP).(Col.7) = 1 ---ND.CODUL = 1    
                
                WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17 AND
               D.CAPITOL IN (1001,1002,1004)   
               
               
               
                UNION
  -- ROWS 06               
             SELECT
     :pID_MDTABLE -1,
     :pCOD_CUATM AS COD_CUATM,
     '06' AS NR_ROW,
      6  AS ORDINE,
    'cu destinatie speciala:' AS NUME_ROW,
       CIS2.NVAL(COUNT(DISTINCT CASE WHEN  D.CAPITOL IN (1001) AND D.RIND IN ('010') AND  CIS2.NVAL(D.COL4) <> 0 AND ND.CODUL = 1 AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END))  AS  COL1, 
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND ND.CODUL = 1 THEN D.COL4 ELSE NULL END),1)) AS  COL2,
       CIS2.NVAL(ROUND(SUM(CASE WHEN  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND ND.CODUL = 1 THEN D.COL4 ELSE NULL END),1)) 
      - CIS2.NVAL(ROUND(SUM(CASE WHEN  D.CAPITOL IN (1001)  AND  D.RIND IN ('020') AND ND.CODUL = 1 THEN D.COL4 ELSE NULL END),1))  AS  COL3,
      
       NULL AS  COL4,
      
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND ND.CODUL = 1 THEN D.COL1 ELSE NULL END),1)) AS  COL5,
       
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND ND.CODUL = 1 THEN D.COL5 ELSE NULL END),1))   + 
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND ND.CODUL = 1 THEN D.COL6 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND ND.CODUL = 1 THEN D.COL7 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND ND.CODUL = 1 THEN D.COL8 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND ND.CODUL = 1 THEN D.COL9 ELSE NULL END),1))
       AS  COL6
       
       FROM    
             CIS2.VW_DATA_ALL D    
                      
               INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS)  
               
               ----------------------------------------------------------------------------------------------------                          
               INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL) --(NIÎP).(Col.6) <> 6 --- NT.CODUL <> 6  
               ----------------------------------------------------------------------------------------------------
               INNER JOIN CIS2.CL_N85_NDIIP ND ON (RN.N85_NDIIP=ND.CODUL) -- care (NIÎP).(Col.7) = 1 ---ND.CODUL = 1 
               
               -- INNER JOIN CIS2.CL_N85_NPDS NP ON (RN.N85_NPDS=NP.CODUL) -- (NIÎP).(Col.8) = 1  -- NP.CODUL = 1
                
                WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17 AND
               D.CAPITOL IN (1001,1002,1004)          
           
       
                

             
      UNION  
      
 -- add row 7 
 
 -- ROWS 07               
             SELECT
     :pID_MDTABLE -1,
     :pCOD_CUATM AS COD_CUATM,
     '07' AS NR_ROW,
      7  AS ORDINE,
     'Din rînd.(04+06) pentru copii cu dereglari:' AS NUME_ROW,
       CIS2.NVAL(COUNT(DISTINCT CASE WHEN D.FORM = 17 AND
               D.CAPITOL IN (1001,1002,1003,1004,1005,1006,1007) AND  D.RIND IN ('010','020','030','040','050','060','070','080','090','100','110','120','130') AND NP.CODUL <> 0 AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END))  AS  COL1, 
      
      
      
        CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL <> 0  THEN D.COL4 ELSE NULL END),1))  AS  COL2,
        
       CIS2.NVAL(ROUND(SUM(CASE WHEN  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL <> 0 THEN D.COL4 ELSE NULL END),1)) 
      - CIS2.NVAL(ROUND(SUM(CASE WHEN  D.CAPITOL IN (1001)  AND  D.RIND IN ('020') AND NP.CODUL <> 0 THEN D.COL4 ELSE NULL END),1)) AS  COL3,
       NULL AS  COL4,
       CIS2.NVAL(ROUND(SUM(CASE WHEN  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL <> 0 THEN D.COL1 ELSE NULL END),1))  AS  COL5,
       
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL <> 0 THEN D.COL5 ELSE NULL END),1))   + 
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL <> 0 THEN D.COL6 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL <> 0  THEN D.COL7 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL <> 0 THEN D.COL8 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL <> 0 THEN D.COL9 ELSE NULL END),1)) AS  COL6
       
       FROM    
             CIS2.VW_DATA_ALL D    
                      
              
               
               INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS) 
               
               -------------------------------------------------------------------------------------- 
               INNER JOIN CIS2.CL_N85_NPDS NP ON (RN.N85_NPDS=NP.CODUL) -- (NIÎP).(Col.8) = 1  -- NP.CODUL = 1
              
               -------------------------------------------------------------------------------------- 
                                         
               INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL) --(NIÎP).(Col.6) <> 6 --- NT.CODUL <> 6  
               
                WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17 
               
               AND
               D.CAPITOL IN (1001,1002,1003,1004,1005,1006,1007)          
                    
               
               
               
             UNION             
                 
               
     -- ROWS 07               
             SELECT
     :pID_MDTABLE -1,
     :pCOD_CUATM AS COD_CUATM,
     '08' AS NR_ROW,
      8  AS ORDINE,
     'de auz:' AS NUME_ROW,
       CIS2.NVAL(COUNT(DISTINCT CASE WHEN D.FORM = 17 AND
               D.CAPITOL IN (1001,1002,1003,1004,1005,1006,1007) AND  D.RIND IN ('010','020','030','040','050','060','070','080','090','100','110','120','130') AND NP.CODUL = 1 AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END))  AS  COL1, 
      
      
      
        CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL = 1 THEN D.COL4 ELSE NULL END),1))  AS  COL2,
        
       CIS2.NVAL(ROUND(SUM(CASE WHEN  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL = 1 THEN D.COL4 ELSE NULL END),1)) 
      - CIS2.NVAL(ROUND(SUM(CASE WHEN  D.CAPITOL IN (1001)  AND  D.RIND IN ('020') AND NP.CODUL = 1 THEN D.COL4 ELSE NULL END),1)) AS  COL3,
       NULL AS  COL4,
       CIS2.NVAL(ROUND(SUM(CASE WHEN  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 1 THEN D.COL1 ELSE NULL END),1))  AS  COL5,
       
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 1 THEN D.COL5 ELSE NULL END),1))   + 
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 1 THEN D.COL6 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 1 THEN D.COL7 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 1 THEN D.COL8 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 1 THEN D.COL9 ELSE NULL END),1)) AS  COL6
       
       FROM    
             CIS2.VW_DATA_ALL D    
                      
              
               
               INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS) 
               
               -------------------------------------------------------------------------------------- 
               INNER JOIN CIS2.CL_N85_NPDS NP ON (RN.N85_NPDS=NP.CODUL) -- (NIÎP).(Col.8) = 1  -- NP.CODUL = 1
              
               -------------------------------------------------------------------------------------- 
                                         
               INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL) --(NIÎP).(Col.6) <> 6 --- NT.CODUL <> 6  
               
                WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17 
               
               AND
               D.CAPITOL IN (1001,1002,1003,1004,1005,1006,1007)          
                    
               
               
             UNION             
               
     -- ROWS 08               
             SELECT
     :pID_MDTABLE -1,
     :pCOD_CUATM AS COD_CUATM,
     '09' AS NR_ROW,
      9  AS ORDINE,
    'de vorbire' AS NUME_ROW,
       CIS2.NVAL(COUNT(DISTINCT CASE WHEN D.FORM = 17 AND
               D.CAPITOL IN (1001,1002,1003,1004,1005,1006,1007) AND  D.RIND IN ('010','020','030','040','050','060','070','080','090','100','110','120','130') AND NP.CODUL = 2 AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END))  AS  COL1, 
      
        CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL = 2 THEN D.COL4 ELSE NULL END),1))  AS  COL2,
         
       CIS2.NVAL(ROUND(SUM(CASE WHEN  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL = 2 THEN D.COL4 ELSE NULL END),1)) 
      - CIS2.NVAL(ROUND(SUM(CASE WHEN  D.CAPITOL IN (1001)  AND  D.RIND IN ('020') AND NP.CODUL = 2 THEN D.COL4 ELSE NULL END),1))  AS  COL3,
      NULL  AS  COL4,
      CIS2.NVAL(ROUND(SUM(CASE WHEN  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 2 THEN D.COL1 ELSE NULL END),1))  AS  COL5,
       
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 2 THEN D.COL5 ELSE NULL END),1))   + 
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 2 THEN D.COL6 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 2 THEN D.COL7 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 2 THEN D.COL8 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 2 THEN D.COL9 ELSE NULL END),1)) AS  COL6
       
       FROM    
             CIS2.VW_DATA_ALL D    
                      
               INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS)  
                 -------------------------------------------------------------------------------------- 
               INNER JOIN CIS2.CL_N85_NPDS NP ON (RN.N85_NPDS=NP.CODUL) -- (NIÎP).(Col.8) = 1  -- NP.CODUL = 1
              
               -------------------------------------------------------------------------------------- 
                                         
               INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL) --(NIÎP).(Col.6) <> 6 --- NT.CODUL <> 6  
                
                
                WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17 
               
               AND
               D.CAPITOL IN (1001,1002,1003,1004,1005,1006,1007)          
                    
               
               
             UNION             
               
     -- ROWS 09               
             SELECT
     :pID_MDTABLE -1,
     :pCOD_CUATM AS COD_CUATM,
     '10' AS NR_ROW,
      10  AS ORDINE,
     'de vedere' AS NUME_ROW,
      CIS2.NVAL(COUNT(DISTINCT CASE WHEN D.FORM = 17 AND
               D.CAPITOL IN (1001,1002,1003,1004,1005,1006,1007) AND  D.RIND IN ('010','020','030','040','050','060','070','080','090','100','110','120','130') AND NP.CODUL = 3 AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END))  AS  COL1, 
       
    --    CIS2.NVAL(COUNT(DISTINCT CASE WHEN NP.CODUL = 3 AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END))  AS  COL1, 
      
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL = 3 THEN D.COL4 ELSE NULL END),1))  AS  COL2,
         
       CIS2.NVAL(ROUND(SUM(CASE WHEN  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL = 3 THEN D.COL4 ELSE NULL END),1)) 
      - CIS2.NVAL(ROUND(SUM(CASE WHEN  D.CAPITOL IN (1001)  AND  D.RIND IN ('020') AND NP.CODUL = 3 THEN D.COL4 ELSE NULL END),1))  AS  COL3,
       NULL AS  COL4,
      CIS2.NVAL(ROUND(SUM(CASE WHEN  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 3 THEN D.COL1 ELSE NULL END),1))  AS  COL5,
       
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 3 THEN D.COL5 ELSE NULL END),1))   + 
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 3 THEN D.COL6 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 3 THEN D.COL7 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 3 THEN D.COL8 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 3 THEN D.COL9 ELSE NULL END),1)) AS  COL6
       
       FROM    
             CIS2.VW_DATA_ALL D    
                      
               INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS) 
                
               -------------------------------------------------------------------------------------- 
               INNER JOIN CIS2.CL_N85_NPDS NP ON (RN.N85_NPDS=NP.CODUL) -- (NIÎP).(Col.8) = 1  -- NP.CODUL = 1
              
               -------------------------------------------------------------------------------------- 
                                         
               INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL) --(NIÎP).(Col.6) <> 6 --- NT.CODUL <> 6  
               
                
                
                WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17  AND
               D.CAPITOL IN (1001,1002,1003,1004,1005,1006,1007)  
               
               
               
                UNION             
               
     -- ROWS 10               
             SELECT
     :pID_MDTABLE -1,
     :pCOD_CUATM AS COD_CUATM,
     '11' AS NR_ROW,
      11  AS ORDINE,
    'de intelect' AS NUME_ROW,
      CIS2.NVAL(COUNT(DISTINCT CASE WHEN D.FORM = 17 AND
               D.CAPITOL IN (1001,1002,1003,1004,1005,1006,1007) AND  D.RIND IN ('010','020','030','040','050','060','070','080','090','100','110','120','130') AND NP.CODUL = 4 AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END))  AS  COL1, 
       
    
      
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL = 4 THEN D.COL4 ELSE NULL END),1))  AS  COL2,
         
       CIS2.NVAL(ROUND(SUM(CASE WHEN  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL = 4 THEN D.COL4 ELSE NULL END),1)) 
      - CIS2.NVAL(ROUND(SUM(CASE WHEN  D.CAPITOL IN (1001)  AND  D.RIND IN ('020') AND NP.CODUL = 4 THEN D.COL4 ELSE NULL END),1))  AS  COL3,
       NULL AS  COL4,
      CIS2.NVAL(ROUND(SUM(CASE WHEN  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 4 THEN D.COL1 ELSE NULL END),1))  AS  COL5,
       
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 4 THEN D.COL5 ELSE NULL END),1))   + 
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 4 THEN D.COL6 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 4 THEN D.COL7 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 4 THEN D.COL8 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 4 THEN D.COL9 ELSE NULL END),1)) AS  COL6
       
       FROM    
             CIS2.VW_DATA_ALL D    
                      
               INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS)  
                -------------------------------------------------------------------------------------- 
               INNER JOIN CIS2.CL_N85_NPDS NP ON (RN.N85_NPDS=NP.CODUL) -- (NIÎP).(Col.8) = 1  -- NP.CODUL = 1
              
               -------------------------------------------------------------------------------------- 
                                         
               INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL) --(NIÎP).(Col.6) <> 6 --- NT.CODUL <> 6    
               
                
                WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17 
               
               AND
               D.CAPITOL IN (1001,1002,1003,1004,1005,1006,1007)  
               
               
               
               UNION             
               
     -- ROWS 11               
             SELECT
     :pID_MDTABLE -1,
     :pCOD_CUATM AS COD_CUATM,
     '12' AS NR_ROW,
      12  AS ORDINE,
    'cu dereglari ale aparatului locomotor' AS NUME_ROW,
        CIS2.NVAL(COUNT(DISTINCT CASE WHEN D.FORM = 17 AND
               D.CAPITOL IN (1001,1002,1003,1004,1005,1006,1007) AND  D.RIND IN ('010','020','030','040','050','060','070','080','090','100','110','120','130') AND NP.CODUL = 5 AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END))  AS  COL1, 
       
   
      
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL = 5 THEN D.COL4 ELSE NULL END),1))  AS  COL2,
         
       CIS2.NVAL(ROUND(SUM(CASE WHEN  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL = 5 THEN D.COL4 ELSE NULL END),1)) 
      - CIS2.NVAL(ROUND(SUM(CASE WHEN  D.CAPITOL IN (1001)  AND  D.RIND IN ('020') AND NP.CODUL = 5 THEN D.COL4 ELSE NULL END),1))  AS  COL3,
       NULL AS  COL4,
      CIS2.NVAL(ROUND(SUM(CASE WHEN  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 5 THEN D.COL1 ELSE NULL END),1))  AS  COL5,
       
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 5 THEN D.COL5 ELSE NULL END),1))   + 
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 5 THEN D.COL6 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 5 THEN D.COL7 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 5 THEN D.COL8 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 5 THEN D.COL9 ELSE NULL END),1)) AS  COL6
       
       FROM    
             CIS2.VW_DATA_ALL D    
                      
               INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS)  
               
                -------------------------------------------------------------------------------------- 
               INNER JOIN CIS2.CL_N85_NPDS NP ON (RN.N85_NPDS=NP.CODUL) -- (NIÎP).(Col.8) = 1  -- NP.CODUL = 1
              
               -------------------------------------------------------------------------------------- 
                                         
               INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL) --(NIÎP).(Col.6) <> 6 --- NT.CODUL <> 6    
                
                WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17 
               
               
               AND
               D.CAPITOL IN (1001,1002,1003,1004,1005,1006,1007)   
               
           UNION     
               -- ROWS 12               
             SELECT
     :pID_MDTABLE -1,
     :pCOD_CUATM AS COD_CUATM,
     '13' AS NR_ROW,
      13  AS ORDINE,
    'alte' AS NUME_ROW,
        CIS2.NVAL(COUNT(DISTINCT CASE WHEN D.FORM = 17 AND
               D.CAPITOL IN (1001,1002,1003,1004,1005,1006,1007) AND  D.RIND IN ('010','020','030','040','050','060','070','080','090','100','110','120','130') AND NP.CODUL = 6 AND  NT.CODUL <> 6 THEN D.CUIIO ELSE NULL END))  AS  COL1, 
       
    
      
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL = 6 THEN D.COL4 ELSE NULL END),1))  AS  COL2,
         
       CIS2.NVAL(ROUND(SUM(CASE WHEN  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL = 6 THEN D.COL4 ELSE NULL END),1)) 
      - CIS2.NVAL(ROUND(SUM(CASE WHEN  D.CAPITOL IN (1001)  AND  D.RIND IN ('020') AND NP.CODUL = 6 THEN D.COL4 ELSE NULL END),1))  AS  COL3,
      
      NULL AS  COL4,
       
      CIS2.NVAL(ROUND(SUM(CASE WHEN  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 6 THEN D.COL1 ELSE NULL END),1))  AS  COL5,
       
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 6 THEN D.COL5 ELSE NULL END),1))   + 
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 6 THEN D.COL6 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 6 THEN D.COL7 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 6 THEN D.COL8 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL = 6 THEN D.COL9 ELSE NULL END),1)) AS  COL6
       
       FROM    
             CIS2.VW_DATA_ALL D    
                      
               INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS)  
                
                 -------------------------------------------------------------------------------------- 
               INNER JOIN CIS2.CL_N85_NPDS NP ON (RN.N85_NPDS=NP.CODUL) -- (NIÎP).(Col.8) = 1  -- NP.CODUL = 1
              
               -------------------------------------------------------------------------------------- 
                                         
               INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL) --(NIÎP).(Col.6) <> 6 --- NT.CODUL <> 6   
               
                
                WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17 
               
               AND
               D.CAPITOL IN (1001,1002,1003,1004,1005,1006,1007) 
               
                
               
               
               ) DC 
 
    ORDER BY DC.ORDINE