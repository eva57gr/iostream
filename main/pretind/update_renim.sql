       
        UPDATE  USER_BANCU.GAZ
        SET
         CUATM = CASE WHEN (LENGTH(CUATM) = 6 AND (SUBSTR(CUATM,1,1) = 1  OR SUBSTR(CUATM,1,1) = 3 )) THEN '0'||CUATM ELSE CUATM END,
         CUIIO_VERS = 2012
         
        --CUATM = '0'||REPLACE(CUATM,'O','0')
--        ,
--          CUATM  = '0'||CUATM
        ;
        
        
        
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
        FROM USER_BANCU.GAZ L
        
        WHERE 
        1=1
        -- L.CUIIO = 4130138667
        
        GROUP BY 
        L.CUIIO
        
        HAVING 
        COUNT (L.CUIIO) > 1