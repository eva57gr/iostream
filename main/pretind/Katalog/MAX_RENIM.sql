--INSERT INTO USER_EREPORTING.RENIM_EXTRA
--(
--  CUIIO,
--  CUIIO_VERS,
--  DENUMIRE,
--  CUATM,
--  CFP,
--  CFOJ,
--  CAEM2,
--  ID_SCHEMA   
--)

SELECT     
           
           R.CUIIO,
           2012 CUIIO_VERS,
           R.DENUMIRE,
           R.CUATM,
           R.CFP,
           R.CFOJ,
           R.CAEM2,
           R.ID_SCHEMA
           
           FROM

(
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
           INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) AS CUIIO_VERS
                           FROM USER_EREPORTING.RENIM_EXTRA
                       GROUP BY CUIIO) A
               ON (A.CUIIO = R.CUIIO AND A.CUIIO_VERS = R.CUIIO_VERS) ) R



WHERE 
R.CUIIO IN (

SELECT FC.CUIIO
              FROM USER_EREPORTING.FORM_CUIIO_EXTRA  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM USER_EREPORTING.FORM_CUIIO_EXTRA
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (:pFORM)  AND FC.STATUT <> '3' 

)


AND R.CUIIO_VERS <> 2012