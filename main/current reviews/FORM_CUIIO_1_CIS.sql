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
NULL AS COL16,
NULL AS COL17,
NULL AS COL18,
COUNT (DISTINCT CASE WHEN FC.FORM  = 1 THEN  FC.CUIIO END ) AS CIS_5_CI__COL19,
NULL  AS CIS_5_CI__COL20,
NULL  AS CIS_5_CI__COL21
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
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
               
               ) FC 
          
               
                 INNER JOIN CIS.VW_CL_CUATM C   ON C.CODUL = FC.CUATM
              
               GROUP BY 
              C.CODUL,
              C.FULL_CODE