UPDATE USER_BANCU.INOV_1 ----------------------
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
    
    
            UPDATE USER_BANCU.INOV_1
        SET
         CUATM = CASE WHEN (LENGTH(CUATM) = 6 AND (SUBSTR(CUATM,1,1) = 1  OR SUBSTR(CUATM,1,1) = 3 )) THEN '0'||CUATM ELSE CUATM END,
         CUIIO_VERS = 2013;
        -- CFOJ = '420'
        --CUATM = '0'||REPLACE(CUATM,'O','0')
--        ,
--          CUATM  = '0'||CUATM
        ;
        
        SELECT *
        FROM USER_BANCU.K_4_AGRO_96;