SELECT D.*
               FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
               
               WHERE 
               D.PERIOADA IN (:pPERIOADA)
               
               AND D.FORM IN (:pFORM)
               
               AND  D.CAPITOL IN  (1,14) 
               
               AND D.CAPITOL NOT  IN  (405,407)
               