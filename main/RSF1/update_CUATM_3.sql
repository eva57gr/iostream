 SELECT *
        FROM USER_BANCU.RSF_CUATM
        
        
        ORDER BY 
        CUATM DESC
        ;
        
        
        
                UPDATE USER_BANCU.RSF_CUATM
      --  SET CUATM = CASE WHEN (LENGTH(CUATM) = 6 AND (SUBSTR(CUATM,1,1) = 1  OR SUBSTR(CUATM,1,1) = 3 )) THEN '0'||CUATM ELSE CUATM END,
        SET   CUIIO_VERS = 2011
        --CUATM = '0'||REPLACE(CUATM,'O','0')
--        ,
--          CUATM  = '0'||CUATM
        ;
        