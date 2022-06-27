
SELECT 
TO_NUMBER(CR.NR_ROW) AS ORDINE,
CR.NUME_ROW AS NR_ROW,

SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL1 ELSE NULL END ) AS IND_TS_COL1,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL2 ELSE NULL END ) AS IND_TS_COL2,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL3 ELSE NULL END ) AS IND_TS_COL3,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL4 ELSE NULL END ) AS SERV_TS_COL4,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL5 ELSE NULL END ) AS SERV_TS_COL5,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL6 ELSE NULL END ) AS SERV_TS_COL6,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL7 ELSE NULL END ) AS MUNCA_1_COL7,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL8 ELSE NULL END ) AS MUNCA_1_COL8,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL9 ELSE NULL END ) AS MUNCA_1_COL9,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL10 ELSE NULL END ) AS CONS_TS_COL10,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL11 ELSE NULL END ) AS CONS_TS_COL11,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL12 ELSE NULL END ) AS CONS_TS_COL12,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL13 ELSE NULL END ) AS MUNCA_2_COL13,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL14 ELSE NULL END ) AS MUNCA_2_COL14,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL15 ELSE NULL END ) AS MUNCA_2_COL15,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.auto_1_COL16 ELSE NULL END ) AS auto_1_COL16,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.auto_1_COL17 ELSE NULL END ) AS auto_1_COL17,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.auto_1_COL18 ELSE NULL END ) AS auto_1_COL18,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.CIS_5_CI__COL19 ELSE NULL END ) AS CIS_5_CI__COL19,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.CIS_5_CI__COL20 ELSE NULL END ) AS CIS_5_CI__COL20,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.CIS_5_CI__COL21 ELSE NULL END ) AS CIS_5_CI__COL21,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.TRIM_2_INV___COL22 ELSE NULL END ) AS TRIM_2_INV___COL22,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.TRIM_2_INV___COL23 ELSE NULL END ) AS TRIM_2_INV___COL23,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.TRIM_2_INV___COL24 ELSE NULL END ) AS TRIM_2_INV___COL24,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.TRIM_65_auto_COL25 ELSE NULL END ) AS TRIM_65_auto_COL25,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.TRIM_65_auto_COL26 ELSE NULL END ) AS TRIM_65_auto_COL26,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.TRIM_65_auto_COL27 ELSE NULL END ) AS TRIM_65_auto_COL27,

SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.TRIM_1_turism_COL28 ELSE NULL END ) AS TRIM_1_turism_COL28,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.TRIM_1_turism_COL29 ELSE NULL END ) AS TRIM_1_turism_COL29,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.TRIM_1_turism_COL30 ELSE NULL END ) AS TRIM_1_turism_COL30,

SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.TRIM_1_INVEST_COL31 ELSE NULL END ) AS TRIM_1_INVEST_COL31,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.TRIM_1_INVEST_COL32 ELSE NULL END ) AS TRIM_1_INVEST_COL32,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.TRIM_1_INVEST_COL33 ELSE NULL END ) AS TRIM_1_INVEST_COL33,


SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.TRIM_5_CON_COL34 ELSE NULL END ) AS TRIM_5_CON_COL34,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.TRIM_5_CON_COL35 ELSE NULL END ) AS TRIM_5_CON_COL35,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.TRIM_5_CON_COL36 ELSE NULL END ) AS TRIM_5_CON_COL36,


SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.TRIM_1_B_SC_COL37 ELSE NULL END ) AS TRIM_1_B_SC_COL37,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.TRIM_1_B_SC_COL38 ELSE NULL END ) AS TRIM_1_B_SC_COL38,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.TRIM_1_B_SC_COL39 ELSE NULL END ) AS TRIM_1_B_SC_COL39

FROM 

