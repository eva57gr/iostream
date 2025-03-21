SELECT -------------------------------------------------------------------
---- FORMID,
----  XML,
--  STATUS,
 DISTINCT  FORM_TYPE
        
        
          FROM  USER_EREPORTING.F_XML_FORMS
          
          ----------------------------------------------
          --------------------------------------------------
          ------------------------------------------------------------
          
          WHERE
          1=1  
----
--AND STATUS  =  '5' 
----AND 
--
----
AND  DATA_REG >= TO_DATE('03/18/2025 00:00:', 'MM/DD/YYYY HH24:MI:SS')
--------------------------------------------------------

  
----  
--AND   FORM_TYPE = '1-inf.rev' --------------------
----  OR 
--AND   FORM_TYPE IN  ('6_nr_25') 
--   
--AND CUIIO IN (
--40583939,
--41583965
--)  
  
  -------------------
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
  



-- ORDER BY 
-- 
--DATA_REG DESC 