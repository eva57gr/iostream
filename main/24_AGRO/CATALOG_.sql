

--In Oracle 
--I'll exclude the last 2 digits for column CUIIO

SELECT 
CUIIO,
SUBSTR(CUIIO, 1, LENGTH(CUIIO) - 2) AS CUIIO_TRIMMED 
FROM USER_BANCU.IDNO

