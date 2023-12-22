


SELECT 
D.T_XML_FORM_ID,
--D.CUIIO,

        COUNT (DISTINCT D.CUIIO) AS CNT 
        
        FROM

(
SELECT 
        DISTINCT 
        D.T_XML_FORM_ID,
        D.CUIIO
      
        
        FROM USER_EREPORTING.VW_DATA_ALL_FR_PRIMIT D
        
        WHERE 
        
        D.FORM IN (:pFORM)
        
        AND D.PERIOADA IN (:pPERIOADA)
        
        
         GROUP BY 
         
         D.CUIIO,
        T_XML_FORM_ID
     
        

ORDER BY 

 D.CUIIO,
        T_XML_FORM_ID


        
     
        
        ) D
        
        
        GROUP BY 
        D.T_XML_FORM_ID
--        D.CUIIO
        
        
         HAVING 
        
        COUNT (DISTINCT D.CUIIO) > 1 
        
--        ORDER BY 
--     COUNT (D.CUIIO) DESC 

