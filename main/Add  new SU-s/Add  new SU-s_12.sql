-- INSERT INTO CIS2.FORM_CUIIO R (
--        CUIIO,
--        CUIIO_VERS,
--        FORM,
--        FORM_VERS,
--        STATUT 
--)



 SELECT 
 
        L.CUIIO,
        2011 CUIIO_VERS,
         4  FORM,
        2000    FORM_VERS,
        '1' STATUT
 FROM  USER_BANCU.ADD_NEW_SU  L 
 WHERE 

CUIIO  NOT  IN (

SELECT CUIIO 
 FROM  CIS2.FORM_CUIIO 
 WHERE 

CUIIO  IN  (


SELECT CUIIO
        FROM USER_BANCU.ADD_NEW_SU
        
        
        
)

AND FORM = 4

AND  CUIIO_VERS = 2011 



) 