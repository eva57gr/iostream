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
          1=1  
--
AND STATUS  =  '5' 
--AND 
--
----
AND  DATA_REG >= TO_DATE('01/20/2024 00:00:', 'MM/DD/YYYY HH24:MI:SS')
--------------------------------------------------------
--AND   CUIIO IN (
--
-- 41255321
--)
--  AND 
--  
--  FORM_TYPE = '1-ac'
----  OR 
AND   FORM_TYPE IN  ('24_agr_24') 
--   
--AND CUIIO IN (
--40583939,
--41583965
--)  
  
  
--  GROUP BY
--   FORMID,
----  XML,
--  STATUS,
--  FORM_TYPE,
--  DATA_REG,
--  CHECK_CONFIRM,
--  MESAJ,
--  CUIIO,
--    LENGTH(CUIIO) STR_CUIIO,
--  SEND_REQUEST,
--  SEND_ATTEMPTS,
--  PROCESSING_MESSAGE
  



 ORDER BY 
 
DATA_REG DESC 