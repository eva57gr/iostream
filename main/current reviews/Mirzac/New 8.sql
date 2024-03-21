SELECT 
  
     MD.DEN_SHORT,
     NULL AS COL1, 
    COUNT (DISTINCT  D.CUIIO )  AS  COL2
 

         
         
    FROM (SELECT DISTINCT D.CUIIO,
                          D.CUIIO_VERS,
                          D.CUATM,
                          D.FORM,
                          D.FORM_VERS
            FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
                            INNER JOIN CIS2.VW_DATA_ALL DD ON DD.CUIIO = DD.CUIIO AND DD.CUIIO_VERS = DD.CUIIO_VERS AND DD.FORM = D.FORM  
               -- 
                 
           WHERE D.PERIOADA = :pPERIOADA_LUNA AND D.FORM IN (:pFORM)
            AND D.ID_SCHEMA = 2
             
           ) D    INNER JOIN CIS2.MD_FORM MD ON MD.FORM = D.FORM AND 
                                                                       MD.FORM_VERS = D.FORM_VERS
                                                                       
                                                                       
                                                                       GROUP BY 
                                                                       
                                                             MD.DEN_SHORT