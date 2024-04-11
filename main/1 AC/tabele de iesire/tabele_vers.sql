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
                    FROM CIS2.MD_TABLES D
                    
                                INNER JOIN (
                                SELECT 
  TABELE,
  MAX(TABELE_VERS) TABELE_VERS 
 
                    FROM CIS2.MD_TABLES
                   WHERE
                    FORM = 15

GROUP BY 
TABELE
            
      
                                )DD  ON DD.TABELE = D.TABELE 
                                
                                AND DD.TABELE_VERS = D.TABELE_VERS 
                    
                    
                    WHERE
                    D.FORM = 15
                    
                    ORDER BY
                    D.ORDINE