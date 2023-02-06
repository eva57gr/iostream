--
-- INSERT INTO CIS2.FORM_CUIIO R (
--        CUIIO,
--        CUIIO_VERS,
--        FORM,
--        FORM_VERS,
--        STATUT 
--)

        SELECT 
        CUIIO,
        CUIIO_VERS,
        FORM,
        2000    FORM_VERS, 
        STATUT    

        FROM USER_BANCU.FORM_CUIIO_ASC