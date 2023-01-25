 SELECT 
 
        L.CUIIO,
        COUNT (L.CUIIO)  AS CNT
--        L.CUIIO_VERS,
--        L.DENUMIRE,
--        L.CUATM,
--        L.CFP,
--        L.CFOJ,
--        L.CAEM2,
--        L.IDNO
        FROM USER_BANCU.ADD_NEW_ASA_2022 L
        
         GROUP BY 
         L.CUIIO 
         
         HAVING 
         
        COUNT (L.CUIIO) > 1  