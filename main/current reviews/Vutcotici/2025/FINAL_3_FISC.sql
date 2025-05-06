SELECT 
  f.FORMID,
  f.STATUS,
  f.FORM_TYPE,
  f.DATA_REG,
  f.CHECK_CONFIRM,
  f.MESAJ,
  f.CUIIO AS CUIIO_DB,
  f.SEND_REQUEST,
  f.SEND_ATTEMPTS,
  f.PROCESSING_MESSAGE,
  x.name AS NAME,
  x.fisc AS FISC,
  x.cuatm AS CUATM,
  x.fiscal AS FISCAL,
  x.cfp AS CFP,
  x.cfoj AS CFOJ,
  x.caem AS CAEM,
  x.codFiscal AS CODFISCAL,
  x.telefon AS TELEFON,
  x.cuio AS CUIO,
  x.adres AS ADRES,
  x.director AS DIRECTOR,
  x.datefisc AS DATEFISC
FROM USER_EREPORTING.F_XML_FORMS f,
     XMLTABLE(
       '/dec'
       PASSING XMLTYPE(f.XML)
       COLUMNS
         name       VARCHAR2(200) PATH 'fiscCod/name',
         fisc       VARCHAR2(20)  PATH 'fiscCod/fisc',
         cuatm      VARCHAR2(20)  PATH 'fiscCod/cuatm',
         fiscal     VARCHAR2(20)  PATH 'fiscCod/fiscal',
         cfp        VARCHAR2(20)  PATH 'fiscCod/cfp',
         cfoj       VARCHAR2(20)  PATH 'fiscCod/cfoj',
         caem       VARCHAR2(20)  PATH 'fiscCod/caem',
         codFiscal  VARCHAR2(20)  PATH 'fiscCod/codFiscal',
         telefon    VARCHAR2(20)  PATH 'fiscCod/telefon',
         cuio       VARCHAR2(20)  PATH 'fiscCod/cuio',
         adres      VARCHAR2(500) PATH 'group2/adres',
         director   VARCHAR2(200) PATH 'director/director',
         datefisc   VARCHAR2(20)  PATH 'peroidnalog/datefisc'
     ) x
WHERE 


--f.FORMID = 24662237

 f.DATA_REG >= TO_DATE('05/06/2025 00:00:00', 'MM/DD/YYYY HH24:MI:SS')
 
 --AND   f.STATUS  NOT IN  ('5') 

--AND x.CUATM LIKE '01%'

ORDER BY
f.DATA_REG DESC 