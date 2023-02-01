 SELECT 
 
        L.CUIIO,
        
        COUNT (L.CUIIO) AS CNT
--        L.CUIIO_VERS,
--        L.DENUMIRE,
--        L.CUATM,
--        L.CFP,
--     --   L.CFOJ,
--        L.CAEM2
--      --  L.IDNO
        FROM USER_BANCU.ADD_PRODMOLD_22 L
        
        WHERE 
        1=1
        -- L.CUIIO = 4130138667
        
        GROUP BY 
        L.CUIIO
        
        HAVING 
        COUNT (L.CUIIO) > 1