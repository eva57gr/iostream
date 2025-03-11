CREATE TABLE CIS2_RENIM
AS
SELECT R.*
                FROM CIS2.RENIM R INNER JOIN USER_BANCU.AGRO_16 L ON R.CUIIO = L.CUIIO AND 
                R.CUIIO_VERS = L.CUIIO_VERS;
                
                SELECT *
                FROM CIS2_RENIM

                