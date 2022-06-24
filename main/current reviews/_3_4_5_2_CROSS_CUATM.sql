
SELECT 
TO_NUMBER(CR.NR_ROW) AS ORDINE,
CR.NUME_ROW AS NR_ROW,

SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL1 ELSE NULL END ) AS COL1,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL2 ELSE NULL END ) AS COL2,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL3 ELSE NULL END ) AS COL3,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL4 ELSE NULL END ) AS COL4,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL5 ELSE NULL END ) AS COL5,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL6 ELSE NULL END ) AS COL6,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL7 ELSE NULL END ) AS COL7,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL8 ELSE NULL END ) AS COL8,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL9 ELSE NULL END ) AS COL9,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL10 ELSE NULL END ) AS COL10,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL11 ELSE NULL END ) AS COL11,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL12 ELSE NULL END ) AS COL12


FROM 

(
--1--
SELECT 
C.CODUL,
C.FULL_CODE,
COUNT (DISTINCT CASE WHEN FC.FORM  = 3 THEN  FC.CUIIO END ) AS COL1,
NULL AS COL2,
NULL AS COL3,
COUNT (DISTINCT CASE WHEN FC.FORM  = 4 THEN  FC.CUIIO END ) AS COL4,
NULL AS COL5,
NULL AS COL6,
NULL AS COL7,
NULL AS COL8,
NULL AS COL9,
NULL AS COL10,
NULL AS COL11,
NULL AS COL12
FROM 


(
SELECT     

           R.CUIIO,
           R. CUIIO_VERS,
           FC.FORM,
          
           R.CUATM
           
      FROM (SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS.FORM_CUIIO
                                  WHERE FORM IN (3,4) AND CUIIO_VERS <= :pPERIOADA 
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (3,4) AND FC.STATUT <> '3') FC
           INNER JOIN CIS.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
               
               ) FC 
          
               
                 INNER JOIN CIS.VW_CL_CUATM C   ON C.CODUL = FC.CUATM
              
               GROUP BY 
              C.CODUL,
              C.FULL_CODE
              
              
              
              
              UNION 
--2              
SELECT 
C.CODUL,
C.FULL_CODE,
NULL AS COL1,
COUNT (DISTINCT CASE WHEN D.FORM  = 3 THEN  D.CUIIO END ) AS COL2,
NULL AS COL3,
NULL AS COL4,
COUNT (DISTINCT CASE WHEN D.FORM  = 4 THEN  D.CUIIO END ) AS COL5,
NULL AS COL6,
NULL AS COL7,
NULL AS COL8,
NULL AS COL9,
NULL AS COL10,
NULL AS COL11,
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
    
    WHERE 
    
    D.PERIOADA = :pPERIOADA 
    AND 
    
    
    D.FORM IN  (3,4)
    ) D
    
    
      INNER JOIN CIS.VW_CL_CUATM C   ON C.CODUL = D.CUATM
GROUP BY 

C.CODUL,
C.FULL_CODE
        

UNION 
--3                
SELECT 
C.CODUL,
C.FULL_CODE,
NULL AS COL1,
NULL AS COL2,
COUNT (DISTINCT CASE WHEN D.FORM  = 3 THEN  D.CUIIO END ) AS COL3,
NULL AS COL4,
NULL AS COL5,
COUNT (DISTINCT CASE WHEN D.FORM  = 4 THEN  D.CUIIO END ) AS COL6,
NULL AS COL7,
NULL AS COL8,
NULL AS COL9,
NULL AS COL10,
NULL AS COL11,
NULL AS COL12



FROM
(
SELECT
DISTINCT D.CUIIO,
D.CUIIO_VERS,
D.CUATM,

D.FORM


    FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
        INNER JOIN CIS2.VW_CL_CUATM C ON D.CUATM = C.CODUL 
    
    WHERE 
    
    D.PERIOADA = :pPERIOADA 
    AND D.FORM IN  (3,4)
    ) D
    
    
      INNER JOIN CIS.VW_CL_CUATM C   ON C.CODUL = D.CUATM
GROUP BY 

