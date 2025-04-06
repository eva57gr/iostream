SELECT C.CODUL,
         C.FULL_CODE,
         
 
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
                 INNER JOIN CIS.VW_CL_CUATM C ON D.CUATM = C.CODUL
                 
           WHERE D.PERIOADA  = :pPERIOADA_LUNA   AND D.FORM IN (:pFORM)
             AND D.ID_SCHEMA = 1
             
              AND (D.DATA_REG  > TO_DATE('03/01/2025 00:00:00', 'MM/DD/YYYY HH24:MI:SS') AND D.DATA_REG  <   TO_DATE('03/31/2025 23:59:59', 'MM/DD/YYYY HH24:MI:SS'))
                 
           ) D
         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
GROUP BY C.CODUL, C.FULL_CODE
