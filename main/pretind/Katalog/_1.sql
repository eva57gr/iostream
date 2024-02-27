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
  L.CUIIO_VERS,
  L.DENUMIRE,
  L.CUATM,
  L.CFP,
  L.CFOJ,
  L.CAEM2,
  4 ID_SCHEMA   


                   FROM USER_BANCU.KAT_116  L

                    LEFT JOIN USER_EREPORTING.RENIM_EXTRA R ON R.CUIIO = L.CUIIO AND R.CUIIO_VERS = L.CUIIO_VERS 
                    
                    WHERE
                    R.CUIIO IS  NULL ;
                    
                    
                    
                    
--                    
--                    SELECT  
--                      L.CUIIO
--  
--
--                   FROM USER_BANCU.BE L 