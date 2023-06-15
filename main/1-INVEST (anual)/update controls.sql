UPDATE CIS2.MD_CONTROL
SET 
  SQL_TEXT = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(SQL_TEXT, 'OR :CUIIO = -1', ''), 'OR :FORM = -1', ''),'OR :FORM_VERS = -1',''),'OR :CUIIO_VERS = -1',''),'OR :CAPITOL_VERS = -1','')
WHERE 
  (
          INSTR(SQL_TEXT, 'OR :CUIIO = -1') > 0
           OR 
           INSTR(SQL_TEXT, 'OR :FORM = -1') > 0
           OR 
           INSTR(SQL_TEXT, 'OR :FORM_VERS = -1') > 0
           OR  
           INSTR(SQL_TEXT, 'OR :CUIIO_VERS = -1') > 0
           OR  
           INSTR(SQL_TEXT, 'OR :CAPITOL_VERS = -1') > 0
           
  )
  AND FORM = 67
  AND STATUT = '1'
  
  
--  AND CONTROL IN (
----    '67-130',
----    '67-017',
----    '67-014',
----    '67-015',
----    '67-016'
--
--
--'67-144',
--'67-145',
--'67-032',
--'67-033',
--'67-060'
--
--  );