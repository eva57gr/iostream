
SELECT * 

FROM USER_BANCU.F_XML_FORMS;


--INSERT INTO USER_BANCU.F_XML_FORMS
--(
--FORMID,
-- XML,
--  STATUS,
--  FORM_TYPE,
--  DATA_REG,
--  CHECK_CONFIRM,
--  MESAJ,
--  CUIIO,
--  --  LENGTH(CUIIO) STR_CUIIO,
--  SEND_REQUEST,
--  SEND_ATTEMPTS,
--  PROCESSING_MESSAGE 
--)


SELECT -------------------------------------------------------------------
 FORMID,
 XML,
  STATUS,
  FORM_TYPE,
  DATA_REG,
  CHECK_CONFIRM,
  MESAJ,
  CUIIO,
  --  LENGTH(CUIIO) STR_CUIIO,
  SEND_REQUEST,
  SEND_ATTEMPTS,
  PROCESSING_MESSAGE 
 
        
        
          FROM  USER_EREPORTING.F_XML_FORMS
          
          ----------------------------------------------
          --------------------------------------------------
          ------------------------------------------------------------
          
          WHERE
          1=1  
          
         -- AND STATUS  =  '4' 

----
----
AND  DATA_REG >= TO_DATE('05/01/2025 00:00:', 'MM/DD/YYYY HH24:MI:SS')
----
--AND STATUS  =  '2'  -- 553 
----------------------------------
------
------
--AND  DATA_REG >= TO_DATE('04/30/2025 00:00:', 'MM/DD/YYYY HH24:MI:SS')
--------------------------------------------------------

  
--------  
AND   FORM_TYPE = '5-ci-23' --------------------

AND CUIIO IN  (20271764,41261178)


 ORDER BY 
-- 
DATA_REG DESC 