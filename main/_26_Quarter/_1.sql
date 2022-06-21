--INSERT INTO CIS2.MD_TABLES (
--  ID_MDTABLE,
--  TABELE,        
--  TABELE_VERS,   
--  FORM,          
--  FORM_VERS,     
--  DENUMIRE,      
--  DEN_SHORT,     
--  NIVELRAIONAL,  
--  ORDINE,        
--  DATA_REG,      
--  STATUT,        
--  HTML_HEADER,   
--  SQL_TEXT,      
--  SQL_TEXT1,     
--  LANDSCAPE,     
--  COL_NUM,       
--  FOOTNOTE,      
--  UM,            
--  CREATING 
--) 
--



SELECT
  ID_MDTABLE,
  TABELE,        
  TABELE_VERS,   
  FORM,          
  FORM_VERS,     
  DENUMIRE,      
  DEN_SHORT,     
  NIVELRAIONAL,  
  ORDINE,        
  DATA_REG,      
  STATUT,        
  HTML_HEADER,   
  SQL_TEXT,      
  SQL_TEXT1,     
  LANDSCAPE,     
  COL_NUM,       
  FOOTNOTE,      
  UM,            
  CREATING      
  
  FROM  CIS2.MD_TABLES 
  
  
  WHERE 
 FORM = 26
 
 AND STATUT = '1'
 AND DEN_SHORT NOT IN ('Tab.1')
  
 
 ORDER BY
 ORDINE 
  