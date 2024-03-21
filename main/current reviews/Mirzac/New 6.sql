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