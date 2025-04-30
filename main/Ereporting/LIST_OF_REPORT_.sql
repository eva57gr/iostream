SELECT -------------------------------------------------------------------
 FORMID,
  STATUS,
  FORM_TYPE,
  DATA_REG,
  CHECK_CONFIRM,
  MESAJ,
  CUIIO,
    LENGTH(CUIIO) STR_CUIIO,
  SEND_REQUEST,
  SEND_ATTEMPTS,
  PROCESSING_MESSAGE 
 
        
        
          FROM  USER_EREPORTING.F_XML_FORMS
          
          ----------------------------------------------
          --------------------------------------------------
          ------------------------------------------------------------
          
          WHERE
          1=1  
----
AND STATUS  =  '5' 

----
----
AND  DATA_REG >= TO_DATE('04/30/2025 00:00:', 'MM/DD/YYYY HH24:MI:SS')
--------------------------------------------------------

  
--------  
AND   FORM_TYPE = 'm1' --------------------




 ORDER BY 
-- 
DATA_REG DESC 