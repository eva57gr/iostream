SELECT -------------------------------------------------------------------
  DISTINCT FORM_TYPE,
  STATUS,
  COUNT (DISTINCT FORMID) AS CNT
       
          FROM  USER_EREPORTING.F_XML_FORMS
       -------------------------------------------------   
   ---------------------------       
          WHERE
          1=1  
----
--AND STATUS  =  '2' 

----
----
AND  DATA_REG >= TO_DATE('05/21/2025 00:00:', 'MM/DD/YYYY HH24:MI:SS')
--------------------------------------------------------


GROUP BY
FORM_TYPE,
STATUS

HAVING 
STATUS = '2'
-- 
--
----AND   
--FORM_TYPE = 'ei-78'
--
--AND CUIIO IN (
--40761950,
--41166623,
--2738276,
--41506645
--)
ORDER BY 
FORM_TYPE
------  
--AND   FORM_TYPE = 'm3' --------------------




-- ORDER BY 
---- 
--DATA_REG DESC 