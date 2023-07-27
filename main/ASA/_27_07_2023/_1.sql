SELECT
  DISTINCT
      D.CUIIO
       FROM  CIS2.VW_DATA_ALL D
          WHERE
           D.FORM = 64
           AND D.PERIOADA = 2011
           AND   D.CAPITOL = 1180

           GROUP BY
                D.CUIIO
           HAVING
           SUM(D.COL1) > 0
             ORDER BY
               D.CUIIO