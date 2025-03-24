-- Oracle
SELECT 
  D.ID_MDTABLE,
  D.TABELE,
  D.TABELE_VERS,
  D.FORM,
  D.FORM_VERS,
  D.DENUMIRE,
  D.DEN_SHORT,
  D.NIVELRAIONAL,
  D.ORDINE,
  D.DATA_REG,
  D.STATUT,
  D.HTML_HEADER,
  D.SQL_TEXT,
  D.SQL_TEXT1,
  D.LANDSCAPE,
  D.COL_NUM,
  D.FOOTNOTE,
  D.UM,
  D.CREATING 

-----------------------------------------------------------------------------------
FROM  CIS2.MD_TABLES D  -------------------------------s-------------------------------------

    INNER JOIN ( 
SELECT 
    TABELE, 
    MAX(TABELE_VERS)  TABELE_VERS
    FROM CIS2.MD_TABLES D 
    
    WHERE 
    D.FORM = 43
    
    
    GROUP BY 
    TABELE ) DD ON D.TABELE = DD.TABELE AND D.TABELE_VERS = DD.TABELE_VERS 
    
    
    
    
    WHERE 
    D.FORM IN (:pFORM)
    AND D.STATUT IN ('1') -- This parameter it is varchar. How correctly wirite
    
    ORDER BY
    D.ORDINE
                
                
                        