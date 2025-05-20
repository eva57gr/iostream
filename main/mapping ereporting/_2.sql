SELECT 
              XML_NODE_NAME,
              XML_NODE_VALUE
            FROM 
              XMLTABLE('//dec/DataSet/Data/*' PASSING   
                (SELECT  xmltype(XML) FROM F_XML_FORMS WHERE FORMID IN (24374011))
                 COLUMNS 
                 XML_NODE_NAME VARCHAR2(100) PATH 'name()',
                 XML_NODE_VALUE VARCHAR2(100) PATH 'text()' 
            )