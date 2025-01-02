INSERT INTO USER_BANCU.KATALOG_24_2013
(
CUIIO,
             CUIIO_VERS,
             DENUMIRE,
             CUATM,
             CFP,
             CFOJ,
             CAEM2,
             IDNO
)

SELECT       CUIIO,
             CUIIO_VERS,
             DENUMIRE,
             CUATM,
             CFP,
             CFOJ,
             CAEM2,
             IDNO
 FROM USER_BANCU.VW_KAT_24_AGRO_2013
 
-- WHERE
-- CUIIO LIKE  5922460||'%'