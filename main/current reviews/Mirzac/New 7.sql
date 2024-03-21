SELECT
         
 
 NULL AS   COL1,
 NULL AS   COL2,
 COUNT (DISTINCT CASE WHEN D.FORM  = :pFORM THEN  D.CUIIO END)  AS  COL3,
  NULL AS COL4,
  NULL AS COL5




         
         
    FROM (
    
    SELECT DISTINCT D.CUIIO,
                          D.CUIIO_VERS,
                          D.CUATM,
                          D.FORM
            FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
               
                 
           WHERE D.PERIOADA  = :pPERIOADA_LUNA   AND D.FORM IN (:pFORM)
             AND D.ID_SCHEMA = 2
             
                 
           ) D
        


order by 
codul