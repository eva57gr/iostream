



SELECT 



     
       (CASE WHEN CII.ITEM_CODE = '98' THEN '99' ELSE CII.ITEM_CODE END)||'~'||CII.SHOW_ORDER  AS NR_ROW,  
     
    
     
     CII.SHOW_ORDER   AS ORDINE,  
    '1111' AS DECIMAL_POS,
     CII.NAME NUME_ROW,
     ROUND((SUM(CASE WHEN  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END))/1000,1) AS COL1,
     ROUND(((SUM(CASE WHEN  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) ) / CR.COL1 )/1000,1) AS COL2,
     ROUND((SUM(CASE WHEN  D.CAPITOL IN (407)  AND D.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) )/1000,1) AS COL3,
     ROUND(((SUM(CASE WHEN  D.CAPITOL IN (407)  AND D.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)) / CR.COL1)/1000,1) AS COL4
     FROM VW_DATA_ALL D
--          INNER JOIN RENIM RN
--             ON D.CUIIO = RN.CUIIO AND D.CUIIO_VERS = RN.CUIIO_VERS
--          INNER  JOIN VW_CL_CUATM CT ON RN.CUATM = CT.CODUL
--          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
--          INNER  JOIN MD_CAPITOL MC
--             ON MR.CAPITOL = MC.CAPITOL AND MR.CAPITOL_VERS = MC.CAPITOL_VERS
         

             
             
             
           INNER JOIN VW_CLS_CLASS_ITEM CI ON (CI.CLASS_CODE IN ('CSPM2') AND TRIM(D.COL31)=TRIM(CI.ITEM_CODE))
         
          INNER JOIN VW_CLS_CLASS_ITEM CII ON (CII.CLASS_CODE IN ('CSPM2')
          
     
          AND REPLACE(' '||CI.ITEM_PATH,';','; ') LIKE '% '||TRIM(CII.ITEM_CODE)||';%')
   
        -------------------------------------------------------------------------------
        CROSS JOIN (
         
         
           SELECT
            SUM(D.COL1)  AS COL1            
                  FROM DATA_ALL D
                         
                      
                        WHERE
                            (D.PERIOADA =:pPERIOADA) AND          
                            
                           D.ID_MD  = 44519   
                              
                              
                              
                              ) CR
        ------------------------------------------------------------------------------       
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  --(:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND D.CAPITOL IN (405,407) 
  
  GROUP BY 
  CII.ITEM_CODE,
  CII.SHOW_ORDER,  
  CII.NAME,
  CR.COL1
  

ORDER BY
CII.SHOW_ORDER


  

  




