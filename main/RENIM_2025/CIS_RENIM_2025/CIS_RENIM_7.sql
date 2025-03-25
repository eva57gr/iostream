UPDATE USER_BANCU."16_AGRO"
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