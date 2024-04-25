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
  
  
  SELECT 
  CUIIO 
  FROM USER_BANCU.CTIF_16_AGRO
  
  )
  
  
  
  GROUP BY
 FORMID,
   CUIIO,
   STATUS,
   FORM_TYPE


