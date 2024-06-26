SELECT
         CASE
              WHEN TO_CHAR(D.PERIOADA) = '1057'  THEN 'TRM II 2023'
              WHEN TO_CHAR(D.PERIOADA) = '1058'  THEN 'TRM III 2023'
              WHEN TO_CHAR(D.PERIOADA) = '1059'  THEN 'TRM IV 2023'
              WHEN TO_CHAR(D.PERIOADA) = '1056'  THEN 'TRM I  2023'
         ELSE  TO_CHAR(D.PERIOADA) END TRIMESTRU,
       --  D.PERIOADA,
         D.UNIT_CODE,
         D.CUATM,
         D.RIND,
         SUM(D.COL3) AS COL1,
         SUM(D.COL4) AS COL2,
         SUM(D.COL5) AS COL3

FROM
  CIS2.VW_DATA_ALL_GC  D

  WHERE
  (D.PERIOADA IN (1059,1058,1057,1056))  AND
   D.FORM IN (:pFORM)
   AND D.CAPITOL IN (1198)
   



  GROUP BY
         D.PERIOADA,
         D.UNIT_CODE,
         D.CUATM,
         D.RIND


         ORDER BY
           D.UNIT_CODE,

         D.RIND