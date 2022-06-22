
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

SELECT 
C.CODUL,
C.FULL_CODE,
COUNT (DISTINCT CASE WHEN FC.FORM  = 3 THEN  FC.CUIIO END ) AS COL1,
NULL AS COL2,
NULL AS COL3,
COUNT (DISTINCT CASE WHEN FC.FORM  = 4 THEN  FC.CUIIO END ) AS COL4,
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
                                  WHERE FORM IN (3,4,2,5) AND CUIIO_VERS <= :pPERIOADA 
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (3,4,2,5) AND FC.STATUT <> '3') FC
           INNER JOIN CIS.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
               
               ) FC 
          
               
                 INNER JOIN CIS.VW_CL_CUATM C   ON C.CODUL = FC.CUATM
              
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