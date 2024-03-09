 SELECT D.*

       FROM CIS2.VW_DATA_ALL_GC  D
       
       WHERE 
       D.PERIOADA IN (:pPERIOADA)
       AND D.FORM IN (:pFORM)