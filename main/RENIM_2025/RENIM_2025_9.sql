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
                   36 FORM,
                   2000  FORM_VERS,
                   '1' STATUT
                   
                   FROM  (
                   SELECT DISTINCT CUIIO
        FROM  USER_BANCU."16_AGRO"
                   ) FC



                WHERE 
                
                FC.CUIIO NOT IN (
                40872543,
40876179,
41210548

                )