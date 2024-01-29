--UPDATE CIS.FORM_CUIIO
SELECT * 
--   SET STATUT = '3'     
    from CIS.FORM_CUIIO 
    
    WHERE 



                  CUIIO IN (
                    
SELECT 
            FC.CUIIO 
          
                 
              FROM
              (
      
      
      SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS.FORM_CUIIO
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (:pFORM) AND FC.STATUT <> '3'
             ) FC LEFT  JOIN 
             
             (
             SELECT 
 
        L.CUIIO,
        L.CUIIO_VERS,
        L.DENUMIRE,
        L.CUATM,
        L.CFP,
        L.CFOJ,
        L.CAEM2,
        L.TIP ,
        L.BUGET
        FROM  USER_BANCU.INVEST_2_TRIM L
             ) R ON R.CUIIO = FC.CUIIO
             
             
             WHERE 
             
             R.CUIIO IS NULL                 


        
        ) 
        
        AND 
        
        (
        CUIIO_VERS  =  1060 
         
        ) 
  

 AND FORM = 6 
--  
--  
  AND CUIIO_VERS = 1060
    AND FORM_VERS = 1004 
  AND STATUT = '1' 
               
               
               
              