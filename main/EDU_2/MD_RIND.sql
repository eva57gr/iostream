SELECT 
  ID_MD,
  FORM,
  FORM_VERS,
  CAPITOL,
  CAPITOL_VERS,
  RIND,
  RIND_VERS,
  DENUMIRE,
  DECIMAL_POS,
  COL_ACTIV,
  ORDINE,
  DATA_REG,
  STATUT,
  DINAMIC  

FROM CIS2.MD_RIND 
            WHERE 
            
                
            capitol=1049 AND capitol_vers=2013
            
            AND RIND not   IN ('010','020','030','035','040','050','060','070','-')
            
            and ORDINE < 67
            
            ORDER BY 
            ORDINE