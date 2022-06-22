
SELECT P.PERIOADA, P.TIP_PERIOADA, P.ANUL
  FROM CIS.MD_PERIOADA  P
       INNER JOIN
       (SELECT P.PERIOADA,
               P.TIP_PERIOADA,
               P.ANUL,
               (CASE
                    WHEN P.NUM = 1 THEN 3
                    WHEN P.NUM = 2 THEN 3
                    WHEN P.NUM = 4 THEN 3
                    WHEN P.NUM = 5 THEN 3
                    WHEN P.NUM = 7 THEN 6
                    WHEN P.NUM = 8 THEN 6
                    WHEN P.NUM = 10 THEN 9
                    WHEN P.NUM = 11 THEN 9
                    ELSE P.NUM
                END)
                   NUM
          FROM CIS.MD_PERIOADA P
         WHERE P.PERIOADA = :pPERIOADA) PP
           ON     P.NUM = PP.NUM
              AND P.TIP_PERIOADA = PP.TIP_PERIOADA
              AND P.ANUL = PP.ANUL