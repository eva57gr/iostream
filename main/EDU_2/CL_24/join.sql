  SELECT 
  L.NR_ROW L_NR_ROW,
  R.NR_ROW R_NR_ROW,
  L.COD_SPEC,
  R.ITEM_CODE,
  L.DENUMIRE,
  L.GROUP_SPEC,
  L.STATUT,
  L.ORDINE, 
  L.NIVEL  
        FROM (
        SELECT 
  ROWNUM NR_ROW,
  L.COD_SPEC,
  L.DENUMIRE,
  L.GROUP_SPEC,
  L.STATUT,
  L.ORDINE, 
  L.NIVEL
  
  FROM
(
  SELECT 
  L.COD_SPEC,
  L.DENUMIRE,
  L.GROUP_SPEC,
  L.STATUT,
  L.ORDINE, 
  L.NIVEL  
        FROM USER_BANCU.CL_SPEC_2EDU_24 L 
        
        ORDER BY 
        ORDINE
) L
        ) L  LEFT JOIN (
        
 SELECT
   ROWNUM NR_ROW,
 ITEM_CODE,
 ITEM_PARENT,
 NAME,
 SHOW_ORDER
 FROM

( 
 SELECT 
 ITEM_CODE,
 ITEM_PARENT,
 NAME,
 SHOW_ORDER
        FROM CIS2.CLS_CLASS_ITEM
        
        WHERE
        
        CLASS_CODE = 'SPEC_2EDU' 
        
        
        
        ORDER BY 
        SHOW_ORDER

)
        
        ) R ON (TRIM(L.NR_ROW) = TRIM(R.NR_ROW)) 
        
--        WHERE
--        R.ITEM_CODE IS NULL 
        


GROUP BY
  L.COD_SPEC,
  R.ITEM_CODE,
  L.DENUMIRE,
  L.GROUP_SPEC,
  L.STATUT,
  L.ORDINE, 
  L.NIVEL, 
  L.NR_ROW,
  R.NR_ROW
  
  
  ORDER BY
  L.ORDINE
