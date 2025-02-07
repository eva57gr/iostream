
--INSERT INTO CIS2.FORM_CUIIO 
--(
--
--                   CUIIO,
--                   CUIIO_VERS,
--                   FORM,
--                   FORM_VERS,
--                   STATUT
--                   
--)



            SELECT 
                   FC.CUIIO,
                   2013 CUIIO_VERS,
                   63 FORM,
                   2000  FORM_VERS,
                   '1' STATUT
                   
                   FROM  USER_BANCU.R_63 FC
