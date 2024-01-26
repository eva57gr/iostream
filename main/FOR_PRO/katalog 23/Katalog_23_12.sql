INSERT INTO CIS2.FORM_CUIIO R (
        CUIIO,
        CUIIO_VERS,
        FORM,
        FORM_VERS,
        STATUT 
)




SELECT 
       L.CUIIO,
        2012 CUIIO_VERS,
        16 FORM,
        2000    FORM_VERS,
        '1' STATUT
        
        FROM 


(


            SELECT 
         --   FC.CUIIO FC_CUIIO,
            R.CUIIO 
            -- R_CUIIO
                 
              FROM
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
             ) FC RIGHT  JOIN 
             
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
        FROM  USER_BANCU.FOR_PRO_2 L
             ) R ON R.CUIIO = FC.CUIIO
             
             
             WHERE 
             
             FC.CUIIO IS NULL  
             
             
             
   
               ) L  
              
               
               
              