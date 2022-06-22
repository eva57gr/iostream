
SELECT 
CC.CODUL,
CC.DENUMIRE,
CC.FULL_CODE,
SUM(L.COL1) AS COL1,
SUM(L.COL2) AS COL2,
SUM(L.COL3) AS COL3,
SUM(L.COL4) AS COL4,
SUM(L.COL5) AS COL5,
SUM(L.COL6) AS COL6


FROM 

(

SELECT 
C.CODUL,
C.FULL_CODE,
COUNT (DISTINCT CASE WHEN FC.FORM  = 3 THEN  FC.CUIIO END ) AS COL1,
NULL AS COL2,
NULL AS COL3,
COUNT (DISTINCT CASE WHEN FC.FORM  = 4 THEN  FC.CUIIO END ) AS COL4,
NULL AS COL5,
NULL AS COL6




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
                                  WHERE FORM IN (3,4,2,5) AND CUIIO_VERS <= :pPERIOADA 
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
              
              SELECT 
C.CODUL,
C.FULL_CODE,
NULL AS COL1,
COUNT (DISTINCT CASE WHEN D.FORM  = 3 THEN  D.CUIIO END ) AS COL2,
NULL AS COL3,
NULL AS COL4,
COUNT (DISTINCT CASE WHEN D.FORM  = 4 THEN  D.CUIIO END ) AS COL5,
NULL AS COL6


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
    AND D.FORM IN  (3,4)
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
COUNT (DISTINCT CASE WHEN D.FORM  = 3 THEN  D.CUIIO END ) AS COL3,
NULL AS COL4,
NULL AS COL5,
COUNT (DISTINCT CASE WHEN D.FORM  = 4 THEN  D.CUIIO END ) AS COL6




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