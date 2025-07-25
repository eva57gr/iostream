SELECT 
 T.NR_ROW,
 SUM(T.COL1) AS COL1,
 SUM(T.COL2) AS COL2
FROM
(
     SELECT
      T.NR_ROW,
      T.COL1 AS COL1,
      T.COL2 AS COL2
    FROM CIS2.TABLE_OUT T
    WHERE
      T.COD_CUATM IN (:pCOD_CUATM)  AND
      T.FORM = :pFORM         AND
      T.ID_MDTABLE = 13754   AND      
      T.PERIOADA = (:pPERIOADA-1)
    UNION   
   -- 13753
--13766
  
    SELECT
      T.NR_ROW,
      T.COL1 AS COL1,
      T.COL2 AS COL2
    FROM CIS2.TABLE_OUT T
    WHERE
      T.COD_CUATM IN (:pCOD_CUATM)  AND
      T.FORM = :pFORM         AND
      T.ID_MDTABLE = 13049   AND      
      T.PERIOADA = (:pPERIOADA-5) 
      
      )  T
      
      GROUP BY
      
     T.NR_ROW
    
    
    