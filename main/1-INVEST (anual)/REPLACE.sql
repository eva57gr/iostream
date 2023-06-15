-- In Oracle
--I need to search in column CLOB if  exist 'OR :CUIIO = -1'
-- replace with  ''. 


SELECT * 
        
        
           FROM  CIS2.MD_CONTROL
           
           WHERE 
           
           ( 
           
--           INSTR(SQL_TEXT, 'OR :CUIIO = -1') > 0
--           OR 
--           INSTR(SQL_TEXT, 'OR :FORM = -1') > 0
--           OR 
--           INSTR(SQL_TEXT, 'OR :FORM_VERS = -1') > 0
--           OR  
--           INSTR(SQL_TEXT, 'OR :CUIIO_VERS = -1') > 0
--           OR  
           INSTR(SQL_TEXT, 'OR :CAPITOL_VERS = -1') = 0
           
           
           
           )
            
            AND FORM = 67
            AND STATUT = '1'
            
            
            
            ORDER BY 
            CONTROL ;