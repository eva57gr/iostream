 SELECT *
        FROM USER_BANCU.AGRO_4;
        
--        
--        ORDER BY 
--        CUATM DESC  -- 41042980 -   44-0022
        ;
       
        UPDATE USER_BANCU.AGRO_4
        SET
--         CUATM = CASE WHEN (LENGTH(CUATM) = 6 AND (SUBSTR(CUATM,1,1) = 1  OR SUBSTR(CUATM,1,1) = 3 )) THEN '0'||CUATM ELSE CUATM END
         CUIIO_VERS = 1061
        --CUATM = '0'||REPLACE(CUATM,'O','0')
--        ,
--          CUATM  = '0'||CUATM
        ;
        