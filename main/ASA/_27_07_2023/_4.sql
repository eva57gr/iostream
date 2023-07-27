SELECT
  DISTINCT
      D.CUIIO,
      SUM(CASE WHEN  D.CAPITOL = 1124   THEN NVAL(D.COL1) ELSE 0 END ) AS RIND_150
       FROM  CIS2.VW_DATA_ALL D
          WHERE
           D.FORM = 64
           AND D.PERIOADA = 2011


           GROUP BY
                D.CUIIO
           HAVING
           SUM(CASE WHEN  D.CAPITOL = 1180   THEN NVAL(D.COL1) ELSE 0 END ) > 0
             ORDER BY
               D.CUIIO,
               SUM(CASE WHEN  D.CAPITOL = 1124   THEN NVAL(D.COL1) ELSE 0 END )