SELECT 
C.CODUL,
C.FULL_CODE,
COUNT (DISTINCT CASE WHEN FC.FORM  = :pFORM THEN  FC.CUIIO END ) AS COL1

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
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA 
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (:pFORM) AND FC.STATUT <> '3') FC
           INNER JOIN CIS.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
               
               ) FC 
                    INNER JOIN CIS.VW_DATA_ALL D ON 
                            D.CUIIO = R.CUIIO AND D.CUIIO_VERS = R.CUIIO_VERS 
               
                 INNER JOIN CIS.VW_CL_CUATM C   ON C.CODUL = FC.CUATM
              
               GROUP BY 
              C.CODUL,
              C.FULL_CODE
              
              ORDER BY 
              C.CODUL,
              C.FULL_CODE