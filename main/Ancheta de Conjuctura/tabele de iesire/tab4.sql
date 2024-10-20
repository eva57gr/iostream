SELECT DISTINCT D.CUIIO
--,
--D.CAEM2


FROM CIS2.VW_DATA_ALL  D

WHERE
   D.PERIOADA IN (1062) AND
  D.FORM IN (74) AND 
  D.CAPITOL IN (1197) 



            AND CUIIO IN (

SELECT L.CUIIO 
FROM

(SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
                                  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (:pFORM) AND FC.STATUT <> '3' ) L LEFT JOIN (
             
              SELECT 
        L.CUIIO,
        L.CUIIO CUIIO_AC,
        R.CUIIO CUIIO_BZ,
        R.PERS_IT           
                   FROM
      (
      SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
                                  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (:pFORM) AND FC.STATUT <> '3'
             
             ) L  INNER JOIN (
             SELECT
  CUIIO,
  PERS_IT,
  
  ANUL  

FROM CIS2.X_BAZA_SONDAJ

WHERE

ANUL = 2024 
AND PERS_IT <> 0
             
             ) R ON R.CUIIO = L.CUIIO
             
             
--             WHERE
--             
--             L.CUIIO IS NULL
--             
             ) R ON R.CUIIO = L.CUIIO
             
             
             WHERE
             R.CUIIO IS NULL
      
)