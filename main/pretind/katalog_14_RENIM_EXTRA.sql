INSERT INTO USER_EREPORTING.RENIM_EXTRA
(
  CUIIO,
  CUIIO_VERS,
  DENUMIRE,
  CUATM,
  CFP,
  CFOJ,
  CAEM2,
  ID_SCHEMA   
)
SELECT  
  L.CUIIO,
  2012 CUIIO_VERS,
  L.DENUMIRE,
  L.CUATM,
  L.CFP,
  L.CFOJ,
  L.CAEM2,
  4 ID_SCHEMA   


                   FROM 
                   

 -- USER_BANCU.KAT_1_RE  L
                   
                   USER_EREPORTING.RENIM_EXTRA L
                   
                   
                   
                   
                   
                   WHERE 
                   
                   L.CUIIO IN (
                   
SELECT FC.CUIIO
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
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (:pFORM)  AND FC.STATUT <> '3' ) FC
             
             
             
             WHERE 
             
             FC.CUIIO_VERS <> 2012
                   )
                   
                   
                   AND L.CUIIO_VERS <>   2012 
                   
                   
--                   USER_BANCU.KAT_1_RE  L
--
--                    LEFT JOIN USER_EREPORTING.RENIM_EXTRA R ON R.CUIIO = L.CUIIO AND R.CUIIO_VERS = L.CUIIO_VERS 
--                    
--                    WHERE
--                    R.CUIIO IS NULL 