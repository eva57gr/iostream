 SELECT 
 
        L.CUIIO L_CUIIO,
        D.CUIIO,
        L.CUATM
       
        FROM  USER_BANCU.RENIM_24 L LEFT JOIN  USER_BANCU.RENIM_24 D ON L.CUIIO LIKE  D.CUIIO||'%' ;
        
        --Daca D.CUIIO are 10 caractere se elimeni ultimile 2 caractere daca nu nu il adaugi 
        
        -- Scrie un case when ca asa conditie si pune in like ;
        
        
        SELECT 
    D.CUIIO,
    CASE 
        WHEN LENGTH(D.CUIIO) = 10 THEN SUBSTR(D.CUIIO, 1, LENGTH(D.CUIIO) - 2) 
        ELSE TO_CHAR(D.CUIIO)  
    END AS CONDITION
FROM 
    USER_BANCU.RENIM_24 D
    
    ;
