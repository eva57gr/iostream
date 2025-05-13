SELECT
                   FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.CAEM2
                   FROM
(
 SELECT            DISTINCT
                   FC.CUIIO,
                   FC.CUIIO_VERS,
                   R.CAEM2
              FROM
              (
              SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS.FORM_CUIIO
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= 480
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE
             FC.FORM IN (:pFORM) AND FC.STATUT <> '3'
             ) FC
             INNER JOIN CIS.RENIM R ON R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS ) FC  LEFT JOIN (
             SELECT            DISTINCT
                   FC.CUIIO,
                   FC.CUIIO_VERS,
                   R.CAEM2
              FROM
              (
              SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS.FORM_CUIIO
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= 481
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE
             FC.FORM IN (:pFORM) AND FC.STATUT <> '3'
             ) FC
             INNER JOIN CIS.RENIM R ON R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS
             ) R ON R.CUIIO = FC.CUIIO
             WHERE
             R.CUIIO IS NOT NULL
             AND TRIM(R.CAEM2) <> TRIM(FC.CAEM2);
             
             
             
             
             SELECT            DISTINCT
                   FC.CUIIO,
                   FC.CUIIO_VERS,
                   R.CAEM2
              FROM
              (
              SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS.FORM_CUIIO
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= 480
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE
             FC.FORM IN (:pFORM) AND FC.STATUT <> '3'
             ) FC
             INNER JOIN CIS.RENIM R ON R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS
             
             
             WHERE 
             R.CAEM2 IS NULL 