C.CODUL,
C.FULL_CODE
        
--End 3 

       UNION 
--Start 4       
       SELECT 
C.CODUL,
C.FULL_CODE,

NULL AS COL1,
NULL AS COL2,
NULL AS COL3,
NULL AS COL4,
NULL AS COL5,
NULL AS COL6,

COUNT (DISTINCT CASE WHEN FC.FORM  = 5 THEN  FC.CUIIO END ) AS COL7,
NULL AS COL8,
NULL AS COL9,
COUNT (DISTINCT CASE WHEN FC.FORM  = 2 THEN  FC.CUIIO END ) AS COL10,
NULL AS COL11,
NULL AS COL12




FROM 


(
SELECT     

           R.CUIIO,
           R. CUIIO_VERS,
           FC.FORM,
          
           R.CUATM
           
      FROM (SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS.FORM_CUIIO
                                  WHERE FORM IN (2,5) AND CUIIO_VERS <= :pPERIOADA 
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (5,2) AND FC.STATUT <> '3') FC
           INNER JOIN CIS.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
               
               ) FC 
          
               
                 INNER JOIN CIS.VW_CL_CUATM C   ON C.CODUL = FC.CUATM
              
               GROUP BY 
              C.CODUL,
              C.FULL_CODE         
    
   --End 4           
              
   
   UNION 
   
   --Start 5
   
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
   
   --End 5
              
   UNION 
   --Start  6
         
   
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
NULL AS COL8,
COUNT (DISTINCT CASE WHEN D.FORM  = 5 THEN  D.CUIIO END ) AS COL9,
NULL AS COL10,
NULL AS COL11,
COUNT (DISTINCT CASE WHEN D.FORM  = 2 THEN  D.CUIIO END ) AS COL12



FROM
(
SELECT
DISTINCT D.CUIIO,
D.CUIIO_VERS,
D.CUATM,

D.FORM


    FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
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
              
              
              
              ) L
     
     INNER JOIN CIS.VW_CL_CUATM C   ON C.CODUL = L.CODUL
     CROSS JOIN (
     
     SELECT
      DECODE(CS.CODUL, 
      '0000000','01',
      '0100000','02',
      '1111111','03',
      '0300000','04',
      '1400000','05',
      '3400000','06',
      '3600000','07',
      '4100000','08',
      '4300000','09',
      '4500000','10',
      '4800000','11',
      '6200000','12',
      '6700000','13',
      '7100000','14',
      '7400000','15',
      '7800000','16',
      '8900000','17',
      '2222222','18',
      '1000000','19',
      '2500000','20',
     
      '2700000','21',
      '2900000','22',
      '3100000','23',
      '3800000','24',
      '5300000','25',
      '5500000','26',
      '6000000','27',
      '6400000','28',
      '8000000','29',
      '8300000','30',
      '8500000','31',
      '9200000','32',
      '3333333','33',
      '1200000','34',
      '1700000','35',
      '2100000','36',
      '5700000','37',
      '8700000','38',
      '9600000','39',
      '9601000','40',
      '9602000','41',
      '9603000','42'


      
      
      )
      AS NR_ROW,
      CS.DENUMIRE AS NUME_ROW,
      CS.CODUL AS CS_CUATM
    FROM
      VW_CL_CUATM CS
    WHERE
      CS.CODUL 
      IN(
         '0000000','0100000','1111111','0300000','1400000','3400000','3600000','4100000','4300000','4500000',
         '4800000','6200000','7100000','7400000','7800000','2222222','1000000','2500000','3100000','3800000',
         '5300000','5500000','6000000','6400000','6700000','8000000','8300000','8900000','9200000','3333333',
         '1200000','1700000','2100000','2700000','2900000','5700000','8500000','8700000','9600000','9601000',
         '9602000','9603000'
        )
        
      
     ) CR 
     
     WHERE 
     1=1
    
     group by 
    CR.NUME_ROW, 
    TO_NUMBER(CR.NR_ROW),
    CR.CS_CUATM 
      
      ORDER BY
      CR.NR_ROW