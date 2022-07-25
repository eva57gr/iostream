



                SELECT 
                
    DISTINCT 
    D.CUIIO,
    R.DENUMIRE,

    D.CUATM,
    D.CUATM_FULL,
    
    D.DATA_REG,
    
  
    D.COL4,
   
   
    D.COL31,
 
    D.COL33,
    T_XML_FORM_ID,
    F.STATUS
 
   

                FROM USER_EREPORTING.VW_DATA_ALL D
                            INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS 
                            INNER JOIN USER_EREPORTING.F_XML_FORMS F ON F.FORMID = D.T_XML_FORM_ID AND F.STATUS = '5'
                
                WHERE 
                D.PERIOADA IN (:pPERIOADA)
                AND D.FORM  IN (:pFORM)
                
                
        GROUP BY 
        D.CUIIO,
        R.DENUMIRE,
         F.STATUS,

    D.CUATM,
    D.CUATM_FULL,
    
    D.DATA_REG,
    
  
    D.COL4,
   
   
    D.COL31,
 
    D.COL33,
    T_XML_FORM_ID
                
                HAVING 
                
                    COL4 IS NULL 
   
   
    AND COL31 IS NULL 
 
    AND COL33 IS null  
    
    
    
            ORDER BY 
                DATA_REG DESC,
                CUATM