SELECT * 

FROM CIS2.MD_TABLES

WHERE 



FORM = 26
--
AND 

(

-- I'm doing it right ? 
-- It starts with -- Tab.1 
-- In Oracle


TRIM(DEN_SHORT) LIKE  'Tab.1%'



--OR 
--DEN_SHORT LIKE  'Tab.5%'



)