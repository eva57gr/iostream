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
        63 FORM,
        2000    FORM_VERS,
        '1' STATUT
        
        FROM  CIS2.RENIM L
        
        WHERE
        
        L.CUIIO IN (
        
         SELECT CUIIO
        FROM USER_BANCU.RSF_1
        )
        
        AND CUIIO_VERS IN (2012)        

        AND CUIIO NOT IN (
        40618678,
40994602,
41069015,
41154241,
41582899,
41642696,
41678978,
41695132,
41700241,
41707154
        )


