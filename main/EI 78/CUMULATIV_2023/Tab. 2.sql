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
--FROM 
--(

  

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
--   '0' AS NUME_SECTIE2,

   (CASE WHEN NR_ROW = '98' THEN '99' ELSE NR_ROW END)||'~'||ROWNUM  NR_ROW,
   ROWNUM AS ORDINE,
  '1111' AS DECIMAL_POS,
   NUME_ROW,
   ROUND(COL1,1) COL1,
   ROUND(COL2,1) COL2,
  ROUND(COL3,1) COL3,
  ROUND(COL4,1) COL4
  
  FROM

(

 SELECT 
  D.NR_ROW,
  D.CL_ORDER_SERV,
    D.ORDINE, 
   D.NUME_ROW,
   SUM(D.COL1) AS COL1,
   SUM(D.COL2) AS COL2,
   SUM(D.COL3) AS COL3,
   SUM(D.COL4) AS COL4
   
FROM

(

SELECT 

   D.NR_ROW,
   D.CL_ORDER_SERV,
   D.ORDINE, 
   D.NUME_ROW,
   ROUND (D.COL1 / 1000,1) AS COL1,
   ROUND ((D.COL2 / CR.COL1) / 1000,1) AS COL2,
   ROUND (D.COL3 / 1000,1) AS COL3,
   ROUND ((D.COL4  / CR.COL1) / 1000,1) AS COL4
   
FROM


(

SELECT

   CODUL_SERV   NR_ROW,
   CL_ORDER_SERV,
   ORDINE, 
   DENUMIRE  NUME_ROW,
  COL1,
  COL2,
  COL3,
  COL4
FROM
(


(
SELECT 
    1 ORDINE,
     CII.NAME DENUMIRE,
     CII.ITEM_CODE    CODUL_SERV,
     CII.SHOW_ORDER CL_ORDER_SERV, 
     CII.ITEM_PATH FULL_CODE,
     
     SUM(CASE WHEN  MC.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)  AS COL1,
     SUM(CASE WHEN  MC.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)  AS COL2,
     SUM(CASE WHEN  MC.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)  AS COL3,
     SUM(CASE WHEN  MC.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)  AS COL4
     
      
      FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
        INNER  JOIN MD_CAPITOL MC ON MR.CAPITOL = MC.CAPITOL AND MR.CAPITOL_VERS = MC.CAPITOL_VERS
        
        
        INNER JOIN VW_CLS_CLASS_ITEM CI ON (CI.CLASS_CODE IN ('CSPM2') AND TRIM(D.COL31)=TRIM(CI.ITEM_CODE))
             
             
             
             
             
 INNER JOIN VW_CLS_CLASS_ITEM CII ON (CII.CLASS_CODE IN ('CSPM2')
          
     
          AND REPLACE(' '||CI.ITEM_PATH,';','; ') LIKE '% '||TRIM(CII.ITEM_CODE)||';%')
      
      -------------------------------------------------------------------------------
        
        ------------------------------------------------------------------------------      
      
   
   WHERE 
(D.PERIOADA IN (1056)) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
 -- (:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND
  MR.CAPITOL IN (405,407)   
  
  --AND D.CUIIO = 1129894
  
      GROUP BY
 
      CII.NAME,
      CII.ITEM_CODE,
       CII.ITEM_PATH,
       CII.SHOW_ORDER 
       
    
UNION 

SELECT
 ORDINE_TARA,
  DENUMIRE,
  CODUL_SERV,
  CL_ORDER_SERV,
  FULL_CODE,
  COL1,
  COL2,
  COL3,
  COL4
FROM(
SELECT 
     2 ORDINE,
      TTT.SHOW_ORDER AS ORDINE_TARA,
      TTT.NAME  DENUMIRE,
      CII.ITEM_CODE CODUL_SERV,
      CII.SHOW_ORDER CL_ORDER_SERV, 
      CII.ITEM_PATH FULL_CODE,
      SUM(CASE WHEN  MC.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)  AS COL1,
     SUM(CASE WHEN  MC.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)  AS COL2,
     SUM(CASE WHEN  MC.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)  AS COL3,
     SUM(CASE WHEN  MC.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)  AS COL4
      
      FROM CIS2.DATA_ALL D 
       
       INNER JOIN   CIS2.RENIM  R ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS) 
 
       
               
           
           
           INNER JOIN VW_CLS_CLASS_ITEM TT ON (TT.CLASS_CODE IN ('TARI_ISO') AND TT.ITEM_CODE=D.COL33) 
           
           
       INNER JOIN VW_CLS_CLASS_ITEM TTT ON (TTT.CLASS_CODE IN ('TARI_ISO') AND TT.ITEM_PATH LIKE '%'||TTT.ITEM_CODE||';%')
       
       INNER JOIN   CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
       INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
       INNER  JOIN MD_CAPITOL MC ON MR.CAPITOL = MC.CAPITOL AND MR.CAPITOL_VERS = MC.CAPITOL_VERS
       

--        
         INNER JOIN VW_CLS_CLASS_ITEM CI ON (CI.CLASS_CODE IN ('CSPM2') AND TRIM(D.COL31)=TRIM(CI.ITEM_CODE))
             
             
             
             
        INNER JOIN VW_CLS_CLASS_ITEM CII ON (CII.CLASS_CODE IN ('CSPM2')
          
     
          AND REPLACE(' '||CI.ITEM_PATH,';','; ') LIKE '% '||TRIM(CII.ITEM_CODE)||';%')
          
          
       -------------------------------------------------------------------------------
  
        ------------------------------------------------------------------------------  
       
   WHERE 
(D.PERIOADA IN (1056)) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
 -- (:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND
  MR.CAPITOL IN (405,407)  
  
  AND TTT.ITEM_CODE NOT IN ('000')
  AND CII.ITEM_CODE NOT IN ('00.00.00')
  
  --  AND D.CUIIO = 1129894
  
      GROUP BY
      TTT.SHOW_ORDER,
      TTT.NAME,
      CII.ITEM_CODE,
       TTT.ITEM_CODE,
       TTT.ITEM_PATH,
       CII.ITEM_PATH,
      CII.SHOW_ORDER
     
    ORDER BY
    TTT.SHOW_ORDER 

    
    )


 ORDER BY
  CL_ORDER_SERV,
  ORDINE
  
)  )

) D


 CROSS JOIN (
        

SELECT
           SUM(D.COL1)    AS COL1            
                  FROM DATA_ALL D
                         
                      
                        WHERE
                          (D.PERIOADA IN (1056)) AND     
                            
                           D.ID_MD  = 44519    
                              
                              
                              
                              
                              
                              
                              ) CR
                              
                              
                              
                              
                              
 UNION 
 
 SELECT 
 -- CASE WHEN D.NR_ROW = '1.00.00' THEN  '0'|| D.NR_ROW ELSE D.NR_ROW END  NR_ROW,
    D.NR_ROW,
    D.CL_ORDER_SERV,
   D.ORDINE, 
   D.NUME_ROW,
   ROUND (D.COL1 / 1000,1) AS COL1,
   ROUND ((D.COL2 / CR.COL1) / 1000,1) AS COL2,
   ROUND (D.COL3 / 1000,1) AS COL3,
   ROUND ((D.COL4  / CR.COL1) / 1000,1) AS COL4
   
FROM


(

SELECT

   CODUL_SERV   NR_ROW,
   CL_ORDER_SERV,
   ORDINE, 
   DENUMIRE  NUME_ROW,
  COL1,
  COL2,
  COL3,
  COL4
FROM
(


(
SELECT 
    1 ORDINE,
     CII.NAME DENUMIRE,
     CII.ITEM_CODE    CODUL_SERV,
     CII.SHOW_ORDER CL_ORDER_SERV, 
     CII.ITEM_PATH FULL_CODE,
     
     SUM(CASE WHEN  MC.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)  AS COL1,
     SUM(CASE WHEN  MC.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)  AS COL2,
     SUM(CASE WHEN  MC.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)  AS COL3,
     SUM(CASE WHEN  MC.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)  AS COL4
     
      
      FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
        INNER  JOIN MD_CAPITOL MC ON MR.CAPITOL = MC.CAPITOL AND MR.CAPITOL_VERS = MC.CAPITOL_VERS
        
        
        INNER JOIN VW_CLS_CLASS_ITEM CI ON (CI.CLASS_CODE IN ('CSPM2') AND TRIM(D.COL31)=TRIM(CI.ITEM_CODE))
             
             
             
             
             
 INNER JOIN VW_CLS_CLASS_ITEM CII ON (CII.CLASS_CODE IN ('CSPM2')
          
     
          AND REPLACE(' '||CI.ITEM_PATH,';','; ') LIKE '% '||TRIM(CII.ITEM_CODE)||';%')
      
      -------------------------------------------------------------------------------
        
        ------------------------------------------------------------------------------      
      
   
   WHERE 
(D.PERIOADA IN (1057)) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
 -- (:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND
  MR.CAPITOL IN (405,407)   
  
  --AND D.CUIIO = 1129894
  
      GROUP BY
 
      CII.NAME,
      CII.ITEM_CODE,
       CII.ITEM_PATH,
       CII.SHOW_ORDER 
       
    
UNION 

SELECT
 ORDINE_TARA,
  DENUMIRE,
  CODUL_SERV,
  CL_ORDER_SERV,
  FULL_CODE,
  COL1,
  COL2,
  COL3,
  COL4
FROM(
SELECT 
     2 ORDINE,
      TTT.SHOW_ORDER AS ORDINE_TARA,
      TTT.NAME  DENUMIRE,
      CII.ITEM_CODE CODUL_SERV,
      CII.SHOW_ORDER CL_ORDER_SERV, 
      CII.ITEM_PATH FULL_CODE,
      SUM(CASE WHEN  MC.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)  AS COL1,
     SUM(CASE WHEN  MC.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)  AS COL2,
     SUM(CASE WHEN  MC.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)  AS COL3,
     SUM(CASE WHEN  MC.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)  AS COL4
      
      FROM CIS2.DATA_ALL D 
       
       INNER JOIN   CIS2.RENIM  R ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS) 
 
       
               
           
           
           INNER JOIN VW_CLS_CLASS_ITEM TT ON (TT.CLASS_CODE IN ('TARI_ISO') AND TT.ITEM_CODE=D.COL33) 
           
           
       INNER JOIN VW_CLS_CLASS_ITEM TTT ON (TTT.CLASS_CODE IN ('TARI_ISO') AND TT.ITEM_PATH LIKE '%'||TTT.ITEM_CODE||';%')
       
       INNER JOIN   CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
       INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
       INNER  JOIN MD_CAPITOL MC ON MR.CAPITOL = MC.CAPITOL AND MR.CAPITOL_VERS = MC.CAPITOL_VERS
       

--        
         INNER JOIN VW_CLS_CLASS_ITEM CI ON (CI.CLASS_CODE IN ('CSPM2') AND TRIM(D.COL31)=TRIM(CI.ITEM_CODE))
             
             
             
             
        INNER JOIN VW_CLS_CLASS_ITEM CII ON (CII.CLASS_CODE IN ('CSPM2')
          
     
          AND REPLACE(' '||CI.ITEM_PATH,';','; ') LIKE '% '||TRIM(CII.ITEM_CODE)||';%')
          
          
       -------------------------------------------------------------------------------
  
        ------------------------------------------------------------------------------  
       
   WHERE 
(D.PERIOADA IN (1057)) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
 -- (:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND
  MR.CAPITOL IN (405,407)  
  
  AND TTT.ITEM_CODE NOT IN ('000')
  AND CII.ITEM_CODE NOT IN ('00.00.00')
  
  --  AND D.CUIIO = 1129894
  
      GROUP BY
      TTT.SHOW_ORDER,
      TTT.NAME,
      CII.ITEM_CODE,
       TTT.ITEM_CODE,
       TTT.ITEM_PATH,
       CII.ITEM_PATH,
      CII.SHOW_ORDER
     
    ORDER BY
    TTT.SHOW_ORDER 

    
    )


 ORDER BY
  CL_ORDER_SERV,
  ORDINE
  
)  )

) D


 CROSS JOIN (
        

SELECT
           SUM(D.COL1)    AS COL1            
                  FROM DATA_ALL D
                         
                      
                        WHERE
                          (D.PERIOADA IN (1057)) AND     
                            
                           D.ID_MD  = 44519    
                              
                              
                              
                              
                              
                              
                              ) CR                             
                              
            


------------------------1058

UNION 
 
 SELECT 
 --CASE WHEN D.NR_ROW = '1.00.00' THEN  '0'|| D.NR_ROW ELSE D.NR_ROW END  NR_ROW,
   D.NR_ROW,
   D.CL_ORDER_SERV,
   D.ORDINE, 
   D.NUME_ROW,
   ROUND (D.COL1 / 1000,1) AS COL1,
   ROUND ((D.COL2 / CR.COL1) / 1000,1) AS COL2,
   ROUND (D.COL3 / 1000,1) AS COL3,
   ROUND ((D.COL4  / CR.COL1) / 1000,1) AS COL4
   
FROM


(

SELECT

   CODUL_SERV   NR_ROW,
   CL_ORDER_SERV,
   ORDINE, 
   DENUMIRE  NUME_ROW,
  COL1,
  COL2,
  COL3,
  COL4
FROM
(


(
SELECT 
    1 ORDINE,
     CII.NAME DENUMIRE,
     CII.ITEM_CODE    CODUL_SERV,
     CII.SHOW_ORDER CL_ORDER_SERV, 
     CII.ITEM_PATH FULL_CODE,
     
     SUM(CASE WHEN  MC.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)  AS COL1,
     SUM(CASE WHEN  MC.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)  AS COL2,
     SUM(CASE WHEN  MC.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)  AS COL3,
     SUM(CASE WHEN  MC.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)  AS COL4
     
      
      FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
        INNER  JOIN MD_CAPITOL MC ON MR.CAPITOL = MC.CAPITOL AND MR.CAPITOL_VERS = MC.CAPITOL_VERS
        
        
        INNER JOIN VW_CLS_CLASS_ITEM CI ON (CI.CLASS_CODE IN ('CSPM2') AND TRIM(D.COL31)=TRIM(CI.ITEM_CODE))
             
             
             
             
             
 INNER JOIN VW_CLS_CLASS_ITEM CII ON (CII.CLASS_CODE IN ('CSPM2')
          
     
          AND REPLACE(' '||CI.ITEM_PATH,';','; ') LIKE '% '||TRIM(CII.ITEM_CODE)||';%')
      
      -------------------------------------------------------------------------------
        
        ------------------------------------------------------------------------------      
      
   
   WHERE 
(D.PERIOADA IN (1058)) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
 -- (:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND
  MR.CAPITOL IN (405,407)   
  
  --AND D.CUIIO = 1129894
  
      GROUP BY
 
      CII.NAME,
      CII.ITEM_CODE,
       CII.ITEM_PATH,
       CII.SHOW_ORDER 
       
    
UNION 

SELECT
 ORDINE_TARA,
  DENUMIRE,
  CODUL_SERV,
  CL_ORDER_SERV,
  FULL_CODE,
  COL1,
  COL2,
  COL3,
  COL4
FROM(
SELECT 
     2 ORDINE,
      TTT.SHOW_ORDER AS ORDINE_TARA,
      TTT.NAME  DENUMIRE,
      CII.ITEM_CODE CODUL_SERV,
      CII.SHOW_ORDER CL_ORDER_SERV, 
      CII.ITEM_PATH FULL_CODE,
      SUM(CASE WHEN  MC.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)  AS COL1,
     SUM(CASE WHEN  MC.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)  AS COL2,
     SUM(CASE WHEN  MC.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)  AS COL3,
     SUM(CASE WHEN  MC.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)  AS COL4
      
      FROM CIS2.DATA_ALL D 
       
       INNER JOIN   CIS2.RENIM  R ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS) 
 
       
               
           
           
           INNER JOIN VW_CLS_CLASS_ITEM TT ON (TT.CLASS_CODE IN ('TARI_ISO') AND TT.ITEM_CODE=D.COL33) 
           
           
       INNER JOIN VW_CLS_CLASS_ITEM TTT ON (TTT.CLASS_CODE IN ('TARI_ISO') AND TT.ITEM_PATH LIKE '%'||TTT.ITEM_CODE||';%')
       
       INNER JOIN   CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
       INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
       INNER  JOIN MD_CAPITOL MC ON MR.CAPITOL = MC.CAPITOL AND MR.CAPITOL_VERS = MC.CAPITOL_VERS
       

--        
         INNER JOIN VW_CLS_CLASS_ITEM CI ON (CI.CLASS_CODE IN ('CSPM2') AND TRIM(D.COL31)=TRIM(CI.ITEM_CODE))
             
             
             
             
        INNER JOIN VW_CLS_CLASS_ITEM CII ON (CII.CLASS_CODE IN ('CSPM2')
          
     
          AND REPLACE(' '||CI.ITEM_PATH,';','; ') LIKE '% '||TRIM(CII.ITEM_CODE)||';%')
          
          
       -------------------------------------------------------------------------------
  
        ------------------------------------------------------------------------------  
       
   WHERE 
(D.PERIOADA IN (1058)) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
 -- (:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND
  MR.CAPITOL IN (405,407)  
  
  AND TTT.ITEM_CODE NOT IN ('000')
  AND CII.ITEM_CODE NOT IN ('00.00.00')
  
  --  AND D.CUIIO = 1129894
  
      GROUP BY
      TTT.SHOW_ORDER,
      TTT.NAME,
      CII.ITEM_CODE,
       TTT.ITEM_CODE,
       TTT.ITEM_PATH,
       CII.ITEM_PATH,
      CII.SHOW_ORDER
     
    ORDER BY
    TTT.SHOW_ORDER 

    
    )


 ORDER BY
  CL_ORDER_SERV,
  ORDINE
  
)  )

) D


 CROSS JOIN (
        

SELECT
           SUM(D.COL1)    AS COL1            
                  FROM DATA_ALL D
                         
                      
                        WHERE
                          (D.PERIOADA IN (1058)) AND     
                            
                           D.ID_MD  = 44519    
                              
                              
                              
                              
                              
                              
                              ) CR           

----------------------------1058


--1059





------------------------1059

UNION 
 
 SELECT 
 --CASE WHEN D.NR_ROW = '1.00.00' THEN  '0'|| D.NR_ROW ELSE D.NR_ROW END  NR_ROW,
   D.NR_ROW,
   D.CL_ORDER_SERV,
   D.ORDINE, 
   D.NUME_ROW,
   ROUND (D.COL1 / 1000,1) AS COL1,
   ROUND ((D.COL2 / CR.COL1) / 1000,1) AS COL2,
   ROUND (D.COL3 / 1000,1) AS COL3,
   ROUND ((D.COL4  / CR.COL1) / 1000,1) AS COL4
   
FROM


(

SELECT

   CODUL_SERV   NR_ROW,
   CL_ORDER_SERV,
   ORDINE, 
   DENUMIRE  NUME_ROW,
  COL1,
  COL2,
  COL3,
  COL4
FROM
(


(
SELECT 
    1 ORDINE,
     CII.NAME DENUMIRE,
     CII.ITEM_CODE    CODUL_SERV,
     CII.SHOW_ORDER CL_ORDER_SERV, 
     CII.ITEM_PATH FULL_CODE,
     
     SUM(CASE WHEN  MC.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)  AS COL1,
     SUM(CASE WHEN  MC.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)  AS COL2,
     SUM(CASE WHEN  MC.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)  AS COL3,
     SUM(CASE WHEN  MC.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)  AS COL4
     
      
      FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
        INNER  JOIN MD_CAPITOL MC ON MR.CAPITOL = MC.CAPITOL AND MR.CAPITOL_VERS = MC.CAPITOL_VERS
        
        
        INNER JOIN VW_CLS_CLASS_ITEM CI ON (CI.CLASS_CODE IN ('CSPM2') AND TRIM(D.COL31)=TRIM(CI.ITEM_CODE))
             
             
             
             
             
 INNER JOIN VW_CLS_CLASS_ITEM CII ON (CII.CLASS_CODE IN ('CSPM2')
          
     
          AND REPLACE(' '||CI.ITEM_PATH,';','; ') LIKE '% '||TRIM(CII.ITEM_CODE)||';%')
      
      -------------------------------------------------------------------------------
        
        ------------------------------------------------------------------------------      
      
   
   WHERE 
(D.PERIOADA IN (1059)) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
 -- (:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND
  MR.CAPITOL IN (405,407)   
  
  --AND D.CUIIO = 1129894
  
      GROUP BY
 
      CII.NAME,
      CII.ITEM_CODE,
       CII.ITEM_PATH,
       CII.SHOW_ORDER 
       
    
UNION 

SELECT
 ORDINE_TARA,
  DENUMIRE,
  CODUL_SERV,
  CL_ORDER_SERV,
  FULL_CODE,
  COL1,
  COL2,
  COL3,
  COL4
FROM(
SELECT 
     2 ORDINE,
      TTT.SHOW_ORDER AS ORDINE_TARA,
      TTT.NAME  DENUMIRE,
      CII.ITEM_CODE CODUL_SERV,
      CII.SHOW_ORDER CL_ORDER_SERV, 
      CII.ITEM_PATH FULL_CODE,
      SUM(CASE WHEN  MC.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)  AS COL1,
     SUM(CASE WHEN  MC.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)  AS COL2,
     SUM(CASE WHEN  MC.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)  AS COL3,
     SUM(CASE WHEN  MC.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)  AS COL4
      
      FROM CIS2.DATA_ALL D 
       
       INNER JOIN   CIS2.RENIM  R ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS) 
 
       
               
           
           
           INNER JOIN VW_CLS_CLASS_ITEM TT ON (TT.CLASS_CODE IN ('TARI_ISO') AND TT.ITEM_CODE=D.COL33) 
           
           
       INNER JOIN VW_CLS_CLASS_ITEM TTT ON (TTT.CLASS_CODE IN ('TARI_ISO') AND TT.ITEM_PATH LIKE '%'||TTT.ITEM_CODE||';%')
       
       INNER JOIN   CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
       INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
       INNER  JOIN MD_CAPITOL MC ON MR.CAPITOL = MC.CAPITOL AND MR.CAPITOL_VERS = MC.CAPITOL_VERS
       

--        
         INNER JOIN VW_CLS_CLASS_ITEM CI ON (CI.CLASS_CODE IN ('CSPM2') AND TRIM(D.COL31)=TRIM(CI.ITEM_CODE))
             
             
             
             
        INNER JOIN VW_CLS_CLASS_ITEM CII ON (CII.CLASS_CODE IN ('CSPM2')
          
     
          AND REPLACE(' '||CI.ITEM_PATH,';','; ') LIKE '% '||TRIM(CII.ITEM_CODE)||';%')
          
          
       -------------------------------------------------------------------------------
  
        ------------------------------------------------------------------------------  
       
   WHERE 
(D.PERIOADA IN (1059)) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
 -- (:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND
  MR.CAPITOL IN (405,407)  
  
  AND TTT.ITEM_CODE NOT IN ('000')
  AND CII.ITEM_CODE NOT IN ('00.00.00')
  
  --  AND D.CUIIO = 1129894
  
      GROUP BY
      TTT.SHOW_ORDER,
      TTT.NAME,
      CII.ITEM_CODE,
       TTT.ITEM_CODE,
       TTT.ITEM_PATH,
       CII.ITEM_PATH,
      CII.SHOW_ORDER
     
    ORDER BY
    TTT.SHOW_ORDER 

    
    )


 ORDER BY
  CL_ORDER_SERV,
  ORDINE
  
)  )

) D


 CROSS JOIN (
        

SELECT
           SUM(D.COL1)    AS COL1            
                  FROM DATA_ALL D
                         
                      
                        WHERE
                          (D.PERIOADA IN (1059)) AND     
                            
                           D.ID_MD  = 44519    
                              
                              
                              
                              
                              
                              
                              ) CR           

----------------------------1059






                  
    

ORDER BY 

NR_ROW,
ORDINE     
)   D
                              

GROUP BY

   D.NR_ROW,
   D.CL_ORDER_SERV,
   D.ORDINE, 
   D.NUME_ROW
   
   ORDER BY 

CL_ORDER_SERV,
ORDINE  
    
) 



 
--    ) DF
--  
--  ;
--   
--    BEGIN
--
--  FOR CR IN C
--  
--  LOOP
--   
--    INSERT INTO  CIS2.TABLE_OUT
--  --  USER_BANCU.TABLE_OUT_TEST
--    (
--      PERIOADA,
--      FORM,
--      FORM_VERS,
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
  
  