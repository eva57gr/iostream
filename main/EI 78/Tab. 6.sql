--DECLARE
--
--  CURSOR C IS
--
--SELECT 
--    DF.PERIOADA,
--    DF.FORM,
--    DF.FORM_VERS,
--    DF.ID_MDTABLE,
--    DF.COD_CUATM,
--    DF.NR_SECTIE,
--    DF.NUME_SECTIE,
--    DF.NR_SECTIE1,
--    DF.NUME_SECTIE1,
--    DF.NR_SECTIE2,
--    DF.NUME_SECTIE2,
--    DF.NR_ROW NR_ROW,
--    DF.ORDINE,
--    DF.DECIMAL_POS,
--    DF.NUME_ROW,
--    DF.COL1,
--    DF.COL2,
--    DF.COL3,
--    DF.COL4
--    
--  
--
--   
--FROM 
--(
--






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
     C.ORDINE NR_ROW,
     C.ORDINE   AS ORDINE,
     '1111' AS DECIMAL_POS,
     c.denumire NUME_ROW,
     R.COL1    AS COL1,
     R.COL2    AS COL2,
     R.COL3    AS COL3,
     R.COL4    AS COL4
  FROM 

  (
           SELECT   
            c.codul,
            c.denumire,
            c.grupa,
            ROWNUM ordine,
            c.full_code
            
            FROM CIS2.VW_CL_CAEM2 C
            
            WHERE 
            C.CODUL LIKE '%0000'
            
            ORDER BY 
            c.full_code
            ) C 
            LEFT JOIN
            
            (
            
            SELECT 
    CC.CODUL,
    CC.DENUMIRE, 
    ROUND((SUM(CASE WHEN  MC.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)   )/1000,1) AS COL1,
 
   ROUND(((SUM(CASE WHEN  MC.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) 
     
     ) / CR.COL1 )/1000,1) AS COL2,
     
      ROUND((SUM(CASE WHEN  MC.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) 
     
     )/1000,1) AS COL3,
     
     ROUND(((SUM(CASE WHEN  MC.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)
     
     ) / CR.COL1)/1000,1) AS COL4
 

 FROM
    
    CIS2.DATA_ALL D 
     INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
         INNER JOIN     CIS2.VW_CL_CAEM2 C  ON  (C.CODUL=R.CAEM2)
         INNER JOIN     CIS2.VW_CL_CAEM2 CC  ON (C.FULL_CODE LIKE '%' ||CC.CODUL||';%' )   
         INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
          INNER  JOIN VW_CL_CUATM CT ON R.CUATM = CT.CODUL  
            INNER  JOIN MD_CAPITOL MC ON MR.CAPITOL = MC.CAPITOL AND MR.CAPITOL_VERS = MC.CAPITOL_VERS
        
      -------------------------------------------------------------------------------
        CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND               
                              D.FORM IN (101)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10002)
                              AND MR.RIND IN ('01') 
                              
                              ) CR
        ------------------------------------------------------------------------------       
      

WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
 -- (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)  AND
  MC.CAPITOL IN (405,407)  

  
 AND CC.CODUL LIKE '%0000'

  
  GROUP BY 
  CC.CODUL,
  CC.DENUMIRE,
  CC.FULL_CODE,
  CR.COL1 
  
  ORDER BY 
  CC.FULL_CODE
   
   
   )     R  ON (R.CODUL = C.CODUL)
            
           
   
   ORDER BY 
   C.ORDINE
   
   

   
   

  
   
   
   

   
   
--   ) DF
--  
--  ;
--   
--    BEGIN
--
--  FOR CR IN C
--  
--  LOOP
--    INSERT INTO  -- USER_BANCU.TABLE_OUT_TEST 
--    
--     CIS2.TABLE_OUT
--    (
--      PERIOADA,
--      FORM,
--      FORM_VERS,
--
--      ID_MDTABLE,
--      COD_CUATM,
--      NR_SECTIE,
--      NUME_SECTIE,
--      NR_SECTIE1,
--      NUME_SECTIE1,
--      NR_SECTIE2,
--      NUME_SECTIE2,
--      NR_ROW,
--      ORDINE,
--      DECIMAL_POS,
--      NUME_ROW,
--       
--      COL1, COL2, COL3,  COL4
--    )
--    VALUES
--    (
--      CR.PERIOADA,
--      CR.FORM,
--      CR.FORM_VERS,
--      CR.ID_MDTABLE,
--      CR.COD_CUATM,
--      CR.NR_SECTIE,
--      CR.NUME_SECTIE,
--      CR.NR_SECTIE1,
--      CR.NUME_SECTIE1,
--      CR.NR_SECTIE2,
--      CR.NUME_SECTIE2,
--      CR.NR_ROW,
--      CR.ORDINE,
--      CR.DECIMAL_POS,
--      CR.NUME_ROW,
--       
--      CR.COL1, CR.COL2, CR.COL3, CR.COL4
--    );
--  END LOOP;
--END;
--  
  
   