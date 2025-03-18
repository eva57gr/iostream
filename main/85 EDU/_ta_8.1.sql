SELECT
     :pID_MDTABLE -1,
     :pCOD_CUATM AS COD_CUATM,
     '01' AS NR_ROW,
      1  AS ORDINE,
    ' Total' AS NUME_ROW, 
       COUNT(DISTINCT CASE WHEN  D.CAPITOL IN (1004)  AND  NT.CODUL <> '6' THEN D.CUIIO ELSE NULL END)  AS  COL1

       
       FROM    
             CIS2.VW_DATA_ALL D    
                      
               INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS)  
               -------------------------------------------------------------------------------------                           
               INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL)  
               ------------------------------------------------------------------------------------
               INNER JOIN CIS2.CL_N85_NTL NTL ON (RN.N85_NTL=NTL.CODUL)  
               
               WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17 AND
               D.CAPITOL IN (1001,1002,1004)
               
               
               UNION ALL 
               
               SELECT
     :pID_MDTABLE -1,
     :pCOD_CUATM AS COD_CUATM,
     '01' AS NR_ROW,
      1  AS ORDINE,
     'Total' AS NUME_ROW,
     CIS2.NVAL(COUNT(DISTINCT CASE WHEN  D.CAPITOL IN (1004)   AND  NT.CODUL <> '6' THEN D.CUIIO ELSE NULL END))  AS  COL1

       
       FROM    
             CIS2.VW_DATA_ALL D    
                      
               INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS)  
               -------------------------------------------------------------------------------------                           
               INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL)  
               --------------------------------------------------------------------------------------------------
               INNER JOIN CIS2.CL_N85_NSIIP NS ON (RN.N85_NSIIP=NS.CODUL)  
                
                WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17 AND
               D.CAPITOL IN (1001,1002,1004)