DELETE

--SELECT 
--  ID_MD,
--  FORM,
--  FORM_VERS,
--  CAPITOL,
--  CAPITOL_VERS,
--  RIND,
--  RIND_VERS,
--  DENUMIRE,
--  DECIMAL_POS,
--  COL_ACTIV,
--  ORDINE,
--  DATA_REG,
--  STATUT,
--  DINAMIC  


FROM CIS2.MD_RIND
WHERE
capitol=1049 AND capitol_vers=2013
and statut  = '1'

and

(ordine >= 1.1 and ordine < 3 )


AND ROWNUM <= 1




--AND ID_MD IN (
--
--80122,
--80123,
--80124,
--80125,
--80130,
--80131,
--80132,
--80133,
--80134,
--80135,
--80136
--)