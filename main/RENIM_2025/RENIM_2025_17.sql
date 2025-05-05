 SELECT 
 
        L.CUIIO,
        L.CUIIO_VERS,
        
        RTRIM(TRIM(L.IDNO)) AS IDNO
         FROM  CIS2.RENIM L
        
        WHERE
        L.CUIIO_VERS >= 2013 AND 
        L.IDNO IS  NULL
        
        
        
        
        GROUP BY 
         L.CUIIO,
        L.CUIIO_VERS,
        
        RTRIM(TRIM(L.IDNO))
        
        HAVING 
        LENGTH(L.IDNO) = 13
        
        ORDER BY        
        IDNO;
        
        
        
        
--         SELECT 
-- 
--        L.CUIIO,
--        L.CUIIO_VERS,
--        L.DENUMIRE,
--        L.CUATM,
--        L.CFP,
--        L.CFOJ,
--        L.CAEM2,
--        L.IDNO
--         FROM  USER_BANCU.AGRO_16_17 L
        
        