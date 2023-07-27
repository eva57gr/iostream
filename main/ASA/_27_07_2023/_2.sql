SELECT
  DISTINCT
      D.CUIIO
       FROM  CIS2.VW_DATA_ALL D
          WHERE
           D.FORM = 64
           AND D.PERIOADA = 2011


           GROUP BY
                D.CUIIO
           HAVING
           SUM(CASE WHEN  D.CAPITOL = 1180   THEN NVAL(D.COL1) ELSE 0 END ) > 0
             ORDER BY
               D.CUIIO