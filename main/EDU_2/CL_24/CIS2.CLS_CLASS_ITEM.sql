
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