--Din TO_DATE('10/23/2023 00:00:00') 
--sunt  10540 cu statut 5 si 
--  aproximativ 33340 -cu statut 2 
-- Executa SQL si o sa vezi. 

SELECT 
 FORMID,
  XML,
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

 
--  FORM_TYPE = 'ei-78'
-- AND STATUS <> '5' AND   

--AND 

(STATUS = '2' 

--OR STATUS = '5'

) 

AND 

(


--I'm looking for between 23 and 24. Did I write the code correctly in SQL for Oracle?

DATA_REG >= TO_DATE('10/23/2023 00:00:', 'MM/DD/YYYY HH24:MI:SS')


--AND 
--
--DATA_REG < TO_DATE('10/25/2023 00:00:', 'MM/DD/YYYY HH24:MI:SS')



--TO_DATE('10/23/2023 00:00:00', 'MM/DD/YYYY HH24:MI:SS') 

--AND   DATA_REG < TO_DATE('10/24/2023 00:00:00', 'MM/DD/YYYY HH24:MI:SS')
)
 
-- AND PROCESSING_MESSAGE = 'OK'


 ORDER BY 
 
DATA_REG ASC 