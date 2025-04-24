--Only CIS2
SELECT 
       C.CODUL,
       C.FULL_CODE,
 NULL AS COL1,
 NULL AS COL2,
 NULL AS COL3,
  NULL AS COL4,
  NULL AS COL5,
   COUNT (DISTINCT CASE WHEN D.FORM  = :pFORM THEN  D.CUIIO END)  AS  COL6


         
         
    FROM (
    
    SELECT DISTINCT D.CUIIO,
                          D.CUIIO_VERS,
                          R.CUATM,
                          D.FORM
            FROM CIS2.DATA_ALL D
             
                  INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS 
           WHERE D.PERIOADA = :pPERIOADA_LUNA AND D.FORM IN (:pFORM)
            AND D.DATA_REG  > TO_DATE('01/01/2025 00:00:00', 'MM/DD/YYYY HH24:MI:SS') 
           
             AND D.FORM_VERS IN (:pFORM_VERS)  
             
             AND D.CUIIO NOT IN (
            SELECT DISTINCT D.CUIIO
                          
                          
            FROM USER_EREPORTING.DATA_ALL_PRIMIT D
                                      --  INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS 
                
           WHERE 
             D.PERIOADA  = :pPERIOADA   AND D.FORM IN (:pFORM)
             AND D.ID_SCHEMA = '2'
             AND D.DATA_REG  > TO_DATE('01/01/2025 00:00:00', 'MM/DD/YYYY HH24:MI:SS') 
           
           )    
           
           ) D
         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
         
         
GROUP BY C.CODUL, C.FULL_CODE

--  End 2