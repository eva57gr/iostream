SELECT
     D.CUIIO,
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
               
               
               GROUP BY 
               D.CUIIO
               