(
--1--
SELECT 
C.CODUL,
C.FULL_CODE,
COUNT (DISTINCT CASE WHEN FC.FORM  = 3 THEN  FC.CUIIO END ) AS COL1,
NULL AS COL2,
NULL AS COL3,
COUNT (DISTINCT CASE WHEN FC.FORM  = 4 THEN  FC.CUIIO END ) AS COL4,
NULL AS COL5,
NULL AS COL6,
NULL AS COL7,
NULL AS COL8,
NULL AS COL9,
NULL AS COL10,
NULL AS COL11,
NULL AS COL12,
NULL AS COL13,
NULL AS COL14,
NULL AS COL15,
NULL AS auto_1_COL16,
NULL AS auto_1_COL17,
NULL AS auto_1_COL18,
NULL AS CIS_5_CI__COL19,
NULL AS CIS_5_CI__COL20,
NULL AS CIS_5_CI__COL21,
NULL AS TRIM_2_INV___COL22,
NULL AS TRIM_2_INV___COL23,
NULL AS TRIM_2_INV___COL24,

NULL AS  TRIM_65_auto_COL25,
NULL AS  TRIM_65_auto_COL26,
NULL AS  TRIM_65_auto_COL27,

NULL AS TRIM_1_turism_COL28,
NULL AS TRIM_1_turism_COL29,
NULL AS TRIM_1_turism_COL30,

NULL AS TRIM_1_INVEST_COL31,
NULL AS TRIM_1_INVEST_COL32,
NULL AS TRIM_1_INVEST_COL33,


NULL AS TRIM_5_CON_COL34,
NULL AS TRIM_5_CON_COL35,
NULL AS TRIM_5_CON_COL36,


NULL AS TRIM_1_B_SC_COL37,
NULL AS TRIM_1_B_SC_COL38,
NULL AS TRIM_1_B_SC_COL39

FROM  


(
SELECT     

           R.CUIIO,
           R. CUIIO_VERS,
           FC.FORM,
          
           R.CUATM
           
      FROM (SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS.FORM_CUIIO
                                  WHERE FORM IN (3,4) AND CUIIO_VERS <= :pPERIOADA 
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (3,4) AND FC.STATUT <> '3') FC
           INNER JOIN CIS.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
               
               ) FC 
          
               
                 INNER JOIN CIS.VW_CL_CUATM C   ON C.CODUL = FC.CUATM
              
               GROUP BY 
              C.CODUL,
              C.FULL_CODE
              
              
              
              
              UNION 
--2              
SELECT 
C.CODUL,
C.FULL_CODE,
NULL AS COL1,
COUNT (DISTINCT CASE WHEN D.FORM  = 3 THEN  D.CUIIO END ) AS COL2,
NULL AS COL3,
NULL AS COL4,
COUNT (DISTINCT CASE WHEN D.FORM  = 4 THEN  D.CUIIO END ) AS COL5,
NULL AS COL6,
NULL AS COL7,
NULL AS COL8,
NULL AS COL9,
NULL AS COL10,
NULL AS COL11,
NULL AS COL12,
NULL AS COL13,
NULL AS COL14,
NULL AS COL15,
NULL AS auto_1_COL16,
NULL AS auto_1_COL17,
NULL AS auto_1_COL18,
NULL AS CIS_5_CI__COL19,
NULL AS CIS_5_CI__COL20,
NULL AS CIS_5_CI__COL21,
NULL AS TRIM_2_INV___COL22,
NULL AS TRIM_2_INV___COL23,
NULL AS TRIM_2_INV___COL24,
NULL AS  TRIM_65_auto_COL25,
NULL AS  TRIM_65_auto_COL26,
NULL AS  TRIM_65_auto_COL27,

NULL AS TRIM_1_turism_COL28,
NULL AS TRIM_1_turism_COL29,
NULL AS TRIM_1_turism_COL30,

NULL AS TRIM_1_INVEST_COL31,
NULL AS TRIM_1_INVEST_COL32,
NULL AS TRIM_1_INVEST_COL33,

NULL AS TRIM_5_CON_COL34,
NULL AS TRIM_5_CON_COL35,
NULL AS TRIM_5_CON_COL36,

NULL AS TRIM_1_B_SC_COL37,
NULL AS TRIM_1_B_SC_COL38,
NULL AS TRIM_1_B_SC_COL39


FROM
(
SELECT
DISTINCT D.CUIIO,
D.CUIIO_VERS,
D.CUATM,

D.FORM


    FROM CIS.VW_DATA_ALL D
        INNER JOIN CIS2.VW_CL_CUATM C ON D.CUATM = C.CODUL 
    
    WHERE 
    
    D.PERIOADA = :pPERIOADA 
    AND 
    
    
    D.FORM IN  (3,4)
    ) D
    
    
      INNER JOIN CIS.VW_CL_CUATM C   ON C.CODUL = D.CUATM
GROUP BY 

C.CODUL,
C.FULL_CODE
        

UNION 
--3                
SELECT 
C.CODUL,
C.FULL_CODE,
NULL AS COL1,
NULL AS COL2,
COUNT (DISTINCT CASE WHEN D.FORM  = 3 THEN  D.CUIIO END ) AS COL3,
NULL AS COL4,
NULL AS COL5,
COUNT (DISTINCT CASE WHEN D.FORM  = 4 THEN  D.CUIIO END ) AS COL6,
NULL AS COL7,
NULL AS COL8,
NULL AS COL9,
NULL AS COL10,
NULL AS COL11,
NULL AS COL12,
NULL AS COL13,
NULL AS COL14,
NULL AS COL15,
NULL AS auto_1_COL16,
NULL AS auto_1_COL17,
NULL AS auto_1_COL18,
NULL AS CIS_5_CI__COL19,
NULL AS CIS_5_CI__COL20,
NULL AS CIS_5_CI__COL21,
NULL AS TRIM_2_INV___COL22,
NULL AS TRIM_2_INV___COL23,
NULL AS TRIM_2_INV___COL24,
NULL AS  TRIM_65_auto_COL25,
NULL AS  TRIM_65_auto_COL26,
NULL AS  TRIM_65_auto_COL27,

NULL AS TRIM_1_turism_COL28,
NULL AS TRIM_1_turism_COL29,
NULL AS TRIM_1_turism_COL30,

NULL AS TRIM_1_INVEST_COL31,
NULL AS TRIM_1_INVEST_COL32,
NULL AS TRIM_1_INVEST_COL33,

NULL AS TRIM_5_CON_COL34,
NULL AS TRIM_5_CON_COL35,
NULL AS TRIM_5_CON_COL36,

NULL AS TRIM_1_B_SC_COL37,
NULL AS TRIM_1_B_SC_COL38,
NULL AS TRIM_1_B_SC_COL39



FROM
(
SELECT
DISTINCT D.CUIIO,
D.CUIIO_VERS,
D.CUATM,

D.FORM


    FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
        INNER JOIN CIS2.VW_CL_CUATM C ON D.CUATM = C.CODUL 
    
    WHERE 
    
    D.PERIOADA = :pPERIOADA 
    AND D.FORM IN  (3,4)
    ) D
    
    
      INNER JOIN CIS.VW_CL_CUATM C   ON C.CODUL = D.CUATM
GROUP BY 

C.CODUL,
C.FULL_CODE
        
--End 3 

       UNION 
--Start 4       
       SELECT 
C.CODUL,
C.FULL_CODE,

NULL AS COL1,
NULL AS COL2,
NULL AS COL3,
NULL AS COL4,
NULL AS COL5,
NULL AS COL6,

COUNT (DISTINCT CASE WHEN FC.FORM  = 5 THEN  FC.CUIIO END ) AS COL7,
NULL AS COL8,
NULL AS COL9,
COUNT (DISTINCT CASE WHEN FC.FORM  = 2 THEN  FC.CUIIO END ) AS COL10,
NULL AS COL11,
NULL AS COL12,
NULL AS COL13,
NULL AS COL14,
NULL AS COL15,
NULL AS auto_1_COL16,
NULL AS auto_1_COL17,
NULL AS auto_1_COL18,
NULL AS CIS_5_CI__COL19,
NULL AS CIS_5_CI__COL20,
NULL AS CIS_5_CI__COL21,
NULL AS TRIM_2_INV___COL22,
NULL AS TRIM_2_INV___COL23,
NULL AS TRIM_2_INV___COL24,
NULL AS  TRIM_65_auto_COL25,
NULL AS  TRIM_65_auto_COL26,
NULL AS  TRIM_65_auto_COL27,

NULL AS TRIM_1_turism_COL28,
NULL AS TRIM_1_turism_COL29,
NULL AS TRIM_1_turism_COL30,

NULL AS TRIM_1_INVEST_COL31,
NULL AS TRIM_1_INVEST_COL32,
NULL AS TRIM_1_INVEST_COL33,

NULL AS TRIM_5_CON_COL34,
NULL AS TRIM_5_CON_COL35,
NULL AS TRIM_5_CON_COL36,

NULL AS TRIM_1_B_SC_COL37,
NULL AS TRIM_1_B_SC_COL38,
NULL AS TRIM_1_B_SC_COL39




FROM 


(
SELECT     

           R.CUIIO,
           R. CUIIO_VERS,
           FC.FORM,
          
           R.CUATM
           
      FROM (SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS.FORM_CUIIO
                                  WHERE FORM IN (2,5) AND CUIIO_VERS <= :pPERIOADA 
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (5,2) AND FC.STATUT <> '3') FC
           INNER JOIN CIS.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
               
               ) FC 
          
               
                 INNER JOIN CIS.VW_CL_CUATM C   ON C.CODUL = FC.CUATM
              
               GROUP BY 
              C.CODUL,
              C.FULL_CODE         
    
   --End 4           
              
   
   UNION 
   
   --Start 5
   
   SELECT 
C.CODUL,
C.FULL_CODE,
NULL AS COL1,
NULL AS COL2,
NULL AS COL3,
NULL AS COL4,
NULL AS COL5,
NULL AS COL6,
NULL AS COL7,
COUNT (DISTINCT CASE WHEN D.FORM  = 5 THEN  D.CUIIO END ) AS COL8,
NULL AS COL9,
NULL AS COL10,
COUNT (DISTINCT CASE WHEN D.FORM  = 2 THEN  D.CUIIO END ) AS COL11,
NULL AS COL12,
NULL AS COL13,
NULL AS COL14,
NULL AS COL15,
NULL AS auto_1_COL16,
NULL AS auto_1_COL17,
NULL AS auto_1_COL18,
NULL AS CIS_5_CI__COL19,
NULL AS CIS_5_CI__COL20,
NULL AS CIS_5_CI__COL21,
NULL AS TRIM_2_INV___COL22,
NULL AS TRIM_2_INV___COL23,
NULL AS TRIM_2_INV___COL24,
NULL AS  TRIM_65_auto_COL25,
NULL AS  TRIM_65_auto_COL26,
NULL AS  TRIM_65_auto_COL27,

NULL AS TRIM_1_turism_COL28,
NULL AS TRIM_1_turism_COL29,
NULL AS TRIM_1_turism_COL30,

NULL AS TRIM_1_INVEST_COL31,
NULL AS TRIM_1_INVEST_COL32,
NULL AS TRIM_1_INVEST_COL33,

NULL AS TRIM_5_CON_COL34,
NULL AS TRIM_5_CON_COL35,
NULL AS TRIM_5_CON_COL36,


NULL AS TRIM_1_B_SC_COL37,
NULL AS TRIM_1_B_SC_COL38,
NULL AS TRIM_1_B_SC_COL39

FROM
(
SELECT
DISTINCT D.CUIIO,
D.CUIIO_VERS,
D.CUATM,

D.FORM


    FROM CIS.VW_DATA_ALL D
        INNER JOIN CIS2.VW_CL_CUATM C ON D.CUATM = C.CODUL 
        
        INNER JOIN (
        
        SELECT P.PERIOADA, P.TIP_PERIOADA, P.ANUL
  FROM CIS.MD_PERIOADA  P
       INNER JOIN
       (SELECT P.PERIOADA,
               P.TIP_PERIOADA,
               P.ANUL,
               (CASE
                    WHEN P.NUM = 1 THEN 3
                    WHEN P.NUM = 2 THEN 3
                    WHEN P.NUM = 4 THEN 3
                    WHEN P.NUM = 5 THEN 3
                    WHEN P.NUM = 7 THEN 6
                    WHEN P.NUM = 8 THEN 6
                    WHEN P.NUM = 10 THEN 9
                    WHEN P.NUM = 11 THEN 9
                    ELSE P.NUM
                END)
                   NUM
          FROM CIS.MD_PERIOADA P
         WHERE P.PERIOADA = :pPERIOADA) PP
           ON     P.NUM = PP.NUM
              AND P.TIP_PERIOADA = PP.TIP_PERIOADA
              AND P.ANUL = PP.ANUL
        ) MP ON  MP.PERIOADA = D.PERIOADA 
    
    WHERE 
    
        D.PERIOADA = MP.PERIOADA
    AND 
    
     D.FORM IN  (5,2)
    ) D
    
    
      INNER JOIN CIS.VW_CL_CUATM C   ON C.CODUL = D.CUATM
GROUP BY 

C.CODUL,
C.FULL_CODE
   
   --End 5
              
   UNION 
   --Start  6
         
   
       SELECT 
C.CODUL,
C.FULL_CODE,
NULL AS COL1,
NULL AS COL2,
NULL AS COL3,
NULL AS COL4,
NULL AS COL5,
NULL AS COL6,
NULL AS COL7,
NULL AS COL8,
COUNT (DISTINCT CASE WHEN D.FORM  = 5 THEN  D.CUIIO END ) AS COL9,
NULL AS COL10,
NULL AS COL11,
COUNT (DISTINCT CASE WHEN D.FORM  = 2 THEN  D.CUIIO END ) AS COL12,
NULL AS COL13,
NULL AS COL14,
NULL AS COL15,
NULL AS auto_1_COL16,
NULL AS auto_1_COL17,
NULL AS auto_1_COL18,
NULL AS CIS_5_CI__COL19,
NULL AS CIS_5_CI__COL20,
NULL AS CIS_5_CI__COL21,
NULL AS TRIM_2_INV___COL22,
NULL AS TRIM_2_INV___COL23,
NULL AS TRIM_2_INV___COL24,
NULL AS  TRIM_65_auto_COL25,
NULL AS  TRIM_65_auto_COL26,
NULL AS  TRIM_65_auto_COL27,

NULL AS TRIM_1_turism_COL28,
NULL AS TRIM_1_turism_COL29,
NULL AS TRIM_1_turism_COL30,

NULL AS TRIM_1_INVEST_COL31,
NULL AS TRIM_1_INVEST_COL32,
NULL AS TRIM_1_INVEST_COL33,

NULL AS TRIM_5_CON_COL34,
NULL AS TRIM_5_CON_COL35,
NULL AS TRIM_5_CON_COL36,

NULL AS TRIM_1_B_SC_COL37,
NULL AS TRIM_1_B_SC_COL38,
NULL AS TRIM_1_B_SC_COL39


FROM
(
SELECT
DISTINCT D.CUIIO,
D.CUIIO_VERS,
D.CUATM,

D.FORM


    FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
        INNER JOIN CIS2.VW_CL_CUATM C ON D.CUATM = C.CODUL 
        
        INNER JOIN (
        
        SELECT P.PERIOADA, P.TIP_PERIOADA, P.ANUL
  FROM CIS.MD_PERIOADA  P
       INNER JOIN
       (SELECT P.PERIOADA,
               P.TIP_PERIOADA,
               P.ANUL,
               (CASE
                    WHEN P.NUM = 1 THEN 3
                    WHEN P.NUM = 2 THEN 3
                    WHEN P.NUM = 4 THEN 3
                    WHEN P.NUM = 5 THEN 3
                    WHEN P.NUM = 7 THEN 6
                    WHEN P.NUM = 8 THEN 6
                    WHEN P.NUM = 10 THEN 9
                    WHEN P.NUM = 11 THEN 9
                    ELSE P.NUM
                END)
                   NUM
          FROM CIS.MD_PERIOADA P
         WHERE P.PERIOADA = :pPERIOADA) PP
           ON     P.NUM = PP.NUM
              AND P.TIP_PERIOADA = PP.TIP_PERIOADA
              AND P.ANUL = PP.ANUL
        ) MP ON  MP.PERIOADA = D.PERIOADA 
    
    WHERE 
    
        D.PERIOADA = MP.PERIOADA
    AND 
    
     D.FORM IN  (5,2)
    ) D
    
    
      INNER JOIN CIS.VW_CL_CUATM C   ON C.CODUL = D.CUATM
GROUP BY 

C.CODUL,
C.FULL_CODE 
              
        
UNION 

SELECT 
C.CODUL,
C.FULL_CODE,
NULL AS COL1,
NULL AS COL2,
NULL AS COL3,
NULL AS COL4,
NULL AS COL5,
NULL AS COL6,
NULL AS COL7,
NULL AS COL8,
NULL AS COL9,
NULL AS COL10,
NULL AS COL11,
NULL AS COL12,
COUNT (DISTINCT CASE WHEN FC.FORM  = 7 THEN  FC.CUIIO END ) AS COL13,
NULL AS COL14,
NULL AS COL15,
NULL AS auto_1_COL16,
NULL AS auto_1_COL17,
NULL AS auto_1_COL18,
NULL AS CIS_5_CI__COL19,
NULL AS CIS_5_CI__COL20,
NULL AS CIS_5_CI__COL21,
NULL AS TRIM_2_INV___COL22,
NULL AS TRIM_2_INV___COL23,
NULL AS TRIM_2_INV___COL24,
NULL AS  TRIM_65_auto_COL25,
NULL AS  TRIM_65_auto_COL26,
NULL AS  TRIM_65_auto_COL27,

NULL AS TRIM_1_turism_COL28,
NULL AS TRIM_1_turism_COL29,
NULL AS TRIM_1_turism_COL30,

NULL AS TRIM_1_INVEST_COL31,
NULL AS TRIM_1_INVEST_COL32,
NULL AS TRIM_1_INVEST_COL33,

NULL AS TRIM_5_CON_COL34,
NULL AS TRIM_5_CON_COL35,
NULL AS TRIM_5_CON_COL36,

NULL AS TRIM_1_B_SC_COL37,
NULL AS TRIM_1_B_SC_COL38,
NULL AS TRIM_1_B_SC_COL39
FROM 


(
SELECT     

           R.CUIIO,
           R. CUIIO_VERS,
           FC.FORM,
          
           R.CUATM
           
      FROM (SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS.FORM_CUIIO  FC
                         
              
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS.FORM_CUIIO
                                  WHERE FORM IN (7) AND CUIIO_VERS <= (CASE 
                                                                                     
                                  
                                                                                     WHEN TO_NUMBER(:pPERIOADA)BETWEEN 368 AND 390 THEN 368      
                                                                                     WHEN TO_NUMBER(:pPERIOADA)BETWEEN 380 AND 391 THEN 380     
                                                                                     WHEN TO_NUMBER(:pPERIOADA)BETWEEN 392 AND 403 THEN 392 
                                                                                     WHEN TO_NUMBER(:pPERIOADA)BETWEEN 404 AND 415 THEN 404 
                                                                                     WHEN TO_NUMBER(:pPERIOADA)BETWEEN 416 AND 427 THEN 416  
                                                                                     WHEN TO_NUMBER(:pPERIOADA)BETWEEN 428 AND 439 THEN 428                        
                                                                                     WHEN TO_NUMBER(:pPERIOADA)BETWEEN 440 AND 451 THEN 440 
                                                                                     WHEN TO_NUMBER(:pPERIOADA)BETWEEN 452 AND 463 THEN 452 
                                                                                     WHEN TO_NUMBER(:pPERIOADA)BETWEEN 464 AND 473 THEN 464 
                                                                                     ELSE TO_NUMBER(:pPERIOADA) END
                                                                                     
                                                                                     
                                                                                   ) 
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (7) AND FC.STATUT <> '3') FC
           INNER JOIN CIS.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
               
               ) FC 
          
               
                 INNER JOIN CIS.VW_CL_CUATM C   ON C.CODUL = FC.CUATM
              
               GROUP BY 
              C.CODUL,
              C.FULL_CODE


UNION 


  SELECT C.CODUL,
         C.FULL_CODE,
         NULL                                                       AS COL1,
         NULL                                                       AS COL2,
         NULL                                                       AS COL3,
         NULL                                                       AS COL4,
         NULL                                                       AS COL5,
         NULL                                                       AS COL6,
         NULL                                                       AS COL7,
         NULL                                                       AS COL8,
         NULL                                                       AS COL9,
         NULL                                                       AS COL10,
         NULL                                                       AS COL11,
         NULL                                                       AS COL12,
         NULL                                                       AS COL13,
         COUNT (DISTINCT CASE WHEN D.FORM = 7 THEN D.CUIIO END)     AS COL14,
         NULL                                                       AS COL15,
NULL AS auto_1_COL16,
NULL AS auto_1_COL17,
NULL AS auto_1_COL18,
NULL AS CIS_5_CI__COL19,
NULL AS CIS_5_CI__COL20,
NULL AS CIS_5_CI__COL21,
NULL AS TRIM_2_INV___COL22,
NULL AS TRIM_2_INV___COL23,
NULL AS TRIM_2_INV___COL24,
NULL AS  TRIM_65_auto_COL25,
NULL AS  TRIM_65_auto_COL26,
NULL AS  TRIM_65_auto_COL27,

NULL AS TRIM_1_turism_COL28,
NULL AS TRIM_1_turism_COL29,
NULL AS TRIM_1_turism_COL30,

NULL AS TRIM_1_INVEST_COL31,
NULL AS TRIM_1_INVEST_COL32,
NULL AS TRIM_1_INVEST_COL33,

NULL AS TRIM_5_CON_COL34,
NULL AS TRIM_5_CON_COL35,
NULL AS TRIM_5_CON_COL36,

NULL AS TRIM_1_B_SC_COL37,
NULL AS TRIM_1_B_SC_COL38,
NULL AS TRIM_1_B_SC_COL39

    FROM (SELECT DISTINCT D.CUIIO,
                          D.CUIIO_VERS,
                          D.CUATM,
                          D.FORM
            FROM CIS.VW_DATA_ALL D
                 INNER JOIN CIS.VW_CL_CUATM C ON D.CUATM = C.CODUL
                 INNER JOIN
                 (SELECT P.PERIOADA, P.TIP_PERIOADA, P.ANUL
                    FROM (SELECT CASE
                                     WHEN P.NUM = 8 THEN P.PERIOADA - 11
                                     WHEN P.NUM = 7 THEN P.PERIOADA - 10
                                     WHEN P.NUM = 6 THEN P.PERIOADA - 9
                                     WHEN P.NUM = 5 THEN P.PERIOADA - 8
                                     WHEN P.NUM = 4 THEN P.PERIOADA - 7
                                     WHEN P.NUM = 3 THEN P.PERIOADA - 6
                                     WHEN P.NUM = 2 THEN P.PERIOADA - 5
                                     WHEN P.NUM = 1 THEN P.PERIOADA - 4
                                     ELSE P.PERIOADA
                                 END
                                     PERIOADA,
                                 P.NUM,
                                 P.TIP_PERIOADA,
                                 P.ANUL
                            FROM CIS.MD_PERIOADA P
                                 INNER JOIN
                                 (SELECT P.PERIOADA,
                                         P.TIP_PERIOADA,
                                         P.ANUL,
                                         (CASE
                                              WHEN P.NUM = 10 THEN 9
                                              WHEN P.NUM = 11 THEN 9
                                              WHEN P.NUM = 12 THEN 9
                                              ELSE P.NUM
                                          END)
                                             NUM
                                    FROM CIS.MD_PERIOADA P
                                   WHERE P.PERIOADA = :pPERIOADA) PP
                                     ON     P.NUM = PP.NUM
                                        AND P.TIP_PERIOADA = PP.TIP_PERIOADA
                                        AND P.ANUL = PP.ANUL) P) MP
                     ON MP.PERIOADA = D.PERIOADA
           WHERE D.PERIOADA = MP.PERIOADA AND D.FORM IN (7)) D
         INNER JOIN CIS.VW_CL_CUATM C ON C.CODUL = D.CUATM
GROUP BY C.CODUL, C.FULL_CODE
      
              
UNION 


SELECT C.CODUL,
         C.FULL_CODE,
         NULL                                                       AS COL1,
         NULL                                                       AS COL2,
         NULL                                                       AS COL3,
         NULL                                                       AS COL4,
         NULL                                                       AS COL5,
         NULL                                                       AS COL6,
         NULL                                                       AS COL7,
         NULL                                                       AS COL8,
         NULL                                                       AS COL9,
         NULL                                                       AS COL10,
         NULL                                                       AS COL11,
         NULL                                                       AS COL12,
         NULL                                                       AS COL13,
         NULL                                                       AS COL14,
         COUNT (DISTINCT CASE WHEN D.FORM = 7 THEN D.CUIIO END)     AS COL15,
NULL AS auto_1_COL16,
NULL AS auto_1_COL17,
NULL AS auto_1_COL18,

NULL AS CIS_5_CI__COL19,
NULL AS CIS_5_CI__COL20,
NULL AS CIS_5_CI__COL21,
NULL AS TRIM_2_INV___COL22,
NULL AS TRIM_2_INV___COL23,
NULL AS TRIM_2_INV___COL24,
NULL AS  TRIM_65_auto_COL25,
NULL AS  TRIM_65_auto_COL26,
NULL AS  TRIM_65_auto_COL27,

NULL AS TRIM_1_turism_COL28,
NULL AS TRIM_1_turism_COL29,
NULL AS TRIM_1_turism_COL30,

NULL AS TRIM_1_INVEST_COL31,
NULL AS TRIM_1_INVEST_COL32,
NULL AS TRIM_1_INVEST_COL33,

NULL AS TRIM_5_CON_COL34,
NULL AS TRIM_5_CON_COL35,
NULL AS TRIM_5_CON_COL36,


NULL AS TRIM_1_B_SC_COL37,
NULL AS TRIM_1_B_SC_COL38,
NULL AS TRIM_1_B_SC_COL39


    FROM (SELECT DISTINCT D.CUIIO,
                          D.CUIIO_VERS,
                          D.CUATM,
                          D.FORM
            FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
                 INNER JOIN CIS.VW_CL_CUATM C ON D.CUATM = C.CODUL
                 INNER JOIN
                 (SELECT P.PERIOADA, P.TIP_PERIOADA, P.ANUL
                    FROM (SELECT CASE
                                     WHEN P.NUM = 8 THEN P.PERIOADA - 11
                                     WHEN P.NUM = 7 THEN P.PERIOADA - 10
                                     WHEN P.NUM = 6 THEN P.PERIOADA - 9
                                     WHEN P.NUM = 5 THEN P.PERIOADA - 8
                                     WHEN P.NUM = 4 THEN P.PERIOADA - 7
                                     WHEN P.NUM = 3 THEN P.PERIOADA - 6
                                     WHEN P.NUM = 2 THEN P.PERIOADA - 5
                                     WHEN P.NUM = 1 THEN P.PERIOADA - 4
                                     ELSE P.PERIOADA
                                 END
                                     PERIOADA,
                                 P.NUM,
                                 P.TIP_PERIOADA,
                                 P.ANUL
                            FROM CIS.MD_PERIOADA P
                                 INNER JOIN
                                 (SELECT P.PERIOADA,
                                         P.TIP_PERIOADA,
                                         P.ANUL,
                                         (CASE
                                              WHEN P.NUM = 10 THEN 9
                                              WHEN P.NUM = 11 THEN 9
                                              WHEN P.NUM = 12 THEN 9
                                              ELSE P.NUM
                                          END)
                                             NUM
                                    FROM CIS.MD_PERIOADA P
                                   WHERE P.PERIOADA = :pPERIOADA) PP
                                     ON     P.NUM = PP.NUM
                                        AND P.TIP_PERIOADA = PP.TIP_PERIOADA
                                        AND P.ANUL = PP.ANUL) P) MP
                     ON MP.PERIOADA = D.PERIOADA
           WHERE D.PERIOADA = MP.PERIOADA AND D.FORM IN (7)
             AND D.ID_SCHEMA = 1   
           ) D
         INNER JOIN CIS.VW_CL_CUATM C ON C.CODUL = D.CUATM
GROUP BY C.CODUL, C.FULL_CODE
--START _1_AUTO
UNION 
SELECT 
C.CODUL,
C.FULL_CODE,
NULL AS COL1,
NULL AS COL2,
NULL AS COL3,
NULL AS COL4,
NULL AS COL5,
NULL AS COL6,
NULL AS COL7,
NULL AS COL8,
NULL AS COL9,
NULL AS COL10,
NULL AS COL11,
NULL AS COL12,
NULL AS COL13,
NULL AS COL14,
NULL AS COL15,
COUNT (DISTINCT CASE WHEN FC.FORM  = 7 THEN  FC.CUIIO END ) AS auto_1_COL16,
NULL  AS auto_1__COL17,
NULL  AS auto_1__COL18,

NULL AS CIS_5_CI__COL19,
NULL AS CIS_5_CI__COL20,
NULL AS CIS_5_CI__COL21,
NULL AS TRIM_2_INV___COL22,
NULL AS TRIM_2_INV___COL23,
NULL AS TRIM_2_INV___COL24,
NULL AS  TRIM_65_auto_COL25,
NULL AS  TRIM_65_auto_COL26,
NULL AS  TRIM_65_auto_COL27,

NULL AS TRIM_1_turism_COL28,
NULL AS TRIM_1_turism_COL29,
NULL AS TRIM_1_turism_COL30,

NULL AS TRIM_1_INVEST_COL31,
NULL AS TRIM_1_INVEST_COL32,
NULL AS TRIM_1_INVEST_COL33,

NULL AS TRIM_5_CON_COL34,
NULL AS TRIM_5_CON_COL35,
NULL AS TRIM_5_CON_COL36,

NULL AS TRIM_1_B_SC_COL37,
NULL AS TRIM_1_B_SC_COL38,
NULL AS TRIM_1_B_SC_COL39
FROM 


(
SELECT     

           R.CUIIO,
           R. CUIIO_VERS,
           FC.FORM,
          
           R.CUATM
           
      FROM (SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                         
              
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (7) AND CUIIO_VERS <= 443 
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (7) AND FC.STATUT <> '3') FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
               
               ) FC 
          
               
                 INNER JOIN CIS2.VW_CL_CUATM C   ON C.CODUL = FC.CUATM
              
               GROUP BY 
              C.CODUL,
              C.FULL_CODE
              
              UNION 
              
  SELECT C.CODUL,
         C.FULL_CODE,
         NULL                                                       AS COL1,
         NULL                                                       AS COL2,
         NULL                                                       AS COL3,
         NULL                                                       AS COL4,
         NULL                                                       AS COL5,
         NULL                                                       AS COL6,
         NULL                                                       AS COL7,
         NULL                                                       AS COL8,
         NULL                                                       AS COL9,
         NULL                                                       AS COL10,
         NULL                                                       AS COL11,
         NULL                                                       AS COL12,
         NULL                                                       AS COL13,
         NULL                                                       AS COL14,
         NULL                                                       AS COL15,
         NULL                                                       AS auto_1__COL16,
         COUNT (DISTINCT CASE WHEN D.FORM = 7 THEN D.CUIIO END)     AS auto_1__COL17,
         NULL                                                       AS auto_1__COL18,
         
         NULL AS CIS_5_CI__COL19,
NULL AS CIS_5_CI__COL20,
NULL AS CIS_5_CI__COL21,
NULL AS TRIM_2_INV___COL22,
NULL AS TRIM_2_INV___COL23,
NULL AS TRIM_2_INV___COL24,
NULL AS  TRIM_65_auto_COL25,
NULL AS  TRIM_65_auto_COL26,
NULL AS  TRIM_65_auto_COL27,

NULL AS TRIM_1_turism_COL28,
NULL AS TRIM_1_turism_COL29,
NULL AS TRIM_1_turism_COL30,

NULL AS TRIM_1_INVEST_COL31,
NULL AS TRIM_1_INVEST_COL32,
NULL AS TRIM_1_INVEST_COL33,

NULL AS TRIM_5_CON_COL34,
NULL AS TRIM_5_CON_COL35,
NULL AS TRIM_5_CON_COL36,

NULL AS TRIM_1_B_SC_COL37,
NULL AS TRIM_1_B_SC_COL38,
NULL AS TRIM_1_B_SC_COL39

         
         
         
    FROM (SELECT DISTINCT D.CUIIO,
                          D.CUIIO_VERS,
                          D.CUATM,
                          D.FORM
            FROM CIS2.VW_DATA_ALL D
                 INNER JOIN CIS2.VW_CL_CUATM C ON D.CUATM = C.CODUL
                 
           WHERE D.PERIOADA = 443 AND D.FORM IN (7)) D
         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
GROUP BY C.CODUL, C.FULL_CODE

UNION 


  SELECT C.CODUL,
         C.FULL_CODE,
         NULL                                                       AS COL1,
         NULL                                                       AS COL2,
         NULL                                                       AS COL3,
         NULL                                                       AS COL4,
         NULL                                                       AS COL5,
         NULL                                                       AS COL6,
         NULL                                                       AS COL7,
         NULL                                                       AS COL8,
         NULL                                                       AS COL9,
         NULL                                                       AS COL10,
         NULL                                                       AS COL11,
         NULL                                                       AS COL12,
         NULL                                                       AS COL13,
         NULL                                                       AS COL14,
         NULL                                                       AS COL15,
         NULL                                                       AS auto_1__COL16,
         NULL                                                       AS auto_1__COL17,
         COUNT (DISTINCT CASE WHEN D.FORM = 7 THEN D.CUIIO END)      AS auto_1__COL18,
         
NULL AS CIS_5_CI__COL19,
NULL AS CIS_5_CI__COL20,
NULL AS CIS_5_CI__COL21,
NULL AS TRIM_2_INV___COL22,
NULL AS TRIM_2_INV___COL23,
NULL AS TRIM_2_INV___COL24,
NULL AS  TRIM_65_auto_COL25,
NULL AS  TRIM_65_auto_COL26,
NULL AS  TRIM_65_auto_COL27,

NULL AS TRIM_1_turism_COL28,
NULL AS TRIM_1_turism_COL29,
NULL AS TRIM_1_turism_COL30,

NULL AS TRIM_1_INVEST_COL31,
NULL AS TRIM_1_INVEST_COL32,
NULL AS TRIM_1_INVEST_COL33,

NULL AS TRIM_5_CON_COL34,
NULL AS TRIM_5_CON_COL35,
NULL AS TRIM_5_CON_COL36,

NULL AS TRIM_1_B_SC_COL37,
NULL AS TRIM_1_B_SC_COL38,
NULL AS TRIM_1_B_SC_COL39
         
         
         
    FROM (SELECT DISTINCT D.CUIIO,
                          D.CUIIO_VERS,
                          D.CUATM,
                          D.FORM
            FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
                 INNER JOIN CIS2.VW_CL_CUATM C ON D.CUATM = C.CODUL
                 
           WHERE D.PERIOADA = 443 AND D.FORM IN (7)
                 AND D.ID_SCHEMA = 2     
           
           ) D
         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
GROUP BY C.CODUL, C.FULL_CODE            

--END  _1_AUTO 
UNION 
--ADD 5 CI 

SELECT 
C.CODUL,
C.FULL_CODE,
NULL AS COL1,
NULL AS COL2,
NULL AS COL3,
NULL AS COL4,
NULL AS COL5,
NULL AS COL6,
NULL AS COL7,
NULL AS COL8,
NULL AS COL9,
NULL AS COL10,
NULL AS COL11,
NULL AS COL12,
NULL AS COL13,
NULL AS COL14,
NULL AS COL15,
   NULL AS auto_1_COL16,
         NULL AS auto_1_COL17,
         NULL AS auto_1_COL18,
COUNT (DISTINCT CASE WHEN FC.FORM  = 1 THEN  FC.CUIIO END ) AS CIS_5_CI__COL19,
NULL  AS CIS_5_CI__COL20,
NULL  AS CIS_5_CI__COL21,
NULL AS TRIM_2_INV___COL22,
NULL AS TRIM_2_INV___COL23,
NULL AS TRIM_2_INV___COL24,
NULL AS  TRIM_65_auto_COL25,
NULL AS  TRIM_65_auto_COL26,
NULL AS  TRIM_65_auto_COL27,

NULL AS TRIM_1_turism_COL28,
NULL AS TRIM_1_turism_COL29,
NULL AS TRIM_1_turism_COL30,

NULL AS TRIM_1_INVEST_COL31,
NULL AS TRIM_1_INVEST_COL32,
NULL AS TRIM_1_INVEST_COL33,

NULL AS TRIM_5_CON_COL34,
NULL AS TRIM_5_CON_COL35,
NULL AS TRIM_5_CON_COL36,

NULL AS TRIM_1_B_SC_COL37,
NULL AS TRIM_1_B_SC_COL38,
NULL AS TRIM_1_B_SC_COL39
FROM 


(
SELECT     

           R.CUIIO,
           R. CUIIO_VERS,
           FC.FORM,
          
           R.CUATM
           
      FROM (SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS.FORM_CUIIO  FC
                         
              
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS.FORM_CUIIO
                                  WHERE FORM IN (1) AND CUIIO_VERS <= :pPERIOADA_TRIM 
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (1) AND FC.STATUT <> '3') FC
           INNER JOIN CIS.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
               
               ) FC 
          
               
                 INNER JOIN CIS.VW_CL_CUATM C   ON C.CODUL = FC.CUATM
              
               GROUP BY 
              C.CODUL,
              C.FULL_CODE
              
              UNION 

SELECT C.CODUL,
         C.FULL_CODE,
         NULL                                                       AS COL1,
         NULL                                                       AS COL2,
         NULL                                                       AS COL3,
         NULL                                                       AS COL4,
         NULL                                                       AS COL5,
         NULL                                                       AS COL6,
         NULL                                                       AS COL7,
         NULL                                                       AS COL8,
         NULL                                                       AS COL9,
         NULL                                                       AS COL10,
         NULL                                                       AS COL11,
         NULL                                                       AS COL12,
         NULL                                                       AS COL13,
         NULL                                                       AS COL14,
         NULL                                                       AS COL15,
         NULL AS auto_1_COL16,
         NULL AS auto_1_COL17,
         NULL AS auto_1_COL18,
         NULL                                                       AS CIS_5_CI__COL19,
         COUNT (DISTINCT CASE WHEN D.FORM = 1 THEN D.CUIIO END)     AS CIS_5_CI__COL20,
         NULL                                                       AS CIS_5_CI__COL21,
         NULL AS TRIM_2_INV___COL22,
         NULL AS TRIM_2_INV___COL23,
         NULL AS TRIM_2_INV___COL24,
         NULL AS  TRIM_65_auto_COL25,
NULL AS  TRIM_65_auto_COL26,
NULL AS  TRIM_65_auto_COL27,

NULL AS TRIM_1_turism_COL28,
NULL AS TRIM_1_turism_COL29,
NULL AS TRIM_1_turism_COL30,

NULL AS TRIM_1_INVEST_COL31,
NULL AS TRIM_1_INVEST_COL32,
NULL AS TRIM_1_INVEST_COL33,

NULL AS TRIM_5_CON_COL34,
NULL AS TRIM_5_CON_COL35,
NULL AS TRIM_5_CON_COL36,

NULL AS TRIM_1_B_SC_COL37,
NULL AS TRIM_1_B_SC_COL38,
NULL AS TRIM_1_B_SC_COL39
         
         
         
    FROM (SELECT DISTINCT D.CUIIO,
                          D.CUIIO_VERS,
                          D.CUATM,
                          D.FORM
            FROM CIS.VW_DATA_ALL D
                 INNER JOIN CIS.VW_CL_CUATM C ON D.CUATM = C.CODUL
                 
           WHERE D.PERIOADA = :pPERIOADA_TRIM AND D.FORM IN (1)
             
           ) D
         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
GROUP BY C.CODUL, C.FULL_CODE

UNION 

  SELECT C.CODUL,
         C.FULL_CODE,
         NULL                                                       AS COL1,
         NULL                                                       AS COL2,
         NULL                                                       AS COL3,
         NULL                                                       AS COL4,
         NULL                                                       AS COL5,
         NULL                                                       AS COL6,
         NULL                                                       AS COL7,
         NULL                                                       AS COL8,
         NULL                                                       AS COL9,
         NULL                                                       AS COL10,
         NULL                                                       AS COL11,
         NULL                                                       AS COL12,
         NULL                                                       AS COL13,
         NULL                                                       AS COL14,
         NULL                                                       AS COL15,
     NULL AS auto_1_COL16,
         NULL AS auto_1_COL17,
         NULL AS auto_1_COL18,
         NULL                                                       AS CIS_5_CI__COL19,
         NULL                                                       AS CIS_5_CI__COL20,
         COUNT (DISTINCT CASE WHEN D.FORM = 1 THEN D.CUIIO END)     AS CIS_5_CI__COL21,
         NULL AS TRIM_2_INV___COL22,
         NULL AS TRIM_2_INV___COL23,
         NULL AS TRIM_2_INV___COL24,
         NULL AS  TRIM_65_auto_COL25,
NULL AS  TRIM_65_auto_COL26,
NULL AS  TRIM_65_auto_COL27,


NULL AS TRIM_1_turism_COL28,
NULL AS TRIM_1_turism_COL29,
NULL AS TRIM_1_turism_COL30,

NULL AS TRIM_1_INVEST_COL31,
NULL AS TRIM_1_INVEST_COL32,
NULL AS TRIM_1_INVEST_COL33,

NULL AS TRIM_5_CON_COL34,
NULL AS TRIM_5_CON_COL35,
NULL AS TRIM_5_CON_COL36,

NULL AS TRIM_1_B_SC_COL37,
NULL AS TRIM_1_B_SC_COL38,
NULL AS TRIM_1_B_SC_COL39
         
         
         
    FROM (SELECT DISTINCT D.CUIIO,
                          D.CUIIO_VERS,
                          D.CUATM,
                          D.FORM
            FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
                 INNER JOIN CIS.VW_CL_CUATM C ON D.CUATM = C.CODUL
                 
           WHERE D.PERIOADA = :pPERIOADA_TRIM AND D.FORM IN (1)
             AND D.ID_SCHEMA = 1    
           ) D
         INNER JOIN CIS.VW_CL_CUATM C ON C.CODUL = D.CUATM
GROUP BY C.CODUL, C.FULL_CODE
     

-- END 5 CI 
UNION 
-- Sterd 2 INV TRIM 

SELECT 
C.CODUL,
C.FULL_CODE,
NULL AS COL1,
NULL AS COL2,
NULL AS COL3,
NULL AS COL4,
NULL AS COL5,
NULL AS COL6,
NULL AS COL7,
NULL AS COL8,
NULL AS COL9,
NULL AS COL10,
NULL AS COL11,
NULL AS COL12,
NULL AS COL13,
NULL AS COL14,
NULL AS COL15,
         NULL AS auto_1_COL16,
         NULL AS auto_1_COL17,
         NULL AS auto_1_COL18,
         NULL  AS CIS_5_CI__COL19,
         NULL  AS CIS_5_CI__COL20,
         NULL  AS CIS_5_CI__COL21,

COUNT (DISTINCT CASE WHEN FC.FORM  = 6 THEN  FC.CUIIO END ) AS TRIM_2_INV___COL22,
                                                      NULL AS  TRIM_2_INV___COL23,
                                                      NULL AS  TRIM_2_INV___COL24,
                                                      NULL AS  TRIM_65_auto_COL25,
NULL AS  TRIM_65_auto_COL26,
NULL AS  TRIM_65_auto_COL27,

NULL AS TRIM_1_turism_COL28,
NULL AS TRIM_1_turism_COL29,
NULL AS TRIM_1_turism_COL30,

NULL AS TRIM_1_INVEST_COL31,
NULL AS TRIM_1_INVEST_COL32,
NULL AS TRIM_1_INVEST_COL33,
NULL AS TRIM_5_CON_COL34,
NULL AS TRIM_5_CON_COL35,
NULL AS TRIM_5_CON_COL36,

NULL AS TRIM_1_B_SC_COL37,
NULL AS TRIM_1_B_SC_COL38,
NULL AS TRIM_1_B_SC_COL39

FROM 


(
SELECT     

           R.CUIIO,
           R. CUIIO_VERS,
           FC.FORM,
          
           R.CUATM
           
      FROM (SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS.FORM_CUIIO  FC
                         
              
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS.FORM_CUIIO
                                  WHERE FORM IN (6) AND CUIIO_VERS <= :pPERIOADA_TRIM 
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (6) AND FC.STATUT <> '3') FC
           INNER JOIN CIS.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
               
               ) FC 
          
               
                 INNER JOIN CIS.VW_CL_CUATM C   ON C.CODUL = FC.CUATM
              
               GROUP BY 
              C.CODUL,
              C.FULL_CODE
              
              UNION 

SELECT C.CODUL,
         C.FULL_CODE,
         NULL                                                       AS COL1,
         NULL                                                       AS COL2,
         NULL                                                       AS COL3,
         NULL                                                       AS COL4,
         NULL                                                       AS COL5,
         NULL                                                       AS COL6,
         NULL                                                       AS COL7,
         NULL                                                       AS COL8,
         NULL                                                       AS COL9,
         NULL                                                       AS COL10,
         NULL                                                       AS COL11,
         NULL                                                       AS COL12,
         NULL                                                       AS COL13,
         NULL                                                       AS COL14,
         NULL                                                       AS COL15,
         NULL  AS auto_1_COL16,
         NULL  AS auto_1_COL17,
         NULL  AS auto_1_COL18,
         NULL  AS CIS_5_CI__COL19,
         NULL  AS CIS_5_CI__COL20,
         NULL  AS CIS_5_CI__COL21,

 NULL  AS TRIM_2_INV___COL22,
COUNT (DISTINCT CASE WHEN D.FORM  = 6 THEN  D.CUIIO END )  AS  TRIM_2_INV___COL23,
                                                      NULL AS  TRIM_2_INV___COL24,
                                                      NULL AS  TRIM_65_auto_COL25,
NULL AS  TRIM_65_auto_COL26,
NULL AS  TRIM_65_auto_COL27,

NULL AS TRIM_1_turism_COL28,
NULL AS TRIM_1_turism_COL29,
NULL AS TRIM_1_turism_COL30,

NULL AS TRIM_1_INVEST_COL31,
NULL AS TRIM_1_INVEST_COL32,
NULL AS TRIM_1_INVEST_COL33,

NULL AS TRIM_5_CON_COL34,
NULL AS TRIM_5_CON_COL35,
NULL AS TRIM_5_CON_COL36,

NULL AS TRIM_1_B_SC_COL37,
NULL AS TRIM_1_B_SC_COL38,
NULL AS TRIM_1_B_SC_COL39
         
         
         
    FROM (SELECT DISTINCT D.CUIIO,
                          D.CUIIO_VERS,
                          D.CUATM,
                          D.FORM
            FROM CIS.VW_DATA_ALL D
                 INNER JOIN CIS.VW_CL_CUATM C ON D.CUATM = C.CODUL
                 
           WHERE D.PERIOADA = :pPERIOADA_TRIM AND D.FORM IN (6)
             
           ) D
         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
GROUP BY C.CODUL, C.FULL_CODE

UNION 

  SELECT C.CODUL,
         C.FULL_CODE,
         NULL                                                       AS COL1,
         NULL                                                       AS COL2,
         NULL                                                       AS COL3,
         NULL                                                       AS COL4,
         NULL                                                       AS COL5,
         NULL                                                       AS COL6,
         NULL                                                       AS COL7,
         NULL                                                       AS COL8,
         NULL                                                       AS COL9,
         NULL                                                       AS COL10,
         NULL                                                       AS COL11,
         NULL                                                       AS COL12,
         NULL                                                       AS COL13,
         NULL                                                       AS COL14,
         NULL                                                       AS COL15,
         NULL AS auto_1_COL16,
         NULL AS auto_1_COL17,
         NULL AS auto_1_COL18,
         NULL  AS CIS_5_CI__COL19,
         NULL  AS CIS_5_CI__COL20,
         NULL  AS CIS_5_CI__COL21,

                                                             NULL  AS  TRIM_2_INV___COL22,
                                                             NULL  AS  TRIM_2_INV___COL23,
        COUNT (DISTINCT CASE WHEN D.FORM  = 6 THEN  D.CUIIO END )  AS  TRIM_2_INV___COL24,
        NULL AS  TRIM_65_auto_COL25,
NULL AS  TRIM_65_auto_COL26,
NULL AS  TRIM_65_auto_COL27,

NULL AS TRIM_1_turism_COL28,
NULL AS TRIM_1_turism_COL29,
NULL AS TRIM_1_turism_COL30,

NULL AS TRIM_1_INVEST_COL31,
NULL AS TRIM_1_INVEST_COL32,
NULL AS TRIM_1_INVEST_COL33,

NULL AS TRIM_5_CON_COL34,
NULL AS TRIM_5_CON_COL35,
NULL AS TRIM_5_CON_COL36,

NULL AS TRIM_1_B_SC_COL37,
NULL AS TRIM_1_B_SC_COL38,
NULL AS TRIM_1_B_SC_COL39
         
         
         
    FROM (SELECT DISTINCT D.CUIIO,
                          D.CUIIO_VERS,
                          D.CUATM,
                          D.FORM
            FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
                 INNER JOIN CIS.VW_CL_CUATM C ON D.CUATM = C.CODUL
                 
           WHERE D.PERIOADA = :pPERIOADA_TRIM AND D.FORM IN (6)
             AND D.ID_SCHEMA = 1    
           ) D
         INNER JOIN CIS.VW_CL_CUATM C ON C.CODUL = D.CUATM
GROUP BY C.CODUL, C.FULL_CODE
-- End   2 INV TRIM  


UNION 


-- start 65 Auto 


SELECT 
C.CODUL,
C.FULL_CODE,
NULL AS COL1,
NULL AS COL2,
NULL AS COL3,
NULL AS COL4,
NULL AS COL5,
NULL AS COL6,
NULL AS COL7,
NULL AS COL8,
NULL AS COL9,
NULL AS COL10,
NULL AS COL11,
NULL AS COL12,
NULL AS COL13,
NULL AS COL14,
NULL AS COL15,
         NULL AS auto_1_COL16,
         NULL AS auto_1_COL17,
         NULL AS auto_1_COL18,
         NULL  AS CIS_5_CI__COL19,
         NULL  AS CIS_5_CI__COL20,
         NULL  AS CIS_5_CI__COL21,

                                                      NULL AS TRIM_2_INV___COL22,
                                                      NULL AS  TRIM_2_INV___COL23,
                                                      NULL AS  TRIM_2_INV___COL24,
                                                      
       COUNT (DISTINCT CASE WHEN FC.FORM  = 5 THEN  FC.CUIIO END) AS   TRIM_65_auto_COL25,                                              
       NULL AS  TRIM_65_auto_COL26,                                              
       NULL AS  TRIM_65_auto_COL27,
       
       NULL AS TRIM_1_turism_COL28,
NULL AS TRIM_1_turism_COL29,
NULL AS TRIM_1_turism_COL30,

NULL AS TRIM_1_INVEST_COL31,
NULL AS TRIM_1_INVEST_COL32,
NULL AS TRIM_1_INVEST_COL33,

NULL AS TRIM_5_CON_COL34,
NULL AS TRIM_5_CON_COL35,
NULL AS TRIM_5_CON_COL36,

NULL AS TRIM_1_B_SC_COL37,
NULL AS TRIM_1_B_SC_COL38,
NULL AS TRIM_1_B_SC_COL39
FROM 


(
SELECT     

           R.CUIIO,
           R. CUIIO_VERS,
           FC.FORM,
          
           R.CUATM
           
      FROM (SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                         
              
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (5) AND CUIIO_VERS <= :pPERIOADA_TRIM 
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (5) AND FC.STATUT <> '3') FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
               
               ) FC 
          
               
                 INNER JOIN CIS2.VW_CL_CUATM C   ON C.CODUL = FC.CUATM
              
               GROUP BY 
              C.CODUL,
              C.FULL_CODE
              
              UNION 

SELECT C.CODUL,
         C.FULL_CODE,
         NULL                                                       AS COL1,
         NULL                                                       AS COL2,
         NULL                                                       AS COL3,
         NULL                                                       AS COL4,
         NULL                                                       AS COL5,
         NULL                                                       AS COL6,
         NULL                                                       AS COL7,
         NULL                                                       AS COL8,
         NULL                                                       AS COL9,
         NULL                                                       AS COL10,
         NULL                                                       AS COL11,
         NULL                                                       AS COL12,
         NULL                                                       AS COL13,
         NULL                                                       AS COL14,
         NULL                                                       AS COL15,
         NULL  AS auto_1_COL16,
         NULL  AS auto_1_COL17,
         NULL  AS auto_1_COL18,
         NULL  AS CIS_5_CI__COL19,
         NULL  AS CIS_5_CI__COL20,
         NULL  AS CIS_5_CI__COL21,

         NULL AS TRIM_2_INV___COL22,
                                                      NULL AS  TRIM_2_INV___COL23,
                                                      NULL AS  TRIM_2_INV___COL24,
                                                      
       NULL  AS    TRIM_65_auto_COL25,                                              
       COUNT (DISTINCT CASE WHEN D.FORM  = 5 THEN  D.CUIIO END) AS   TRIM_65_auto_COL26,                                              
       NULL AS  TRIM_65_auto_COL27,
       
       NULL AS TRIM_1_turism_COL28,
NULL AS TRIM_1_turism_COL29,
NULL AS TRIM_1_turism_COL30,

NULL AS TRIM_1_INVEST_COL31,
NULL AS TRIM_1_INVEST_COL32,
NULL AS TRIM_1_INVEST_COL33,

NULL AS TRIM_5_CON_COL34,
NULL AS TRIM_5_CON_COL35,
NULL AS TRIM_5_CON_COL36,

NULL AS TRIM_1_B_SC_COL37,
NULL AS TRIM_1_B_SC_COL38,
NULL AS TRIM_1_B_SC_COL39
         
         
         
    FROM (SELECT DISTINCT D.CUIIO,
                          D.CUIIO_VERS,
                          D.CUATM,
                          D.FORM
            FROM CIS2.VW_DATA_ALL D
                 INNER JOIN CIS.VW_CL_CUATM C ON D.CUATM = C.CODUL
                 
           WHERE D.PERIOADA = :pPERIOADA_TRIM AND D.FORM IN (5)
             
           ) D
         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
GROUP BY C.CODUL, C.FULL_CODE

UNION 

  SELECT C.CODUL,
         C.FULL_CODE,
         NULL                                                       AS COL1,
         NULL                                                       AS COL2,
         NULL                                                       AS COL3,
         NULL                                                       AS COL4,
         NULL                                                       AS COL5,
         NULL                                                       AS COL6,
         NULL                                                       AS COL7,
         NULL                                                       AS COL8,
         NULL                                                       AS COL9,
         NULL                                                       AS COL10,
         NULL                                                       AS COL11,
         NULL                                                       AS COL12,
         NULL                                                       AS COL13,
         NULL                                                       AS COL14,
         NULL                                                       AS COL15,
         NULL AS auto_1_COL16,
         NULL AS auto_1_COL17,
         NULL AS auto_1_COL18,
         NULL  AS CIS_5_CI__COL19,
         NULL  AS CIS_5_CI__COL20,
         NULL  AS CIS_5_CI__COL21,

                                                            NULL AS TRIM_2_INV___COL22,
                                                      NULL AS  TRIM_2_INV___COL23,
                                                      NULL AS  TRIM_2_INV___COL24,
                                                      
        NULL  AS    TRIM_65_auto_COL25,                                              
        NULL  AS   TRIM_65_auto_COL26,                                              
        COUNT (DISTINCT CASE WHEN D.FORM  = 5 THEN  D.CUIIO END) AS   TRIM_65_auto_COL27,
        
        NULL AS TRIM_1_turism_COL28,
NULL AS TRIM_1_turism_COL29,
NULL AS TRIM_1_turism_COL30,

NULL AS TRIM_1_INVEST_COL31,
NULL AS TRIM_1_INVEST_COL32,
NULL AS TRIM_1_INVEST_COL33,

NULL AS TRIM_5_CON_COL34,
NULL AS TRIM_5_CON_COL35,
NULL AS TRIM_5_CON_COL36,

NULL AS TRIM_1_B_SC_COL37,
NULL AS TRIM_1_B_SC_COL38,
NULL AS TRIM_1_B_SC_COL39
         
         
         
    FROM (SELECT DISTINCT D.CUIIO,
                          D.CUIIO_VERS,
                          D.CUATM,
                          D.FORM
            FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
                 INNER JOIN CIS2.VW_CL_CUATM C ON D.CUATM = C.CODUL
                 
           WHERE D.PERIOADA = :pPERIOADA_TRIM AND D.FORM IN (5)
             AND D.ID_SCHEMA = 2    
           ) D
         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
GROUP BY C.CODUL, C.FULL_CODE


-- End 65 Auto 
UNION
--Start 1 Turism


SELECT 
C.CODUL,
C.FULL_CODE,
NULL AS COL1,
NULL AS COL2,
NULL AS COL3,
NULL AS COL4,
NULL AS COL5,
NULL AS COL6,
NULL AS COL7,
NULL AS COL8,
NULL AS COL9,
NULL AS COL10,
NULL AS COL11,
NULL AS COL12,
NULL AS COL13,
NULL AS COL14,
NULL AS COL15,
         NULL AS auto_1_COL16,
         NULL AS auto_1_COL17,
         NULL AS auto_1_COL18,
         NULL  AS CIS_5_CI__COL19,
         NULL  AS CIS_5_CI__COL20,
         NULL  AS CIS_5_CI__COL21,

                                                      NULL AS TRIM_2_INV___COL22,
                                                      NULL AS  TRIM_2_INV___COL23,
                                                      NULL AS  TRIM_2_INV___COL24,
                                                      
       NULL AS   TRIM_65_auto_COL25,                                              
       NULL AS  TRIM_65_auto_COL26,                                              
       NULL AS  TRIM_65_auto_COL27,
       
       COUNT (DISTINCT CASE WHEN FC.FORM  = 6 THEN  FC.CUIIO END) AS TRIM_1_turism_COL28,
       NULL AS TRIM_1_turism_COL29,
       NULL AS TRIM_1_turism_COL30,
       
       NULL AS TRIM_1_INVEST_COL31,
NULL AS TRIM_1_INVEST_COL32,
NULL AS TRIM_1_INVEST_COL33,

NULL AS TRIM_5_CON_COL34,
NULL AS TRIM_5_CON_COL35,
NULL AS TRIM_5_CON_COL36,

NULL AS TRIM_1_B_SC_COL37,
NULL AS TRIM_1_B_SC_COL38,
NULL AS TRIM_1_B_SC_COL39
FROM 


(
SELECT     

           R.CUIIO,
           R. CUIIO_VERS,
           FC.FORM,
          
           R.CUATM
           
      FROM (SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                         
              
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (6) AND CUIIO_VERS <= :pPERIOADA_TRIM 
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (6) AND FC.STATUT <> '3') FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
               
               ) FC 
          
               
                 INNER JOIN CIS2.VW_CL_CUATM C   ON C.CODUL = FC.CUATM
              
               GROUP BY 
              C.CODUL,
              C.FULL_CODE
              
              UNION 

SELECT C.CODUL,
         C.FULL_CODE,
         NULL                                                       AS COL1,
         NULL                                                       AS COL2,
         NULL                                                       AS COL3,
         NULL                                                       AS COL4,
         NULL                                                       AS COL5,
         NULL                                                       AS COL6,
         NULL                                                       AS COL7,
         NULL                                                       AS COL8,
         NULL                                                       AS COL9,
         NULL                                                       AS COL10,
         NULL                                                       AS COL11,
         NULL                                                       AS COL12,
         NULL                                                       AS COL13,
         NULL                                                       AS COL14,
         NULL                                                       AS COL15,
         NULL  AS auto_1_COL16,
         NULL  AS auto_1_COL17,
         NULL  AS auto_1_COL18,
         NULL  AS CIS_5_CI__COL19,
         NULL  AS CIS_5_CI__COL20,
         NULL  AS CIS_5_CI__COL21,

         NULL AS TRIM_2_INV___COL22,
                                                      NULL AS  TRIM_2_INV___COL23,
                                                      NULL AS  TRIM_2_INV___COL24,
                                                      
       NULL AS   TRIM_65_auto_COL25,                                              
       NULL AS  TRIM_65_auto_COL26,                                              
       NULL AS  TRIM_65_auto_COL27,
       
       NULL AS TRIM_1_turism_COL28,
       COUNT (DISTINCT CASE WHEN D.FORM  = 6 THEN  D.CUIIO END) AS TRIM_1_turism_COL29,
       NULL AS TRIM_1_turism_COL30,
       
       NULL AS TRIM_1_INVEST_COL31,
NULL AS TRIM_1_INVEST_COL32,
NULL AS TRIM_1_INVEST_COL33,

NULL AS TRIM_5_CON_COL34,
NULL AS TRIM_5_CON_COL35,
NULL AS TRIM_5_CON_COL36,

NULL AS TRIM_1_B_SC_COL37,
NULL AS TRIM_1_B_SC_COL38,
NULL AS TRIM_1_B_SC_COL39
         
         
         
    FROM (SELECT DISTINCT D.CUIIO,
                          D.CUIIO_VERS,
                          D.CUATM,
                          D.FORM
            FROM CIS2.VW_DATA_ALL D
                 INNER JOIN CIS.VW_CL_CUATM C ON D.CUATM = C.CODUL
                 
           WHERE D.PERIOADA = :pPERIOADA_TRIM AND D.FORM IN (6)
             
           ) D
         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
GROUP BY C.CODUL, C.FULL_CODE

UNION 

  SELECT C.CODUL,
         C.FULL_CODE,
         NULL                                                       AS COL1,
         NULL                                                       AS COL2,
         NULL                                                       AS COL3,
         NULL                                                       AS COL4,
         NULL                                                       AS COL5,
         NULL                                                       AS COL6,
         NULL                                                       AS COL7,
         NULL                                                       AS COL8,
         NULL                                                       AS COL9,
         NULL                                                       AS COL10,
         NULL                                                       AS COL11,
         NULL                                                       AS COL12,
         NULL                                                       AS COL13,
         NULL                                                       AS COL14,
         NULL                                                       AS COL15,
         NULL AS auto_1_COL16,
         NULL AS auto_1_COL17,
         NULL AS auto_1_COL18,
         NULL  AS CIS_5_CI__COL19,
         NULL  AS CIS_5_CI__COL20,
         NULL  AS CIS_5_CI__COL21,

                                                            NULL AS TRIM_2_INV___COL22,
                                                      NULL AS  TRIM_2_INV___COL23,
                                                      NULL AS  TRIM_2_INV___COL24,
                                                      
        NULL AS   TRIM_65_auto_COL25,                                              
       NULL AS  TRIM_65_auto_COL26,                                              
       NULL AS  TRIM_65_auto_COL27,
       
       NULL AS TRIM_1_turism_COL28,
       NULL AS TRIM_1_turism_COL29,
       COUNT (DISTINCT CASE WHEN D.FORM  = 6 THEN  D.CUIIO END) AS TRIM_1_turism_COL30,
       NULL AS TRIM_1_INVEST_COL31,
NULL AS TRIM_1_INVEST_COL32,
NULL AS TRIM_1_INVEST_COL33,

NULL AS TRIM_5_CON_COL34,
NULL AS TRIM_5_CON_COL35,
NULL AS TRIM_5_CON_COL36,

NULL AS TRIM_1_B_SC_COL37,
NULL AS TRIM_1_B_SC_COL38,
NULL AS TRIM_1_B_SC_COL39
         
         
         
    FROM (SELECT DISTINCT D.CUIIO,
                          D.CUIIO_VERS,
                          D.CUATM,
                          D.FORM
            FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
                 INNER JOIN CIS2.VW_CL_CUATM C ON D.CUATM = C.CODUL
                 
           WHERE D.PERIOADA = :pPERIOADA_TRIM AND D.FORM IN (6)
             AND D.ID_SCHEMA = 2    
           ) D
         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
GROUP BY C.CODUL, C.FULL_CODE

-- End 1 Turism

UNION 

-- Start 1 Invest Trim 

SELECT 
C.CODUL,
C.FULL_CODE,
NULL AS COL1,
NULL AS COL2,
NULL AS COL3,
NULL AS COL4,
NULL AS COL5,
NULL AS COL6,
NULL AS COL7,
NULL AS COL8,
NULL AS COL9,
NULL AS COL10,
NULL AS COL11,
NULL AS COL12,
NULL AS COL13,
NULL AS COL14,
NULL AS COL15,
         NULL AS auto_1_COL16,
         NULL AS auto_1_COL17,
         NULL AS auto_1_COL18,
         NULL  AS CIS_5_CI__COL19,
         NULL  AS CIS_5_CI__COL20,
         NULL  AS CIS_5_CI__COL21,

                                                      NULL AS TRIM_2_INV___COL22,
                                                      NULL AS  TRIM_2_INV___COL23,
                                                      NULL AS  TRIM_2_INV___COL24,
                                                      
       NULL AS   TRIM_65_auto_COL25,                                              
       NULL AS  TRIM_65_auto_COL26,                                              
       NULL AS  TRIM_65_auto_COL27,
       
       NULL AS TRIM_1_turism_COL28,
       NULL AS TRIM_1_turism_COL29,
       NULL AS TRIM_1_turism_COL30,
       
       COUNT (DISTINCT CASE WHEN FC.FORM  = 13 THEN  FC.CUIIO END) AS TRIM_1_INVEST_COL31,
       NULL AS TRIM_1_INVEST_COL32,
       NULL AS TRIM_1_INVEST_COL33,
       
       NULL AS TRIM_5_CON_COL34,
NULL AS TRIM_5_CON_COL35,
NULL AS TRIM_5_CON_COL36,

NULL AS TRIM_1_B_SC_COL37,
NULL AS TRIM_1_B_SC_COL38,
NULL AS TRIM_1_B_SC_COL39

FROM 

(
SELECT     

           R.CUIIO,
           R. CUIIO_VERS,
           FC.FORM,
          
           R.CUATM
           
      FROM (SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                         
              
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (13) AND CUIIO_VERS <= :pPERIOADA_TRIM 
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (13) AND FC.STATUT <> '3') FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
               
               ) FC 
          
               
                 INNER JOIN CIS2.VW_CL_CUATM C   ON C.CODUL = FC.CUATM
              
               GROUP BY 
              C.CODUL,
              C.FULL_CODE
              
              UNION 

SELECT C.CODUL,
         C.FULL_CODE,
         NULL                                                       AS COL1,
         NULL                                                       AS COL2,
         NULL                                                       AS COL3,
         NULL                                                       AS COL4,
         NULL                                                       AS COL5,
         NULL                                                       AS COL6,
         NULL                                                       AS COL7,
         NULL                                                       AS COL8,
         NULL                                                       AS COL9,
         NULL                                                       AS COL10,
         NULL                                                       AS COL11,
         NULL                                                       AS COL12,
         NULL                                                       AS COL13,
         NULL                                                       AS COL14,
         NULL                                                       AS COL15,
         NULL  AS auto_1_COL16,
         NULL  AS auto_1_COL17,
         NULL  AS auto_1_COL18,
         NULL  AS CIS_5_CI__COL19,
         NULL  AS CIS_5_CI__COL20,
         NULL  AS CIS_5_CI__COL21,

       NULL AS TRIM_2_INV___COL22,
                                                      NULL AS  TRIM_2_INV___COL23,
                                                      NULL AS  TRIM_2_INV___COL24,
                                                      
       NULL AS   TRIM_65_auto_COL25,                                              
       NULL AS  TRIM_65_auto_COL26,                                              
       NULL AS  TRIM_65_auto_COL27,
       
       NULL AS TRIM_1_turism_COL28,
       NULL AS TRIM_1_turism_COL29,
       NULL AS TRIM_1_turism_COL30,
       
       NULL AS TRIM_1_INVEST_COL31,
       COUNT (DISTINCT CASE WHEN D.FORM  = 13 THEN  D.CUIIO END) AS   TRIM_1_INVEST_COL32,
       NULL AS TRIM_1_INVEST_COL33,
       
       NULL AS TRIM_5_CON_COL34,
NULL AS TRIM_5_CON_COL35,
NULL AS TRIM_5_CON_COL36,

NULL AS TRIM_1_B_SC_COL37,
NULL AS TRIM_1_B_SC_COL38,
NULL AS TRIM_1_B_SC_COL39
         
         
         
    FROM (SELECT DISTINCT D.CUIIO,
                          D.CUIIO_VERS,
                          D.CUATM,
                          D.FORM
            FROM CIS2.VW_DATA_ALL D
                 INNER JOIN CIS2.VW_CL_CUATM C ON D.CUATM = C.CODUL
                 
           WHERE D.PERIOADA = :pPERIOADA_TRIM AND D.FORM IN (13)
             
           ) D
         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
GROUP BY C.CODUL, C.FULL_CODE

UNION 

  SELECT C.CODUL,
         C.FULL_CODE,
         NULL                                                       AS COL1,
         NULL                                                       AS COL2,
         NULL                                                       AS COL3,
         NULL                                                       AS COL4,
         NULL                                                       AS COL5,
         NULL                                                       AS COL6,
         NULL                                                       AS COL7,
         NULL                                                       AS COL8,
         NULL                                                       AS COL9,
         NULL                                                       AS COL10,
         NULL                                                       AS COL11,
         NULL                                                       AS COL12,
         NULL                                                       AS COL13,
         NULL                                                       AS COL14,
         NULL                                                       AS COL15,
         NULL AS auto_1_COL16,
         NULL AS auto_1_COL17,
         NULL AS auto_1_COL18,
         NULL  AS CIS_5_CI__COL19,
         NULL  AS CIS_5_CI__COL20,
         NULL  AS CIS_5_CI__COL21,

                                                            NULL AS TRIM_2_INV___COL22,
                                                      NULL AS  TRIM_2_INV___COL23,
                                                      NULL AS  TRIM_2_INV___COL24,
                                                      
        NULL AS   TRIM_65_auto_COL25,                                              
       NULL AS  TRIM_65_auto_COL26,                                              
       NULL AS  TRIM_65_auto_COL27,
       
       NULL AS TRIM_1_turism_COL28,
       NULL AS TRIM_1_turism_COL29,
       NULL AS TRIM_1_turism_COL30,
       
       NULL AS  TRIM_1_INVEST_COL31,
       NULL AS  TRIM_1_INVEST_COL32,
       COUNT (DISTINCT CASE WHEN D.FORM  = 13 THEN  D.CUIIO END) AS  TRIM_1_INVEST_COL33,
       
       NULL AS TRIM_5_CON_COL34,
NULL AS TRIM_5_CON_COL35,
NULL AS TRIM_5_CON_COL36,

NULL AS TRIM_1_B_SC_COL37,
NULL AS TRIM_1_B_SC_COL38,
NULL AS TRIM_1_B_SC_COL39
         
         
         
    FROM (SELECT DISTINCT D.CUIIO,
                          D.CUIIO_VERS,
                          D.CUATM,
                          D.FORM
            FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
                 INNER JOIN CIS2.VW_CL_CUATM C ON D.CUATM = C.CODUL
                 
           WHERE D.PERIOADA = :pPERIOADA_TRIM AND D.FORM IN (13)
             AND D.ID_SCHEMA = 2    
           ) D
         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
GROUP BY C.CODUL, C.FULL_CODE
-- End  1  Invest Trim   

UNION 

--Start 5 CON 

SELECT 
C.CODUL,
C.FULL_CODE,
NULL AS COL1,
NULL AS COL2,
NULL AS COL3,
NULL AS COL4,
NULL AS COL5,
NULL AS COL6,
NULL AS COL7,
NULL AS COL8,
NULL AS COL9,
NULL AS COL10,
NULL AS COL11,
NULL AS COL12,
NULL AS COL13,
NULL AS COL14,
NULL AS COL15,
         NULL AS auto_1_COL16,
         NULL AS auto_1_COL17,
         NULL AS auto_1_COL18,
         NULL  AS CIS_5_CI__COL19,
         NULL  AS CIS_5_CI__COL20,
         NULL  AS CIS_5_CI__COL21,

                                                      NULL AS TRIM_2_INV___COL22,
                                                      NULL AS  TRIM_2_INV___COL23,
                                                      NULL AS  TRIM_2_INV___COL24,
                                                      
       NULL AS   TRIM_65_auto_COL25,                                              
       NULL AS  TRIM_65_auto_COL26,                                              
       NULL AS  TRIM_65_auto_COL27,
       
       NULL AS TRIM_1_turism_COL28,
       NULL AS TRIM_1_turism_COL29,
       NULL AS TRIM_1_turism_COL30,
       
       NULL AS TRIM_1_INVEST_COL31,
       NULL AS TRIM_1_INVEST_COL32,
       NULL AS TRIM_1_INVEST_COL33,
       
       COUNT (DISTINCT CASE WHEN FC.FORM  = 18 THEN  FC.CUIIO END) AS TRIM_5_CON_COL34,
       NULL AS TRIM_5_CON_COL35,
       NULL AS TRIM_5_CON,
       
       NULL AS TRIM_1_B_SC_COL37,
NULL AS TRIM_1_B_SC_COL38,
NULL AS TRIM_1_B_SC_COL39_COL36
   
FROM 

(
SELECT     

           R.CUIIO,
           R. CUIIO_VERS,
           FC.FORM,
          
           R.CUATM
           
      FROM (SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                         
              
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (18) AND CUIIO_VERS <= :pPERIOADA_TRIM 
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (18) AND FC.STATUT <> '3') FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
               
               ) FC 
          
               
                 INNER JOIN CIS2.VW_CL_CUATM C   ON C.CODUL = FC.CUATM
              
               GROUP BY 
              C.CODUL,
              C.FULL_CODE
              
              UNION 

SELECT C.CODUL,
         C.FULL_CODE,
         NULL                                                       AS COL1,
         NULL                                                       AS COL2,
         NULL                                                       AS COL3,
         NULL                                                       AS COL4,
         NULL                                                       AS COL5,
         NULL                                                       AS COL6,
         NULL                                                       AS COL7,
         NULL                                                       AS COL8,
         NULL                                                       AS COL9,
         NULL                                                       AS COL10,
         NULL                                                       AS COL11,
         NULL                                                       AS COL12,
         NULL                                                       AS COL13,
         NULL                                                       AS COL14,
         NULL                                                       AS COL15,
         NULL  AS auto_1_COL16,
         NULL  AS auto_1_COL17,
         NULL  AS auto_1_COL18,
         NULL  AS CIS_5_CI__COL19,
         NULL  AS CIS_5_CI__COL20,
         NULL  AS CIS_5_CI__COL21,

       NULL AS TRIM_2_INV___COL22,
                                                      NULL AS  TRIM_2_INV___COL23,
                                                      NULL AS  TRIM_2_INV___COL24,
                                                      
       NULL AS   TRIM_65_auto_COL25,                                              
       NULL AS  TRIM_65_auto_COL26,                                              
       NULL AS  TRIM_65_auto_COL27,
       
       NULL AS TRIM_1_turism_COL28,
       NULL AS TRIM_1_turism_COL29,
       NULL AS TRIM_1_turism_COL30,
       
       NULL AS TRIM_1_INVEST_COL31,
       NULL AS TRIM_1_INVEST_COL32,
       NULL AS TRIM_1_INVEST_COL33,
       
       NULL AS TRIM_5_CON_COL34,
       COUNT (DISTINCT CASE WHEN D.FORM  = 18 THEN  D.CUIIO END) AS  TRIM_5_CON_COL35,
       NULL AS TRIM_5_CON_COL36,
       
       NULL AS TRIM_1_B_SC_COL37,
NULL AS TRIM_1_B_SC_COL38,
NULL AS TRIM_1_B_SC_COL39
         
         
         
    FROM (SELECT DISTINCT D.CUIIO,
                          D.CUIIO_VERS,
                          D.CUATM,
                          D.FORM
            FROM CIS2.VW_DATA_ALL D
                 INNER JOIN CIS2.VW_CL_CUATM C ON D.CUATM = C.CODUL
                 
           WHERE D.PERIOADA = :pPERIOADA_TRIM AND D.FORM IN (18)
             
           ) D
         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
GROUP BY C.CODUL, C.FULL_CODE

UNION 

  SELECT C.CODUL,
         C.FULL_CODE,
         NULL                                                       AS COL1,
         NULL                                                       AS COL2,
         NULL                                                       AS COL3,
         NULL                                                       AS COL4,
         NULL                                                       AS COL5,
         NULL                                                       AS COL6,
         NULL                                                       AS COL7,
         NULL                                                       AS COL8,
         NULL                                                       AS COL9,
         NULL                                                       AS COL10,
         NULL                                                       AS COL11,
         NULL                                                       AS COL12,
         NULL                                                       AS COL13,
         NULL                                                       AS COL14,
         NULL                                                       AS COL15,
         NULL AS auto_1_COL16,
         NULL AS auto_1_COL17,
         NULL AS auto_1_COL18,
         NULL  AS CIS_5_CI__COL19,
         NULL  AS CIS_5_CI__COL20,
         NULL  AS CIS_5_CI__COL21,

                                                            NULL AS TRIM_2_INV___COL22,
                                                      NULL AS  TRIM_2_INV___COL23,
                                                      NULL AS  TRIM_2_INV___COL24,
                                                      
        NULL AS   TRIM_65_auto_COL25,                                              
       NULL AS  TRIM_65_auto_COL26,                                              
       NULL AS  TRIM_65_auto_COL27,
       
       NULL AS TRIM_1_turism_COL28,
       NULL AS TRIM_1_turism_COL29,
       NULL AS TRIM_1_turism_COL30,
       
           NULL AS TRIM_1_INVEST_COL31,
       NULL AS TRIM_1_INVEST_COL32,
       NULL AS TRIM_1_INVEST_COL33,
       
       NULL AS  TRIM_5_CON_COL34,
       NULL AS  TRIM_5_CON_COL35,
       COUNT (DISTINCT CASE WHEN D.FORM  = 18 THEN  D.CUIIO END) AS TRIM_5_CON_COL36,
       
       NULL AS TRIM_1_B_SC_COL37,
NULL AS TRIM_1_B_SC_COL38,
NULL AS TRIM_1_B_SC_COL39
         
         
         
    FROM (SELECT DISTINCT D.CUIIO,
                          D.CUIIO_VERS,
                          D.CUATM,
                          D.FORM
            FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
                 INNER JOIN CIS2.VW_CL_CUATM C ON D.CUATM = C.CODUL
                 
           WHERE D.PERIOADA = :pPERIOADA_TRIM AND D.FORM IN (18)
             AND D.ID_SCHEMA = 2    
           ) D
         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
GROUP BY C.CODUL, C.FULL_CODE
-- End 5 CON 

UNION 

--  Start 1 BSC


SELECT 
C.CODUL,
C.FULL_CODE,
NULL AS COL1,
NULL AS COL2,
NULL AS COL3,
NULL AS COL4,
NULL AS COL5,
NULL AS COL6,
NULL AS COL7,
NULL AS COL8,
NULL AS COL9,
NULL AS COL10,
NULL AS COL11,
NULL AS COL12,
NULL AS COL13,
NULL AS COL14,
NULL AS COL15,
         NULL AS auto_1_COL16,
         NULL AS auto_1_COL17,
         NULL AS auto_1_COL18,
         NULL  AS CIS_5_CI__COL19,
         NULL  AS CIS_5_CI__COL20,
         NULL  AS CIS_5_CI__COL21,

                                                      NULL AS TRIM_2_INV___COL22,
                                                      NULL AS  TRIM_2_INV___COL23,
                                                      NULL AS  TRIM_2_INV___COL24,
                                                      
       NULL AS   TRIM_65_auto_COL25,                                              
       NULL AS  TRIM_65_auto_COL26,                                              
       NULL AS  TRIM_65_auto_COL27,
       
       NULL AS TRIM_1_turism_COL28,
       NULL AS TRIM_1_turism_COL29,
       NULL AS TRIM_1_turism_COL30,
       
       NULL AS TRIM_1_INVEST_COL31,
       NULL AS TRIM_1_INVEST_COL32,
       NULL AS TRIM_1_INVEST_COL33,
       
       NULL AS TRIM_5_CON_COL34,
       NULL AS TRIM_5_CON_COL35,
       NULL AS TRIM_5_CON_COL36,
       
       COUNT (DISTINCT CASE WHEN FC.FORM  = 19 THEN  FC.CUIIO END) AS  TRIM_1_B_SC_COL37,
       NULL AS  TRIM_1_B_SC_COL38,
       NULL AS  TRIM_1_B_SC_COL39
       
   
FROM 

(
SELECT     

           R.CUIIO,
           R. CUIIO_VERS,
           FC.FORM,
          
           R.CUATM
           
      FROM (SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                         
              
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (19) AND CUIIO_VERS <= :pPERIOADA_TRIM 
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (19) AND FC.STATUT <> '3') FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
               
               ) FC 
          
               
                 INNER JOIN CIS2.VW_CL_CUATM C   ON C.CODUL = FC.CUATM
              
               GROUP BY 
              C.CODUL,
              C.FULL_CODE
              
              UNION 

SELECT C.CODUL,
         C.FULL_CODE,
         NULL                                                       AS COL1,
         NULL                                                       AS COL2,
         NULL                                                       AS COL3,
         NULL                                                       AS COL4,
         NULL                                                       AS COL5,
         NULL                                                       AS COL6,
         NULL                                                       AS COL7,
         NULL                                                       AS COL8,
         NULL                                                       AS COL9,
         NULL                                                       AS COL10,
         NULL                                                       AS COL11,
         NULL                                                       AS COL12,
         NULL                                                       AS COL13,
         NULL                                                       AS COL14,
         NULL                                                       AS COL15,
         NULL  AS auto_1_COL16,
         NULL  AS auto_1_COL17,
         NULL  AS auto_1_COL18,
         NULL  AS CIS_5_CI__COL19,
         NULL  AS CIS_5_CI__COL20,
         NULL  AS CIS_5_CI__COL21,

       NULL AS TRIM_2_INV___COL22,
                                                      NULL AS  TRIM_2_INV___COL23,
                                                      NULL AS  TRIM_2_INV___COL24,
                                                      
       NULL AS   TRIM_65_auto_COL25,                                              
       NULL AS  TRIM_65_auto_COL26,                                              
       NULL AS  TRIM_65_auto_COL27,
       
       NULL AS TRIM_1_turism_COL28,
       NULL AS TRIM_1_turism_COL29,
       NULL AS TRIM_1_turism_COL30,
       
       NULL AS TRIM_1_INVEST_COL31,
       NULL AS TRIM_1_INVEST_COL32,
       NULL AS TRIM_1_INVEST_COL33,
       
       NULL AS TRIM_5_CON_COL34,
       NULL AS TRIM_5_CON_COL35,
       NULL AS TRIM_5_CON_COL36,
       
       NULL AS  TRIM_1_B_SC_COL37,
       COUNT (DISTINCT CASE WHEN D.FORM  = 19 THEN  D.CUIIO END) AS   TRIM_1_B_SC_COL38,
       NULL AS  TRIM_1_B_SC_COL39
         
         
         
    FROM (SELECT DISTINCT D.CUIIO,
                          D.CUIIO_VERS,
                          D.CUATM,
                          D.FORM
            FROM CIS2.VW_DATA_ALL D
                 INNER JOIN CIS2.VW_CL_CUATM C ON D.CUATM = C.CODUL
                 
           WHERE D.PERIOADA = :pPERIOADA_TRIM AND D.FORM IN (19)
             
           ) D
         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
GROUP BY C.CODUL, C.FULL_CODE

UNION 

  SELECT C.CODUL,
         C.FULL_CODE,
         NULL                                                       AS COL1,
         NULL                                                       AS COL2,
         NULL                                                       AS COL3,
         NULL                                                       AS COL4,
         NULL                                                       AS COL5,
         NULL                                                       AS COL6,
         NULL                                                       AS COL7,
         NULL                                                       AS COL8,
         NULL                                                       AS COL9,
         NULL                                                       AS COL10,
         NULL                                                       AS COL11,
         NULL                                                       AS COL12,
         NULL                                                       AS COL13,
         NULL                                                       AS COL14,
         NULL                                                       AS COL15,
         NULL AS auto_1_COL16,
         NULL AS auto_1_COL17,
         NULL AS auto_1_COL18,
         NULL  AS CIS_5_CI__COL19,
         NULL  AS CIS_5_CI__COL20,
         NULL  AS CIS_5_CI__COL21,

                                                            NULL AS TRIM_2_INV___COL22,
                                                      NULL AS  TRIM_2_INV___COL23,
                                                      NULL AS  TRIM_2_INV___COL24,
                                                      
        NULL AS   TRIM_65_auto_COL25,                                              
       NULL AS  TRIM_65_auto_COL26,                                              
       NULL AS  TRIM_65_auto_COL27,
       
       NULL AS TRIM_1_turism_COL28,
       NULL AS TRIM_1_turism_COL29,
       NULL AS TRIM_1_turism_COL30,
       
           NULL AS TRIM_1_INVEST_COL31,
       NULL AS TRIM_1_INVEST_COL32,
       NULL AS TRIM_1_INVEST_COL33,
       
       NULL AS TRIM_5_CON_COL34,
       NULL AS TRIM_5_CON_COL35,
       NULL AS TRIM_5_CON_COL36,
       
       NULL AS  TRIM_1_B_SC_COL37,
       NULL AS  TRIM_1_B_SC_COL38,
       COUNT (DISTINCT CASE WHEN D.FORM  = 19 THEN  D.CUIIO END) AS  TRIM_1_B_SC_COL39
         
         
    FROM (SELECT DISTINCT D.CUIIO,
                          D.CUIIO_VERS,
                          D.CUATM,
                          D.FORM
            FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
                 INNER JOIN CIS2.VW_CL_CUATM C ON D.CUATM = C.CODUL
                 
           WHERE D.PERIOADA = :pPERIOADA_TRIM AND D.FORM IN (19)
             AND D.ID_SCHEMA = 2    
           ) D
         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
GROUP BY C.CODUL, C.FULL_CODE 
--  End  1 BSC 




              ) L
     
     INNER JOIN CIS.VW_CL_CUATM C   ON C.CODUL = L.CODUL
     CROSS JOIN (
     
     /* Formatted on 6/22/2022 4:39:31 PM (QP5 v5.326) */
SELECT DECODE (CS.CODUL,
               '0000000', '01',
               '0100000', '02',
               '1111111', '03',
               '0300000', '04',
               '1400000', '05',
               '3400000', '06',
               '3600000', '07',
               '4100000', '08',
               '4300000', '09',
               '4500000', '10',
               '4800000', '11',
               '6200000', '12',
               '6700000', '13',
               '7100000', '14',
               '7400000', '15',
               '7800000', '16',
               '8900000', '17',
               '2222222', '18',
               '1000000', '19',
               '2500000', '20',
               '2700000', '21',
               '2900000', '22',
               '3100000', '23',
               '3800000', '24',
               '5300000', '25',
               '5500000', '26',
               '6000000', '27',
               '6400000', '28',
               '8000000', '29',
               '8300000', '30',
               '8500000', '31',
               '9200000', '32',
               '3333333', '33',
               '1200000', '34',
               '1700000', '35',
               '2100000', '36',
               '5700000', '37',
               '8700000', '38',
               '9600000', '39',
               '9601000', '40',
               '9602000', '41',
               '9603000', '42')
      AS NR_ROW,
      CS.DENUMIRE AS NUME_ROW,
      CS.CODUL AS CS_CUATM
    FROM
      VW_CL_CUATM CS
    WHERE
      CS.CODUL 
      IN(
         '0000000','0100000','1111111','0300000','1400000','3400000','3600000','4100000','4300000','4500000',
         '4800000','6200000','7100000','7400000','7800000','2222222','1000000','2500000','3100000','3800000',
         '5300000','5500000','6000000','6400000','6700000','8000000','8300000','8900000','9200000','3333333',
         '1200000','1700000','2100000','2700000','2900000','5700000','8500000','8700000','9600000','9601000',
         '9602000','9603000'
        )
        
      
     ) CR 
     
     WHERE 
     1=1
    
     group by 
    CR.NUME_ROW, 
    TO_NUMBER(CR.NR_ROW),
    CR.CS_CUATM 
      
      ORDER BY
      CR.NR_ROW