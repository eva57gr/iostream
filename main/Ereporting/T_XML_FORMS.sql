SELECT *
        
        
          FROM  USER_EREPORTING.F_XML_FORMS
          
          
          WHERE
          
          FORM_TYPE = 'rsf1-presc'
 AND DATA_REG > TO_DATE('05/05/2023 00:00:00', 'MM/DD/YYYY HH24:MI:SS')
---- --AND 
--FORMID IN  (19017594)
 AND STATUS IN  (5)
 
 ORDER BY 
 
 DATA_REG DESC