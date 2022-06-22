SELECT 
C.CODUL,
C.FULL_CODE,
NULL AS COL1,
NULL AS COL2,
NULL AS COL3,
NULL AS COL4,
NULL AS COL5,
NULL AS COL6,
NULL AS COL7,
COUNT (DISTINCT CASE WHEN D.FORM  = 5 THEN  D.CUIIO END ) AS COL8,
NULL AS COL9,
NULL AS COL10,
COUNT (DISTINCT CASE WHEN D.FORM  = 2 THEN  D.CUIIO END ) AS COL11,
NULL AS COL12


FROM
(
SELECT
DISTINCT D.CUIIO,
D.CUIIO_VERS,
D.CUATM,

D.FORM


    FROM CIS.VW_DATA_ALL D
        INNER JOIN CIS2.VW_CL_CUATM C ON D.CUATM = C.CODUL 
        
        INNER JOIN (
        
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
        ) MP ON  MP.PERIOADA = D.PERIOADA 
    
    WHERE 
    
        D.PERIOADA = MP.PERIOADA
    AND 
    
     D.FORM IN  (5,2)
    ) D
    
    
      INNER JOIN CIS.VW_CL_CUATM C   ON C.CODUL = D.CUATM
GROUP BY 

C.CODUL,
C.FULL_CODE