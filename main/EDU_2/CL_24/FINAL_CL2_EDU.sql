SELECT 
 ITEM_CODE,
 ITEM_PARENT,
 ITEM_PATH,
 NAME,
 SHOW_ORDER
        FROM CIS2.VW_CLS_CLASS_ITEM
        
        WHERE
        
        CLASS_CODE = 'SPEC_2EDU' 
        
        
        
        ORDER BY 
        SHOW_ORDER
