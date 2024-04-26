SELECT 
 FORMID,
   CUIIO,
   STATUS,
   FORM_TYPE
       FROM  USER_EREPORTING.F_XML_FORMS
          
          
          WHERE
            --STATUS  =  '5' AND   
            FORM_TYPE = '16_agr_23'


  
  
  AND CUIIO IN (
  
 
41124561
)
  
  
  
  GROUP BY
 FORMID,
   CUIIO,
   STATUS,
   FORM_TYPE


