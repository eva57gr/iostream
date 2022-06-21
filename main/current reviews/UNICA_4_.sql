SELECT 
CC.CODUL,
CC.DENUMIRE,
CC.FULL_CODE,
COUNT (DISTINCT CASE WHEN FC.FORM  = :pFORM THEN  FC.CUIIO END ) AS COL1,
COUNT (DISTINCT CASE WHEN D.FORM  = :pFORM THEN   D.CUIIO END )  AS COL2,
COUNT (DISTINCT CASE WHEN DD.FORM  = :pFORM THEN   DD.CUIIO END )  AS COL3

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
                    INNER JOIN CIS.DATA_ALL D ON 
                            D.CUIIO = FC.CUIIO AND D.CUIIO_VERS = FC.CUIIO_VERS 
               
                    INNER JOIN USER_EREPORTING.DATA_ALL_PRIMIT DD
                    ON 
                            DD.CUIIO = FC.CUIIO AND DD.CUIIO_VERS = FC.CUIIO_VERS 

                 INNER JOIN CIS.VW_CL_CUATM C   ON C.CODUL = FC.CUATM
                INNER JOIN CIS.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')
               GROUP BY 
           CC.CODUL,
CC.DENUMIRE,
CC.FULL_CODE
              
              ORDER BY 
          
              CC.FULL_CODE