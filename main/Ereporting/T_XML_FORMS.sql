--Din TO_DATE('10/23/2023 00:00:00') 
--sunt  10540 cu statut 5 si 
--  aproximativ 33340 -cu statut 2 
-- Executa SQL si o sa vezi. 

SELECT 
 FORMID,
--  XML,
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
          
          
          WHERE
          1=1 AND 
--
--AND STATUS  =  '5' AND 
--
--
 DATA_REG >= TO_DATE('03/01/2023 00:00:', 'MM/DD/YYYY HH24:MI:SS')

-- AND CUIIO = 13706
  AND 
  (
--  FORM_TYPE = '16_agr_23'
--  OR 
  FORM_TYPE = '1-ac' 
  ) 
  
  
  
  GROUP BY
   FORMID,
--  XML,
  STATUS,
  FORM_TYPE,
  DATA_REG,
  CHECK_CONFIRM,
  MESAJ,
  CUIIO,
--    LENGTH(CUIIO) STR_CUIIO,
  SEND_REQUEST,
  SEND_ATTEMPTS,
  PROCESSING_MESSAGE
  



 ORDER BY 
 
DATA_REG DESC 