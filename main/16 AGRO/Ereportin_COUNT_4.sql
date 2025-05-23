SELECT 
  REGEXP_SUBSTR(x.XML_NODE_NAME, 'R[0-9]+') AS MOD_XML_NODE_NAME,
  x.XML_NODE_NAME,
  x.XML_NODE_VALUE,
  h.CUIIO AS XML_CUIIO,
  h.ENT_NAME AS DENUMIRE,
  h.IDNO AS XML_IDNO,
  f.DATA_REG AS DATA_REG
FROM F_XML_FORMS f,
     XMLTABLE(
       '/dec/DataSet/Header'
       PASSING XMLTYPE(f.XML)
       COLUMNS 
         CUIIO VARCHAR2(20) PATH 'CUIIO',
         IDNO  VARCHAR2(20) PATH 'IDNO',
         ENT_NAME  VARCHAR2(20) PATH 'ENT_NAME'
         
        
         
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
  )
  
  
  
  ORDER BY
  f.DATA_REG DESC 
