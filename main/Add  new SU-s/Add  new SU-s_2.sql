 SELECT *
        FROM USER_BANCU.ADD_NEW_SU
        
        
        ORDER BY 
        CUATM DESC
        ;
--        
        UPDATE USER_BANCU.ADD_NEW_SU 
        
        SET CUIIO_VERS = 2011,
        CUATM = '0'||REPLACE(CUATM,'O','0')
--        ,
--          CUATM  = '0'||CUATM
        ;
        
        
             SELECT CUIIO
        FROM USER_BANCU.ADD_NEW_SU;
        
        
        
      SELECT 
      CUIIO,
      '0'||REPLACE(CUATM,'O','0') CUATM_REPLACE,
      CUATM              
        FROM USER_BANCU.ADD_NEW_SU