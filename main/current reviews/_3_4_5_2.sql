
SELECT 
CC.CODUL,
CC.DENUMIRE,
CC.FULL_CODE,
SUM(L.COL1) AS COL1,
SUM(L.COL2) AS COL2,
SUM(L.COL3) AS COL3,
SUM(L.COL4) AS COL4,
SUM(L.COL5) AS COL5,
SUM(L.COL6) AS COL6,
SUM(L.COL7) AS COL7,
SUM(L.COL8) AS COL8,
SUM(L.COL9) AS COL9,
SUM(L.COL10) AS COL10,
SUM(L.COL11) AS COL11,
SUM(L.COL12) AS COL12


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
NULL AS COL12
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
NULL AS COL12


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
NULL AS COL12



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
NULL AS COL12




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
NULL AS COL12


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
              
              
              
              
              
              ) L
     
     INNER JOIN CIS.VW_CL_CUATM C   ON C.CODUL = L.CODUL
     INNER JOIN CIS.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')
     
     WHERE 
     
     CC.PRGS IN('2')
     group by 
      CC.CODUL,
      CC.DENUMIRE,
      CC.FULL_CODE
      
      ORDER BY
      CC.FULL_CODE