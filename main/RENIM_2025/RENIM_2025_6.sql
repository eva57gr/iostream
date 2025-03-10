 
        DELETE 
        FROM  USER_BANCU.AGRO_36
        WHERE 
        
        CUIIO IS NULL
        
        ;
 
 
 SELECT *
        FROM  USER_BANCU.AGRO_36
        WHERE 
        
        CUIIO IS NOT NULL
        
        ;
        
--        
--        ORDER BY 
--        CUATM DESC  -- 41042980 -   44-0022
        ;
       --
       --Add some more logic here.
--If the CUATM column starts with 'O' then replace it with '0' if not then no
        UPDATE USER_BANCU.ADD_NEW_SU_M3_2024
        SET
         CUATM = CASE WHEN (LENGTH(CUATM) = 6 AND (SUBSTR(CUATM,1,1) = 1  OR SUBSTR(CUATM,1,1) = 3 )) THEN '0'||CUATM ELSE CUATM END;
        -- CUIIO_VERS = 1064;
        -- CFOJ = '420'
        --CUATM = '0'||REPLACE(CUATM,'O','0')
--        ,
--          CUATM  = '0'||CUATM
        ;
        
        
        UPDATE USER_BANCU.AUTO_65
SET CUATM = CASE 
              WHEN LENGTH(CUATM) = 6 AND (SUBSTR(CUATM,1,1) = '1' OR SUBSTR(CUATM,1,1) = '3') 
                THEN '0' || CUATM
              WHEN SUBSTR(CUATM, 1, 1) = 'O' 
                THEN '0' || SUBSTR(CUATM, 2) 
              ELSE CUATM 
            END;


UPDATE USER_BANCU.AGRO_24
SET CUATM = 
    CASE 
        -- Ruleaza prima verificare: înlocuie?te 'O' cu '0'
        WHEN SUBSTR(CUATM, 1, 1) = 'O' THEN 
            '0' || SUBSTR(CUATM, 2)  -- Concateneaza '0' cu restul ?irului
        -- Apoi verifica daca trebuie adaugat '0' în fa?a
        WHEN LENGTH(CUATM) = 6 AND SUBSTR(CUATM, 1, 1) IN ('1', '3') THEN 
            '0' || CUATM  -- Prepand '0'
        -- Daca nici o condi?ie nu este îndeplinita, pastreaza valoarea
        ELSE 
            CUATM
    END;
        -----------------------------------------------------
             SELECT *
               FROM USER_BANCU.ADD_NEW_SU_M3_2024
               
               ;
        
        
        
        
      SELECT 
      CUIIO,
      '0'||REPLACE(CUATM,'O','0') CUATM_REPLACE,
      CUATM              
        FROM USER_BANCU.ADD_NEW_SU;
        
        
        
        
        SELECT 
        CUIIO,
        COUNT (CUIIO ) AS CNT
        
        FROM USER_BANCU.RSF_1
        
        GROUP BY 
        CUIIO
        
        HAVING 
        COUNT (CUIIO ) > 1 
        ORDER BY 
        
        COUNT (CUIIO )
        