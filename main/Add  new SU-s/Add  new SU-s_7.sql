--
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
        26 FORM,
        1004   FORM_VERS,
        '1' STATUT
       
        FROM --USER_BANCU.ADD_NEW_SU L
          RENIM L 
        
        WHERE 
        
CUIIO IN (
41428030,
40966698,
41446825,
41509075,
41479138,
41509081,
41560426,
41267229,
40874743,
37107520,
41154175,
41191182,
38500857

) 


 AND 
 
 CUIIO_VERS IN (1053)                                