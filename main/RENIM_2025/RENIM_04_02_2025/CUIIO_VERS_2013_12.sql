------------------------------------------------------------------------------------
--INSERT INTO CIS2.FORM_CUIIO R (
--        CUIIO,
--        CUIIO_VERS,
--        FORM,
--        FORM_VERS,
--        STATUT 
--)





SELECT   
        L.CUIIO
      
         
         FROM USER_BANCU.VINZARI_21 L LEFT JOIN (SELECT CUIIO 

FROM CIS2.FORM_CUIIO 

WHERE

CUIIO IN (

SELECT 
CUIIO
FROM  VINZARI_21

)

AND 

CUIIO_VERS IN (1065)
AND FORM IN (26)) R ON R.CUIIO = L.CUIIO 

WHERE 
R.CUIIO IS NULL 

;

SELECT CUIIO 

FROM CIS2.FORM_CUIIO 

WHERE

CUIIO IN (

SELECT 
CUIIO
FROM  VINZARI_21

)

AND 

CUIIO_VERS IN (1065)
AND FORM IN (26)
         
