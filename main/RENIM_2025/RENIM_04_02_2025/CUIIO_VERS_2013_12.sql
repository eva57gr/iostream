----------------------------------------------------------------------------------
INSERT INTO CIS2.FORM_CUIIO R (
        CUIIO,
        CUIIO_VERS,
        FORM,
        FORM_VERS,
        STATUT 
)





SELECT   
        L.CUIIO,
        2013 CUIIO_VERS,
        57 FORM,
        2009 FORM_VERS,
        '1' STATUT 
      
         
         FROM USER_BANCU.RENIM_2024 L LEFT JOIN (SELECT CUIIO 

FROM CIS2.FORM_CUIIO 

WHERE

CUIIO IN (

SELECT 
CUIIO
FROM  RENIM_2024

)

AND 

CUIIO_VERS IN (2013)
AND FORM IN (57)
AND FORM_VERS = 2009
) R ON R.CUIIO = L.CUIIO 

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
         
