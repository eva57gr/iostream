 SELECT *
        FROM USER_BANCU.ADD_NEW_SU_M3_2024
        
        
        ORDER BY 
        CUATM DESC
        ;
--        
        UPDATE USER_BANCU.ADD_NEW_SU_M3_2024
      --SET CUATM = CASE WHEN (LENGTH(CUATM) = 6 AND (SUBSTR(CUATM,1,1) = 1  OR SUBSTR(CUATM,1,1) = 3 )) THEN '0'||CUATM ELSE CUATM END
       SET CUIIO_VERS = 2013
        --CUATM = '0'||REPLACE(CUATM,'O','0')
--        ,
--          CUATM  = '0'||CUATM
        ;
        
        
            -- SELECT CUIIO
            DELETE
        FROM USER_BANCU.ADD_NEW_SU_M3_2024;
        
        
        
      SELECT 
      CUIIO,
      '0'||REPLACE(CUATM,'O','0') CUATM_REPLACE,
      CUATM              
        FROM USER_BANCU.ADD_NEW_SU;
        
        
        
        
        SELECT 
        CUIIO,
        COUNT (CUIIO ) AS CNT
        
        FROM USER_BANCU.ADD_NEW_SU
        
        GROUP BY 
        CUIIO
        
        ORDER BY 
        
        COUNT (CUIIO )
        