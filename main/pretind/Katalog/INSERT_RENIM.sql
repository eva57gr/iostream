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
           480 CUIIO_VERS,
           TRIM(R.DENUMIRE) DENUMIRE, 
           TRIM(R.CUATM) CUATM,
           TRIM(R.CFP) ,
           R.CFOJ,
           R.CAEM2,
           R.ID_SCHEMA


--            FC.CUIIO,
--                   FC.CUIIO_VERS,
--                   FC.FORM,
--                   FC.FORM_VERS,
--                   FC.STATUT,
--                   FC.ID_SCHEMA
              FROM
(
SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT,
                   FC.ID_SCHEMA
              FROM USER_EREPORTING.FORM_CUIIO_EXTRA  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM USER_EREPORTING.FORM_CUIIO_EXTRA
                                  WHERE FORM IN (110) AND CUIIO_VERS <= 480
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (110)  AND FC.STATUT <> '3' 
             
             ) FC LEFT JOIN USER_EREPORTING.RENIM_EXTRA R ON R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS 
             
             
   WHERE 
  R.CUIIO 
  
  
   
   
--   --AND
--    R.CUIIO_VERS <>  480