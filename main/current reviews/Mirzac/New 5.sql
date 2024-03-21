SELECT     
           MD.DEN_SHORT,
           COUNT (DISTINCT FC.CUIIO) AS COL1,
           NULL AS COL2 
           
          
    
           
      FROM (
      
  SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                         
              
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA_LUNA  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (:pFORM) 
             AND FC.STATUT <> '3' ) FC  INNER JOIN CIS2.MD_FORM MD ON MD.FORM = FC.FORM AND 
                                                                       MD.FORM_VERS = FC.FORM_VERS


  
                                                                       GROUP BY 
                                                                       
                                                             MD.DEN_SHORT

UNION 

SELECT 
  
     MD.DEN_SHORT,
     NULL AS COL1, 
    COUNT (DISTINCT  D.CUIIO )  AS  COL2
 

         
         
    FROM (SELECT DISTINCT D.CUIIO,
                          D.CUIIO_VERS,
                          D.CUATM,
                          D.FORM,
                          D.FORM_VERS
            FROM CIS2.VW_DATA_ALL D
               -- 
                 
           WHERE D.PERIOADA = :pPERIOADA_LUNA AND D.FORM IN (:pFORM)
             
           ) D    INNER JOIN CIS2.MD_FORM MD ON MD.FORM = D.FORM AND 
                                                                       MD.FORM_VERS = D.FORM_VERS
                                                                       
                                                                       
                                                                       GROUP BY 
                                                                       
                                                             MD.DEN_SHORT

      
      