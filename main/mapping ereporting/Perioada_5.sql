SELECT
          P.PERIOADA 
          --INTO vPERIOADA
        FROM
          MD_PERIOADA P
        WHERE
          P.TIP_PERIOADA IN (:vTIP_PERIOADA) AND
          P.ANUL||'_'||P.NUM IN (SELECT  EXTRACT(XMLTYPE(XML), '/dec/DataSet/Header/YEAR/text()')||'_'||
                             EXTRACT(XMLTYPE(XML), '/dec/DataSet/Header/TRIM/text()') FROM F_XML_FORMS WHERE FORMID IN (20584567));