INSERT INTO CIS2.FORM_CUIIO 
(
  CUIIO,  
  CUIIO_VERS,
  FORM,        
  FORM_VERS,
  STATUT    

)
   
   
   
   SELECT 
          D.CUIIO CUIIO,
          2011 CUIIO_VERS,
          39 FORM,
          2000 FORM_VERS,
          '1' STATUT    
 
          
                
  FROM USER_BANCU.VW_KATALOG_29_AGRO_TRIM_4_22 D 
  
  LEFT JOIN

(

SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (:pFORM) AND FC.STATUT <> '3'
             
             
) R ON D.CUIIO = R.CUIIO 


WHERE 

R.CUIIO IS NULL 