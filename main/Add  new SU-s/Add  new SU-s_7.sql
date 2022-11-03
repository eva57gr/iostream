
INSERT INTO CIS2.FORM_CUIIO R (
        CUIIO,
        CUIIO_VERS,
        FORM,
        FORM_VERS,
        STATUT 
)



 SELECT 
 
        L.CUIIO,
        L.CUIIO_VERS,
        39 FORM,
        2000    FORM_VERS,
        '1' STATUT
       
        FROM --USER_BANCU.ADD_NEW_SU L

               CIS2.RENIM     L  
        WHERE 
   
        
L.CUIIO IN (
37107520,
38500857,
40874743,
41154175,
41191182,
41392880,
41428030,
41509075,
41509081,
41523371,
41560426,
2039356267,
4074522467,
4091605167,
4129008567,
4137332267,
4143030467,
4146944767,
4149110667,
4150610267

)
        AND CUIIO_VERS IN (2011)
               
               
              
        
                                        