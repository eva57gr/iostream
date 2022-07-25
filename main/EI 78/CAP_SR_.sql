



                SELECT 
                
    DISTINCT CUIIO,

    CUATM,
    CUATM_FULL,
    
    DATA_REG,
    
  
    COL4,
   
   
    COL31,
 
    COL33
 
   

                FROM USER_EREPORTING.VW_DATA_ALL D
                
                WHERE 
                D.PERIOADA IN (:pPERIOADA)
                AND D.FORM  IN (:pFORM)
                
                
        GROUP BY 
        CUIIO,

    CUATM,
    CUATM_FULL,
    
    DATA_REG,
    
  
    COL4,
   
   
    COL31,
 
    COL33
                
                HAVING 
                
                    COL4 IS NULL 
   
   
    AND COL31 IS NULL 
 
    AND COL33 IS null  
    
            ORDER BY 
                DATA_REG DESC,
                CUATM