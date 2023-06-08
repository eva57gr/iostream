--INSERT INTO CIS2.FORM_CUIIO R (
--        CUIIO,
--        CUIIO_VERS,
--        FORM,
--        FORM_VERS,
--        STATUT 
--)




SELECT 
        L.CUIIO,
        L.CUIIO_VERS,
        37 FORM,
        1800    FORM_VERS,
        '1' STATUT
        
        FROM USER_BANCU.LIV_2 L
        
        
        WHERE 
        
        L.CUIIO NOT IN (
        
       108016,
37757703,
37787986,
38176090,
38994121,
40273083,
40502036,
40530771,
40547748,
41216962,
41478222


        )


