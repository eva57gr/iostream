--INSERT INTO CIS2.FORM_CUIIO R (
--        CUIIO,
--        CUIIO_VERS,
--        FORM,
--        FORM_VERS,
--        STATUT 
--)
--



SELECT 
        L.CUIIO,
        L.CUIIO_VERS,
        37 FORM,
        1800    FORM_VERS,
        '1' STATUT
        
        FROM USER_BANCU.LIV_2 L
        
        
        WHERE 
        
        L.CUIIO NOT IN (
        
        37545579,
37757620,
37761691,
38861868,
38991631,
40104442,
40192920,
40286182,
40442274,
40590038,
40605693,
40672347,
40800199,
41269518,
41294092,
41406398,
4062229571

        )


