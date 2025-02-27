INSERT INTO  USER_EREPORTING.FORM_CUIIO_EXTRA (

                   CUIIO,
                   CUIIO_VERS,
                   FORM,
                   FORM_VERS,
                   STATUT,
                   ID_SCHEMA
)

SELECT             FC.CUIIO,
                   480 CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT,
                   FC.ID_SCHEMA
              FROM (

SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT,
                   FC.ID_SCHEMA
              FROM USER_EREPORTING.FORM_CUIIO_EXTRA  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM USER_EREPORTING.FORM_CUIIO_EXTRA
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (:pFORM)  AND FC.STATUT <> '3' ) FC 
             
             WHERE
             
             FC.CUIIO_VERS <>  480