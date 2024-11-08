--INSERT INTO TABLE_OUT
--(
--
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
--         COL1,
--         COL2,
--         COL3,
--         COL4,
--         COL5,
--         COL6,
--         COL7,
--         COL8,
--         COL9,
--         COL10,
--         COL11,
--         COL12,
--         COL13,
--         COL14,
--         COL15
--)


SELECT 
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
      CASE WHEN NUME_ROW LIKE '%..........Scoala profesionala%' THEN '1' ELSE NR_ROW END  NR_ROW, 
      ORDINE,
      DECIMAL_POS,
      NUME_ROW,   
         COL1,
         COL2,
         COL3,
         COL4,
         COL5,
         COL6,
         COL7,
         COL8,
         COL9,
         COL10,
         COL11,
         COL12,
         COL13,
         COL14,
         COL15

    

FROM 
(

SELECT
    :pPERIOADA AS PERIOADA,
    :pFORM AS FORM,
    :pFORM_VERS AS FORM_VERS,
    :pID_MDTABLE AS ID_MDTABLE,
    :pCOD_CUATM AS COD_CUATM,
     B.CUATM_FULL_CODE  AS  NR_SECTIE,
     B.CUATM_CODUL||'-'||CUATM_DENUMIRE  AS NUME_SECTIE,
    '0' as NR_SECTIE1,
    '0' as NUME_SECTIE1,
     '0' as NR_SECTIE2,
    '0' as NUME_SECTIE2,
    (CASE WHEN (ltrim(TO_NUMBER(B.codul),'0')) IS  NULL   THEN '0' 
      WHEN (ltrim(TO_NUMBER(B.codul),'0')) = 1   THEN '10'
    
    
    
    ELSE (ltrim(TO_NUMBER(B.codul),'0')) END)||'~'||TO_CHAR(ROWNUM/1.145) AS NR_ROW,
    ROWNUM  AS ORDINE,
   '000000000000000' AS DECIMAL_POS,
    TRIM(B.DENUMIRE)    NUME_ROW,
    B.COL1,
    B.COL2,
    B.COL3,
    B.COL4,
    B.COL5,
    B.COL6,
    B.COL7,
    B.COL8,
    B.COL9,
    B.COL10,
    B.COL11,
    B.COL12,
    B.COL13,
    B.COL14,
    B.COL15 
    

FROM 
(
SELECT 
    ORDINE,
    ORDINE_INTERN,
    CUATM_CODUL,
    CUATM_DENUMIRE,
    CUATM_FULL_CODE,
    CODUL,
    DENUMIRE,
    FULL_CODE,
    COL1,
    COL2,
    COL3,
    COL4,
    COL5,
    COL6,
    COL7,
    COL8,
    COL9,
    COL10,
    COL11,
    COL12,
    COL13,
    COL14,
    COL15 
  FROM 
(
    SELECT 
    ORDINE,
    ROWNUM ORDINE_INTERN,
    CUATM_CODUL,
    CUATM_DENUMIRE,
    CUATM_FULL_CODE,
    CODUL,
    CDD_DENUMIRE DENUMIRE,
    FULL_CODE,
    COL1,
    COL2,
    COL3,
    COL4,
    COL5,
    COL6,
   COL7,
   COL8,
   COL9,
   COL10,
   COL11,
   COL12,
   COL13,
   COL14,
   COL15  
    
    FROM
    (
SELECT 
   '3'||'_'||CCU.FULL_CODE AS  ORDINE,
   CCU.CODUL     CUATM_CODUL,
   CCU.DENUMIRE  CUATM_DENUMIRE, 
   CCU.FULL_CODE CUATM_FULL_CODE,
   '2' CODUL,
   '..........Centrul de excelenta' CDD_DENUMIRE,  
   CDD.FULL_CODE_ORDINE CDD_FULL_CODE_ORDINE, 
   '00000'   CUIIO,
   NULL  FULL_CODE,
   COUNT (DISTINCT D.CUIIO)  COL1,
   
   NULL  COL2,NULL  COL3,NULL  COL4,NULL  COL5,NULL  COL6,NULL  COL7,NULL  COL8,NULL  COL9,NULL  COL10,NULL  COL11,NULL  COL12,NULL  COL13,NULL  COL14,NULL  COL15

FROM 
  CIS2.VW_DATA_ALL D
INNER JOIN (
---------------------------------------------------
SELECT 
    D.CUIIO,
    D.CUIIO_VERS,
    D.RIND  RIND,
(CASE 
  WHEN TO_CHAR(SUBSTR(D.RIND, 2)) LIKE '0%' THEN REPLACE(LTRIM(TO_CHAR(SUBSTR(D.RIND, 2)), '0'), '.', '')
  ELSE REPLACE(TO_CHAR(SUBSTR(D.RIND, 2)), '.', '')
END) AS RIND_MOD,
    D.ID_MD,
    D.RIND_VERS,
    MR.ORDINE
 FROM 
  CIS2.VW_DATA_ALL D  
  
                INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD 
  
WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND
  D.FORM IN (49)                 AND 
  D.CAPITOL IN (1049) AND     
( D.RIND NOT IN  ( SELECT  CODUL FROM CIS2.CL_TARI_CS ) AND  D.RIND NOT IN ('010','020','030','035','040','050','060','070'))   
       
  
  
  
         
  ) DD ON   (DD.ID_MD = D.ID_MD AND D.CUIIO = DD.CUIIO AND D.RIND = DD.RIND AND D.RIND_VERS = DD.RIND_VERS  AND D.CUIIO_VERS = DD.CUIIO_VERS)    
  
  
  
  

     INNER JOIN CIS2.RENIM R ON (D.CUIIO = R.CUIIO AND D.CUIIO_VERS = R.CUIIO_VERS) 
     INNER JOIN CIS2.VW_CL_CUATM CU ON (CU.CODUL=D.CUATM)  
     INNER JOIN CIS2.VW_CL_CUATM CCU ON (CU.FULL_CODE LIKE '%'||CCU.CODUL||';%')
-------------------------------------------------------------------------------------------

     INNER JOIN  (
            SELECT  
        
            RINDOUT  FULL_CODE_ORDINE,
            DENUMIRE,
            STATUT CODUL,
            ORDINE,
            
            RIND  FULL_CODE
            
            FROM CIS2.MD_RIND_OUT

            WHERE 
            ID_MDTABLE = 8701
     
     ) CD ON (CD.CODUL = R.NTII) 

    INNER JOIN (
     
     SELECT  
     
            RINDOUT  FULL_CODE_ORDINE,
            DENUMIRE,
            STATUT CODUL,
            ORDINE,
           
            RIND  FULL_CODE
            
            FROM CIS2.MD_RIND_OUT

            WHERE 
            ID_MDTABLE = 8701
     
     ) CDD ON (CD.FULL_CODE LIKE '%'||CDD.CODUL||';%') 
     
     ------------------------------------------------------------

WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND
  D.FORM IN (49)                 AND 
  D.CAPITOL IN (1049) 
  
  AND CCU.PRGS IN ('2')
  AND CCU.CODUL NOT IN ('0000000','1111111','2222222','3333333')
  ----------------------------------
  
  AND CDD.CODUL IN ('2')
  --------------------------------
  
 GROUP BY 
 
  CDD.CODUL,
  CDD.DENUMIRE, 
  CDD.FULL_CODE_ORDINE,
  CCU.CODUL,--
  CCU.DENUMIRE, 
  CCU.FULL_CODE

  
  ORDER BY 
  CCU.FULL_CODE
  )
  )
 
  
   
 
UNION 


    SELECT 
    ORDINE,
    ORDINE_INTERN,
    CUATM_CODUL,
    CUATM_DENUMIRE,
    CUATM_FULL_CODE,
    CODUL,
    DENUMIRE,
    FULL_CODE,
    COL1,
    COL2,
    COL3,
    COL4,
    COL5,
    COL6,
    COL7,
    COL8,
    COL9,
    COL10,
    COL11,
    COL12,
    COL13,
    COL14,
    COL15 
  FROM
(
SELECT
   '4'||'_'||CUATM_FULL_CODE ORDINE,
   ROWNUM ORDINE_INTERN,
   CUATM_CODUL,
   CUATM_DENUMIRE, 
   CUATM_FULL_CODE,
   CODUL,
   DENUMIRE,
   FULL_CODE,
   COL1,
   COL2,
   COL3,
   COL4,
   COL5,
   COL6,
   COL7,
   COL8,
   COL9,
   COL10,
   COL11,
   COL12,
   COL13,
   COL14,
   COL15 
   

FROM


(
SELECT 
   ORDINE,
   CUATM_CODUL,
   CUATM_DENUMIRE, 
   CUATM_FULL_CODE,
   CUIIO,
   CODUL,
   DENUMIRE,
   FULL_CODE,
   COL1,
   COL2,
   COL3,
   COL4,
   COL5,
   COL6,
   COL7,
   COL8,
   COL9,
   COL10,
   COL11,
   COL12,
   COL13,
   COL14,
   COL15 
   

FROM 
(
SELECT 
   '1'||'_'||D.CUIIO AS  ORDINE,
   CCU.CODUL     CUATM_CODUL,
   CCU.DENUMIRE  CUATM_DENUMIRE, 
   CCU.FULL_CODE CUATM_FULL_CODE,
   CDD.CODUL    NR_ROW,
   CDD.DENUMIRE NR_DENUMIRE, 
   CDD.FULL_CODE_ORDINE CDD_FULL_CODE_ORDINE, 
   D.CUIIO||CDD.FULL_CODE_ORDINE   CUIIO,
   
   TO_CHAR(D.CUIIO)  CODUL,
   R.DENUMIRE,
   NULL  FULL_CODE,
   NULL  COL1,NULL  COL2,NULL  COL3,NULL  COL4,NULL  COL5,NULL  COL6,NULL  COL7,NULL  COL8,NULL  COL9,NULL  COL10,NULL  COL11,NULL  COL12,NULL  COL13,NULL  COL14,NULL  COL15

FROM 
  CIS2.VW_DATA_ALL D
INNER JOIN (
---------------------------------------------------------------------------------------------
SELECT 
    D.CUIIO,
    D.CUIIO_VERS,
    D.RIND  RIND,
(CASE 
  WHEN TO_CHAR(SUBSTR(D.RIND, 2)) LIKE '0%' THEN REPLACE(LTRIM(TO_CHAR(SUBSTR(D.RIND, 2)), '0'), '.', '')
  ELSE REPLACE(TO_CHAR(SUBSTR(D.RIND, 2)), '.', '')
END) AS RIND_MOD,
    D.ID_MD,
    D.RIND_VERS,
    MR.ORDINE
 FROM 
  CIS2.VW_DATA_ALL D  
  
                INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD 
  
WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND
  D.FORM IN (49)                 AND 
  D.CAPITOL IN (1049) AND     
( D.RIND NOT IN  ( SELECT  CODUL FROM CIS2.CL_TARI_CS ) AND  D.RIND NOT IN ('010','020','030','035','040','050','060','070'))   
       
  --------------------------------------------------------------------------------------------------------------------------------------------------------------
  
     
  ) DD ON   (DD.ID_MD = D.ID_MD AND D.CUIIO = DD.CUIIO AND D.RIND = DD.RIND AND D.RIND_VERS = DD.RIND_VERS  AND D.CUIIO_VERS = DD.CUIIO_VERS)   
  

----------------------------------------------------------------------------------------------------   
--     INNER JOIN  CIS2.VW_CL_SPEC_2EDU C  ON  (ltrim(TO_NUMBER(C.codul),'0') =  DD.RIND_MOD) 
--     INNER JOIN  CIS2.VW_CL_SPEC_2EDU   CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')
     
 INNER JOIN  (SELECT  
        
        RINDOUT CODUL,
        DENUMIRE DENUMIRE,
        
        ORDINE,
        
         RIND FULL_CODE

FROM CIS2.MD_RIND_OUT

WHERE
 ID_MDTABLE = 13915) C  ON  (ltrim(TO_NUMBER(C.codul),'0') =  DD.RIND_MOD) 
     
    INNER  JOIN   (SELECT  
        
        TRIM(RINDOUT) CODUL,
        DENUMIRE DENUMIRE,
        
        ORDINE,
        
         RIND FULL_CODE

FROM CIS2.MD_RIND_OUT

WHERE
 ID_MDTABLE = 13915)   CC ON  C.FULL_CODE LIKE '%'||CC.CODUL||';%'
  --------------------------------------------------------------------------------------------   
  



   INNER JOIN CIS2.RENIM R ON (D.CUIIO = R.CUIIO AND D.CUIIO_VERS = R.CUIIO_VERS) 
     
     INNER JOIN CIS2.VW_CL_CUATM CU ON (CU.CODUL=D.CUATM)  
     INNER JOIN CIS2.VW_CL_CUATM CCU ON (CU.FULL_CODE LIKE '%'||CCU.CODUL||';%')
-------------------------------------------------------------------------------------------

     INNER JOIN  (
            SELECT  
        
            RINDOUT  FULL_CODE_ORDINE,
            DENUMIRE,
            STATUT CODUL,
            ORDINE,
            RIND  FULL_CODE
            
            FROM CIS2.MD_RIND_OUT

            WHERE 
            ID_MDTABLE = 8701
     
     ) CD ON (CD.CODUL = R.NTII) 

    INNER JOIN (
     
     SELECT  
          
            RINDOUT  FULL_CODE_ORDINE,
            DENUMIRE,
            STATUT CODUL,
            ORDINE,
            RIND  FULL_CODE
            
            FROM CIS2.MD_RIND_OUT

            WHERE 
            ID_MDTABLE = 8701
     
     ) CDD ON (CD.FULL_CODE LIKE '%'||CDD.CODUL||';%') 
     
     ------------------------------------------------------------

WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND
  D.FORM IN (49)                 AND 
  D.CAPITOL IN (1049) 
  
  AND CCU.PRGS IN ('2')
  AND CCU.CODUL NOT IN ('0000000','1111111','2222222','3333333')
  ----------------------------------
  
  AND CDD.CODUL IN ('2')
  --------------------------------
  
 GROUP BY 
  D.CUIIO,
  CDD.CODUL,
  CDD.DENUMIRE, 
  CDD.FULL_CODE_ORDINE,
  CCU.CODUL,--
  CCU.DENUMIRE, 
  CCU.FULL_CODE,
  R.DENUMIRE



---------------------------------------------------------------------------------------------

UNION 


SELECT 
  '2'||'_'||D.CUIIO AS  ORDINE, 
   CCU.CODUL     CUATM_CODUL,
   CCU.DENUMIRE  CUATM_DENUMIRE, 
   CCU.FULL_CODE CUATM_FULL_CODE,
     CDD.CODUL    NR_ROW,
     CDD.DENUMIRE NR_DENUMIRE, 
     CDD.FULL_CODE_ORDINE CDD_FULL_CODE_ORDINE, 
  
   D.CUIIO||CDD.FULL_CODE_ORDINE   CUIIO,

   CC.CODUL,
   CC.DENUMIRE,
   CC.FULL_CODE,
   SUM (CIS2.NVAL(D.COL1)) COL1,
   SUM (CIS2.NVAL(D.COL2)) COL2,
   SUM (CIS2.NVAL(D.COL1)-CIS2.NVAL(D.COL2))  COL3,
   SUM (CIS2.NVAL(D.COL1)-CIS2.NVAL(D.COL3))  COL4,
   SUM (CIS2.NVAL(D.COL3)) COL5,
   SUM (CIS2.NVAL(D.COL7)) COL6,
   SUM (CIS2.NVAL(D.COL8)) COL7,
   SUM (CIS2.NVAL(D.COL7)-CIS2.NVAL(D.COL8)  ) COL8,
   SUM (CIS2.NVAL(D.COL7)-CIS2.NVAL(D.COL9)  ) COL9,
   SUM (CIS2.NVAL(D.COL9)) COL10,
   SUM (CIS2.NVAL(D.COL10)) COL11,
   SUM (CIS2.NVAL(D.COL11)) COL12,
   SUM (CIS2.NVAL(D.COL10)-CIS2.NVAL(D.COL11)) COL13,
   SUM (CIS2.NVAL(D.COL10)-CIS2.NVAL(D.COL12))  COL14,
   SUM ( CIS2.NVAL(D.COL12)) COL15
FROM 
  CIS2.VW_DATA_ALL D
INNER JOIN(

----------------------------------------------------------------------------------------
SELECT 
    D.CUIIO,
    D.CUIIO_VERS,
    D.RIND  RIND,
(CASE 
  WHEN TO_CHAR(SUBSTR(D.RIND, 2)) LIKE '0%' THEN REPLACE(LTRIM(TO_CHAR(SUBSTR(D.RIND, 2)), '0'), '.', '')
  ELSE REPLACE(TO_CHAR(SUBSTR(D.RIND, 2)), '.', '')
END) AS RIND_MOD,
    D.ID_MD,
    D.RIND_VERS,
    MR.ORDINE
 FROM 
  CIS2.VW_DATA_ALL D  
  
                INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD 
  
WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND
  D.FORM IN (49)                 AND 
  D.CAPITOL IN (1049) AND     
( D.RIND NOT IN  ( SELECT  CODUL FROM CIS2.CL_TARI_CS ) AND  D.RIND NOT IN ('010','020','030','035','040','050','060','070'))   
         
  
 -------------------------------------------------------------------------------------------------------- 
  
    
  ) DD ON   (DD.ID_MD = D.ID_MD AND D.CUIIO = DD.CUIIO AND D.RIND = DD.RIND AND D.RIND_VERS = DD.RIND_VERS  AND D.CUIIO_VERS = DD.CUIIO_VERS)    
 
     --------------------------------------------------------------------------------------------------
     
--     INNER JOIN  CIS2.VW_CL_SPEC_2EDU C  ON  (ltrim(TO_NUMBER(C.codul),'0') =  DD.RIND_MOD) 
--     INNER JOIN  CIS2.VW_CL_SPEC_2EDU   CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')
--     

 INNER JOIN  (SELECT  
        
        RINDOUT CODUL,
        DENUMIRE DENUMIRE,
        
        ORDINE,
        
         RIND FULL_CODE

FROM CIS2.MD_RIND_OUT

WHERE
 ID_MDTABLE = 13915) C  ON  (ltrim(TO_NUMBER(C.codul),'0') =  DD.RIND_MOD) 
     
    INNER  JOIN   (SELECT  
        
        TRIM(RINDOUT) CODUL,
        DENUMIRE DENUMIRE,
        
        ORDINE,
        
         RIND FULL_CODE

FROM CIS2.MD_RIND_OUT

WHERE
 ID_MDTABLE = 13915)   CC ON  C.FULL_CODE LIKE '%'||CC.CODUL||';%'
     ----------------------------------------------------------------------------------------------
     INNER JOIN CIS2.RENIM R ON (D.CUIIO = R.CUIIO AND D.CUIIO_VERS = R.CUIIO_VERS) 
     INNER JOIN  CIS2.VW_CL_CUATM CU   ON (CU.CODUL = D.CUATM)
     INNER JOIN  CIS2.VW_CL_CUATM CCU  ON (CU.FULL_CODE LIKE '%'||CCU.CODUL||';%')
--------------------------------------------------------------------------------------------
INNER JOIN  (
            SELECT  
        
            RINDOUT  FULL_CODE_ORDINE,
            DENUMIRE,
            STATUT CODUL,
            ORDINE,
           
            RIND  FULL_CODE
            
            FROM CIS2.MD_RIND_OUT

            WHERE 
            ID_MDTABLE = 8701
     
     ) CD ON (CD.CODUL = R.NTII) 

    INNER JOIN (
     
     SELECT  
          
            RINDOUT  FULL_CODE_ORDINE,
            DENUMIRE,
            STATUT CODUL,
            ORDINE,
           
            RIND  FULL_CODE
            
            FROM CIS2.MD_RIND_OUT

            WHERE 
            ID_MDTABLE = 8701
     
     ) CDD ON (CD.FULL_CODE LIKE '%'||CDD.CODUL||';%') 
---------------------------------------------------------------------------------------------


     
 WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND
  D.FORM IN (49)                 AND 
  D.CAPITOL IN (1049) 
  AND CCU.PRGS IN ('2')
  AND CCU.CODUL NOT IN ('0000000','1111111','2222222','3333333')
  AND CDD.CODUL IN ('2')
  GROUP BY 
  D.CUIIO,
  CCU.CODUL,--
  CCU.DENUMIRE, 
  CCU.FULL_CODE,

  CDD.CODUL,
  CDD.DENUMIRE, 
  CDD.FULL_CODE_ORDINE,
  CC.CODUL,
  CC.DENUMIRE,
  CC.FULL_CODE,
  CC.ORDINE
 
  )
  
  ORDER BY 
  CUIIO,
  ORDINE, 
  FULL_CODE,
  CDD_FULL_CODE_ORDINE,
  CUATM_FULL_CODE
  ))
  
 UNION 
SELECT 
    ORDINE,
    ORDINE_INTERN,
    CUATM_CODUL,
    CUATM_DENUMIRE,
    CUATM_FULL_CODE,
    CODUL,
    DENUMIRE,
    FULL_CODE,
    COL1,
    COL2,
    COL3,
    COL4,
    COL5,
    COL6,
    COL7,
    COL8,
    COL9,
    COL10,
    COL11,
    COL12,
    COL13,
    COL14,
    COL15 
  FROM 
(
    SELECT 
    ORDINE,
    ROWNUM ORDINE_INTERN,
    CUATM_CODUL,
    CUATM_DENUMIRE,
    CUATM_FULL_CODE,
    CODUL,
    CDD_DENUMIRE DENUMIRE,
    FULL_CODE,
    COL1,
    COL2,
    COL3,
    COL4,
    COL5,
    COL6,
   COL7,
   COL8,
   COL9,
   COL10,
   COL11,
   COL12,
   COL13,
   COL14,
   COL15  
    
    FROM
    (
SELECT 
   '5'||'_'||CCU.FULL_CODE AS  ORDINE,
   CCU.CODUL     CUATM_CODUL,
   CCU.DENUMIRE  CUATM_DENUMIRE, 
   CCU.FULL_CODE CUATM_FULL_CODE,
   '1' CODUL,
   '..........Scoala profesionala' CDD_DENUMIRE,  
   CDD.FULL_CODE_ORDINE CDD_FULL_CODE_ORDINE, 
   '00000'   CUIIO,
   NULL  FULL_CODE,
   COUNT (DISTINCT D.CUIIO)  COL1,
   
   NULL  COL2,NULL  COL3,NULL  COL4,NULL  COL5,NULL  COL6,NULL  COL7,NULL  COL8,NULL  COL9,NULL  COL10,NULL  COL11,NULL  COL12,NULL  COL13,NULL  COL14,NULL  COL15

FROM 
  CIS2.VW_DATA_ALL D
INNER JOIN (

------------------------------------------------------------------------------
SELECT 
    D.CUIIO,
    D.CUIIO_VERS,
    D.RIND  RIND,
(CASE 
  WHEN TO_CHAR(SUBSTR(D.RIND, 2)) LIKE '0%' THEN REPLACE(LTRIM(TO_CHAR(SUBSTR(D.RIND, 2)), '0'), '.', '')
  ELSE REPLACE(TO_CHAR(SUBSTR(D.RIND, 2)), '.', '')
END) AS RIND_MOD,
    D.ID_MD,
    D.RIND_VERS,
    MR.ORDINE
 FROM 
  CIS2.VW_DATA_ALL D  
  
                INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD 
  
WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND
  D.FORM IN (49)                 AND 
  D.CAPITOL IN (1049) AND     
( D.RIND NOT IN  ( SELECT  CODUL FROM CIS2.CL_TARI_CS ) AND  D.RIND NOT IN ('010','020','030','035','040','050','060','070'))   
         
  
  ------------------------------------------------------------------------------------  
  ) DD ON   (DD.ID_MD = D.ID_MD AND D.CUIIO = DD.CUIIO AND D.RIND = DD.RIND AND D.RIND_VERS = DD.RIND_VERS  AND D.CUIIO_VERS = DD.CUIIO_VERS)    

     INNER JOIN CIS2.RENIM R ON (D.CUIIO = R.CUIIO AND D.CUIIO_VERS = R.CUIIO_VERS) 
     INNER JOIN CIS2.VW_CL_CUATM CU ON (CU.CODUL=D.CUATM)  
     INNER JOIN CIS2.VW_CL_CUATM CCU ON (CU.FULL_CODE LIKE '%'||CCU.CODUL||';%')
-------------------------------------------------------------------------------------------

     INNER JOIN  (
            SELECT  
        
            RINDOUT  FULL_CODE_ORDINE,
            DENUMIRE,
            STATUT CODUL,
            ORDINE,
            
            RIND  FULL_CODE
            
            FROM CIS2.MD_RIND_OUT

            WHERE 
            ID_MDTABLE = 8701
     
     ) CD ON (CD.CODUL = R.NTII) 

    INNER JOIN (
     
     SELECT  
     
            RINDOUT  FULL_CODE_ORDINE,
            DENUMIRE,
            STATUT CODUL,
            ORDINE,
           
            RIND  FULL_CODE
            
            FROM CIS2.MD_RIND_OUT

            WHERE 
            ID_MDTABLE = 8701
     
     ) CDD ON (CD.FULL_CODE LIKE '%'||CDD.CODUL||';%') 
     
     ------------------------------------------------------------

WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND
  D.FORM IN (49)                 AND 
  D.CAPITOL IN (1049) 
  
  AND CCU.PRGS IN ('2')
  AND CCU.CODUL NOT IN ('0000000','1111111','2222222','3333333')
  ----------------------------------
  
  AND CDD.CODUL IN ('1')
  --------------------------------
  
 GROUP BY 
 
  CDD.CODUL,
  CDD.DENUMIRE, 
  CDD.FULL_CODE_ORDINE,
  CCU.CODUL,--
  CCU.DENUMIRE, 
  CCU.FULL_CODE
 -- R.DENUMIRE
  
  ORDER BY 
  CCU.FULL_CODE
  )
  )
 
  
   
 
UNION 


    SELECT 
    ORDINE,
    ORDINE_INTERN,
    CUATM_CODUL,
    CUATM_DENUMIRE,
    CUATM_FULL_CODE,
    CODUL,
    DENUMIRE,
    FULL_CODE,
    COL1,
    COL2,
    COL3,
    COL4,
    COL5,
    COL6,
    COL7,
    COL8,
    COL9,
    COL10,
    COL11,
    COL12,
    COL13,
    COL14,
    COL15 
  FROM
(
SELECT
   '6'||'_'||CUATM_FULL_CODE ORDINE,
   ROWNUM ORDINE_INTERN,
   CUATM_CODUL,
   CUATM_DENUMIRE, 
   CUATM_FULL_CODE,
   CODUL,
   DENUMIRE,
   FULL_CODE,
   COL1,
   COL2,
   COL3,
   COL4,
   COL5,
   COL6,
   COL7,
   COL8,
   COL9,
   COL10,
   COL11,
   COL12,
   COL13,
   COL14,
   COL15 
   

FROM


(
SELECT 
   ORDINE,
   CUATM_CODUL,
   CUATM_DENUMIRE, 
   CUATM_FULL_CODE,
   CUIIO,
   CODUL,
   DENUMIRE,
   FULL_CODE,
   COL1,
   COL2,
   COL3,
   COL4,
   COL5,
   COL6,
   COL7,
   COL8,
   COL9,
   COL10,
   COL11,
   COL12,
   COL13,
   COL14,
   COL15 
   

FROM 
(
SELECT 
   '1'||'_'||D.CUIIO AS  ORDINE,
   CCU.CODUL     CUATM_CODUL,
   CCU.DENUMIRE  CUATM_DENUMIRE, 
   CCU.FULL_CODE CUATM_FULL_CODE,
   CDD.CODUL    NR_ROW,
   CDD.DENUMIRE NR_DENUMIRE, 
   CDD.FULL_CODE_ORDINE CDD_FULL_CODE_ORDINE, 
   D.CUIIO||CDD.FULL_CODE_ORDINE   CUIIO,
   
   TO_CHAR(D.CUIIO)  CODUL,
   R.DENUMIRE,
   NULL  FULL_CODE,
   NULL  COL1,NULL  COL2,NULL  COL3,NULL  COL4,NULL  COL5,NULL  COL6,NULL  COL7,NULL  COL8,NULL  COL9,NULL  COL10,NULL  COL11,NULL  COL12,NULL  COL13,NULL  COL14,NULL  COL15

FROM 
  CIS2.VW_DATA_ALL D
INNER JOIN (
----------------------------------------------------------------------------------
SELECT 
    D.CUIIO,
    D.CUIIO_VERS,
    D.RIND  RIND,
(CASE 
  WHEN TO_CHAR(SUBSTR(D.RIND, 2)) LIKE '0%' THEN REPLACE(LTRIM(TO_CHAR(SUBSTR(D.RIND, 2)), '0'), '.', '')
  ELSE REPLACE(TO_CHAR(SUBSTR(D.RIND, 2)), '.', '')
END) AS RIND_MOD,
    D.ID_MD,
    D.RIND_VERS,
    MR.ORDINE
 FROM 
  CIS2.VW_DATA_ALL D  
  
                INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD 
  
WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND
  D.FORM IN (49)                 AND 
  D.CAPITOL IN (1049) AND     
( D.RIND NOT IN  ( SELECT  CODUL FROM CIS2.CL_TARI_CS ) AND  D.RIND NOT IN ('010','020','030','035','040','050','060','070'))   
       
  
  --------------------------------------------------------------------------------------------------------------     
  ) DD ON   (DD.ID_MD = D.ID_MD AND D.CUIIO = DD.CUIIO AND D.RIND = DD.RIND AND D.RIND_VERS = DD.RIND_VERS  AND D.CUIIO_VERS = DD.CUIIO_VERS)    
     
     ------------------------------------------------------------------------------------------
     
--     INNER JOIN  CIS2.VW_CL_SPEC_2EDU C  ON  (ltrim(TO_NUMBER(C.codul),'0') =  DD.RIND_MOD) 
--     INNER JOIN  CIS2.VW_CL_SPEC_2EDU   CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')
--     
     

 INNER JOIN  (SELECT  
        
        RINDOUT CODUL,
        DENUMIRE DENUMIRE,
        
        ORDINE,
        
         RIND FULL_CODE

FROM CIS2.MD_RIND_OUT

WHERE
 ID_MDTABLE = 13915) C  ON  (ltrim(TO_NUMBER(C.codul),'0') =  DD.RIND_MOD) 
     
    INNER  JOIN   (SELECT  
        
        TRIM(RINDOUT) CODUL,
        DENUMIRE DENUMIRE,
        
        ORDINE,
        
         RIND FULL_CODE

FROM CIS2.MD_RIND_OUT

WHERE
 ID_MDTABLE = 13915)   CC ON  C.FULL_CODE LIKE '%'||CC.CODUL||';%'
     -----------------------------------------------------------------------------------------
     
     
     INNER JOIN CIS2.RENIM R ON (D.CUIIO = R.CUIIO AND D.CUIIO_VERS = R.CUIIO_VERS) 
     
     INNER JOIN CIS2.VW_CL_CUATM CU ON (CU.CODUL=D.CUATM)  
     INNER JOIN CIS2.VW_CL_CUATM CCU ON (CU.FULL_CODE LIKE '%'||CCU.CODUL||';%')
-------------------------------------------------------------------------------------------

     INNER JOIN  (
            SELECT  
        
            RINDOUT  FULL_CODE_ORDINE,
            DENUMIRE,
            STATUT CODUL,
            ORDINE,
            RIND  FULL_CODE
            
            FROM CIS2.MD_RIND_OUT

            WHERE 
            ID_MDTABLE = 8701
     
     ) CD ON (CD.CODUL = R.NTII) 

    INNER JOIN (
     
     SELECT  
          
            RINDOUT  FULL_CODE_ORDINE,
            DENUMIRE,
            STATUT CODUL,
            ORDINE,
         
            RIND  FULL_CODE
            
            FROM CIS2.MD_RIND_OUT

            WHERE 
            ID_MDTABLE = 8701
     
     ) CDD ON (CD.FULL_CODE LIKE '%'||CDD.CODUL||';%') 
     
     ------------------------------------------------------------

WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND
  D.FORM IN (49)                 AND 
  D.CAPITOL IN (1049) 
  
  AND CCU.PRGS IN ('2')
  AND CCU.CODUL NOT IN ('0000000','1111111','2222222','3333333')
  
  
  AND CDD.CODUL IN ('1')
 
  
 GROUP BY 
  D.CUIIO,
  CDD.CODUL,
  CDD.DENUMIRE, 
  CDD.FULL_CODE_ORDINE,
  CCU.CODUL,--
  CCU.DENUMIRE, 
  CCU.FULL_CODE,
  R.DENUMIRE



---------------------------------------------------------------------------------------------

UNION 


SELECT 
  '2'||'_'||D.CUIIO AS  ORDINE, 
   CCU.CODUL     CUATM_CODUL,
   CCU.DENUMIRE  CUATM_DENUMIRE, 
   CCU.FULL_CODE CUATM_FULL_CODE,
     CDD.CODUL    NR_ROW,
     CDD.DENUMIRE NR_DENUMIRE, 
     CDD.FULL_CODE_ORDINE CDD_FULL_CODE_ORDINE, 
  
   D.CUIIO||CDD.FULL_CODE_ORDINE   CUIIO,

   CC.CODUL,
   CC.DENUMIRE,
   CC.FULL_CODE,
   SUM (CIS2.NVAL(D.COL1)) COL1,
   SUM (CIS2.NVAL(D.COL2)) COL2,
   SUM (CIS2.NVAL(D.COL1)-CIS2.NVAL(D.COL2))  COL3,
   SUM (CIS2.NVAL(D.COL1)-CIS2.NVAL(D.COL3))  COL4,
   SUM (CIS2.NVAL(D.COL3)) COL5,
   SUM (CIS2.NVAL(D.COL7)) COL6,
   SUM (CIS2.NVAL(D.COL8)) COL7,
   SUM (CIS2.NVAL(D.COL7)-CIS2.NVAL(D.COL8)  ) COL8,
   SUM (CIS2.NVAL(D.COL7)-CIS2.NVAL(D.COL9)  ) COL9,
   SUM (CIS2.NVAL(D.COL9)) COL10,
   SUM (CIS2.NVAL(D.COL10)) COL11,
   SUM (CIS2.NVAL(D.COL11)) COL12,
   SUM (CIS2.NVAL(D.COL10)-CIS2.NVAL(D.COL11)) COL13,
   SUM (CIS2.NVAL(D.COL10)-CIS2.NVAL(D.COL12))  COL14,
   SUM ( CIS2.NVAL(D.COL12)) COL15
FROM 
  CIS2.VW_DATA_ALL D
INNER JOIN(

------------------------------------------------------------------------------------
SELECT 
    D.CUIIO,
    D.CUIIO_VERS,
    D.RIND  RIND,
(CASE 
  WHEN TO_CHAR(SUBSTR(D.RIND, 2)) LIKE '0%' THEN REPLACE(LTRIM(TO_CHAR(SUBSTR(D.RIND, 2)), '0'), '.', '')
  ELSE REPLACE(TO_CHAR(SUBSTR(D.RIND, 2)), '.', '')
END) AS RIND_MOD,
    D.ID_MD,
    D.RIND_VERS,
    MR.ORDINE
 FROM 
  CIS2.VW_DATA_ALL D  
  
                INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD 
  
WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND
  D.FORM IN (49)                 AND 
  D.CAPITOL IN (1049) AND     
( D.RIND NOT IN  ( SELECT  CODUL FROM CIS2.CL_TARI_CS ) AND  D.RIND NOT IN ('010','020','030','035','040','050','060','070'))   
        
  
  
  ------------------------------------------------------------- 
  ) DD ON   (DD.ID_MD = D.ID_MD AND D.CUIIO = DD.CUIIO AND D.RIND = DD.RIND AND D.RIND_VERS = DD.RIND_VERS  AND D.CUIIO_VERS = DD.CUIIO_VERS)    
 
     
     -----------------------------------------------------------------------------------------------
--     INNER JOIN  CIS2.VW_CL_SPEC_2EDU C  ON  (ltrim(TO_NUMBER(C.codul),'0') =  DD.RIND_MOD) 
--     INNER JOIN  CIS2.VW_CL_SPEC_2EDU   CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')
     
 INNER JOIN  (SELECT  
        
        RINDOUT CODUL,
        DENUMIRE DENUMIRE,
        
        ORDINE,
        
         RIND FULL_CODE

FROM CIS2.MD_RIND_OUT

WHERE
 ID_MDTABLE = 13915) C  ON  (ltrim(TO_NUMBER(C.codul),'0') =  DD.RIND_MOD) 
     
    INNER  JOIN   (SELECT  
        
        TRIM(RINDOUT) CODUL,
        DENUMIRE DENUMIRE,
        
        ORDINE,
        
         RIND FULL_CODE

FROM CIS2.MD_RIND_OUT

WHERE
 ID_MDTABLE = 13915)   CC ON  C.FULL_CODE LIKE '%'||CC.CODUL||';%'
     ------------------------------------------------------------------------------------------
     
     
     INNER JOIN CIS2.RENIM R ON (D.CUIIO = R.CUIIO AND D.CUIIO_VERS = R.CUIIO_VERS) 
     INNER JOIN  CIS2.VW_CL_CUATM CU   ON (CU.CODUL = D.CUATM)
     INNER JOIN  CIS2.VW_CL_CUATM CCU  ON (CU.FULL_CODE LIKE '%'||CCU.CODUL||';%')
--------------------------------------------------------------------------------------------
INNER JOIN  (
            SELECT  
        
            RINDOUT  FULL_CODE_ORDINE,
            DENUMIRE,
            STATUT CODUL,
            ORDINE,
           
            RIND  FULL_CODE
            
            FROM CIS2.MD_RIND_OUT

            WHERE 
            ID_MDTABLE = 8701
     
     ) CD ON (CD.CODUL = R.NTII) 

    INNER JOIN (
     
     SELECT  
          
            RINDOUT  FULL_CODE_ORDINE,
            DENUMIRE,
            STATUT CODUL,
            ORDINE,
           
            RIND  FULL_CODE
            
            FROM CIS2.MD_RIND_OUT

            WHERE 
            ID_MDTABLE = 8701
     
     ) CDD ON (CD.FULL_CODE LIKE '%'||CDD.CODUL||';%') 
---------------------------------------------------------------------------------------------


     
 WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND
  D.FORM IN (49)                 AND 
  D.CAPITOL IN (1049) 
  AND CCU.PRGS IN ('2')
  AND CCU.CODUL NOT IN ('0000000','1111111','2222222','3333333')
  AND CDD.CODUL IN ('1')
  GROUP BY 
  D.CUIIO,
  CCU.CODUL,--
  CCU.DENUMIRE, 
  CCU.FULL_CODE,

  CDD.CODUL,
  CDD.DENUMIRE, 
  CDD.FULL_CODE_ORDINE,
  CC.CODUL,
  CC.DENUMIRE,
  CC.FULL_CODE,
  CC.ORDINE
 
  )
  
  ORDER BY 
  CUIIO,
  ORDINE, 
  FULL_CODE,
  CDD_FULL_CODE_ORDINE,
  CUATM_FULL_CODE
  ))
  
  
 ORDER BY 
   ORDINE,
   ORDINE_INTERN,
   CUATM_FULL_CODE ) B )
  