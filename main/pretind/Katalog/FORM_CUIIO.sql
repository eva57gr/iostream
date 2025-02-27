
      SELECT 
                   FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT,
                   FC.ID_SCHEMA
              FROM(

            SELECT 
                   FC.CUIIO,
                   480 CUIIO_VERS ,
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
             WHERE FC.FORM IN (:pFORM)  AND FC.STATUT <> '3'  
--             AND FC.CUIIO_VERS <> 444
             
             ) FC LEFT JOIN (
             
             SELECT     
           
           R.CUIIO,
           R.CUIIO_VERS,
           R.DENUMIRE,
           R.CUATM,
           R.CFP,
           R.CFOJ,
           R.CAEM2,
           R.ID_SCHEMA
           
      FROM USER_EREPORTING.RENIM_EXTRA  R
             ) R ON R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS 
             
             
             WHERE 
             
             R.CUIIO IS   NULL 