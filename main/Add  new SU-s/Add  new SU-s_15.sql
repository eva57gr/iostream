-- UPDATE CIS2.FORM_CUIIO
SELECT * 
  --  SET STATUT = '3'     
    from CIS2.FORM_CUIIO 
    
    WHERE 

CUIIO IN (

SELECT 
        L.CUIIO
        

        
        FROM 


(


SELECT   


  
         R.CUIIO  CUIIO       
      --   L.CUIIO  CUIIO
         
         FROM (

SELECT     R.CUIIO,
           R.CUIIO_VERS
          
      FROM (SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (44) AND CUIIO_VERS <= 1056
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (44) AND FC.STATUT <> '3') FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS) ) R 
               
               LEFT   JOIN (
               
               SELECT CUIIO
               
        FROM USER_BANCU.ADD_EI_78_23
               ) L ON L.CUIIO = R.CUIIO
               
               
               WHERE 
               L.CUIIO IS   NULL  
             

  ) L   ) 
  

 AND FORM = 44 
--  
--  
  AND CUIIO_VERS = 1056
    AND FORM_VERS = 1004 
  AND STATUT = '1' 
               
               
               
              