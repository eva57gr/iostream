SELECT *
        
        
          FROM  USER_EREPORTING.F_XML_FORMS
          
          
          WHERE
          
          FORM_TYPE = 'ei-78'
 AND DATA_REG > TO_DATE('04/24/2023 00:00:00', 'MM/DD/YYYY HH24:MI:SS')
---- --AND 
--FORMID IN  (19017594)
 AND STATUS IN  (4,2)
 
 ORDER BY 
 
 DATA_REG DESC