--UPDATE USER_EREPORTING.FORM_CUIIO_EXTRA
--
--SET STATUT = '3'

SELECT *
----
----
    FROM USER_EREPORTING.FORM_CUIIO_EXTRA
    
    WHERE
    1=1 
    
    AND 
    
    CUIIO IN (
    SELECT
L.CUIIO
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
             WHERE FC.FORM IN (:pFORM)  AND FC.STATUT <> '3' 
             
             
             
             
             ) L 
             
             
             LEFT JOIN (


SELECT
  D.CUIIO,
  D.CUIIO_VERS,
  D.DENUMIRE,
  D.CUATM,
  -- CUATM_4,
  --L.CODUL7 CUATM,  
  D.CFP,
  D.CFOJ,
  D.COCM,
  D.CAEM2,
  D.CAEM,
  D.IDNO    

FROM USER_BANCU.KAT_114 D


             ) R ON R.CUIIO = L.CUIIO 
             
             
             WHERE 
             R.CUIIO IS   NULL 
    ) 
    
    AND FORM IN (114)
    
    AND CUIIO_VERS = 2013 
    AND FORM_VERS = 2000
    AND STATUT = '1'
    AND ID_SCHEMA = 4
    