INSERT INTO USER_BANCU.XPATH (

IDNO, 
CUIIO_VERS,
CUIIO
)


SELECT 
  x.XML_NODE_NAME IDNO,
  x.XML_NODE_VALUE CUIIO_VERS,
  h.CUIIO AS CUIIO
 
FROM F_XML_FORMS f,
     XMLTABLE(
       '/dec/DataSet/Header'
       PASSING XMLTYPE(f.XML)
       COLUMNS 
         CUIIO VARCHAR2(20) PATH 'CUIIO'
        
      
         
        
         
     ) h,
     XMLTABLE(
       '//dec/DataSet/Data/*'
       PASSING XMLTYPE(f.XML)
       COLUMNS 
         XML_NODE_NAME  VARCHAR2(100) PATH 'name()',
         XML_NODE_VALUE VARCHAR2(100) PATH 'text()'
     ) x
WHERE 
--  f.DATA_REG >= TO_DATE('01/01/2025 00:00:00', 'MM/DD/YYYY HH24:MI:SS')
--  
--  AND f.STATUS = 5
  
  --AND 
  f.FORMID IN (
  SELECT CUIIO   FORMID
            FROM 
            USER_BANCU.F_XML_FORMS
            
--            WHERE 
--            CUIIO = 23504983
  )
  
  
GROUP BY

  x.XML_NODE_NAME,
  x.XML_NODE_VALUE,
  h.CUIIO

HAVING
x.XML_NODE_VALUE IS NOT NULL  