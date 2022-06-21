
SELECT 
CC.CODUL,
CC.DENUMIRE,
CC.FULL_CODE,
SUM(L.COL1) AS COL1,
SUM(L.COL2) AS COL2,
SUM(L.COL3) AS COL3

FROM 

(
SELECT 
FC.CUATM,
COUNT (DISTINCT CASE WHEN FC.FORM  = :pFORM THEN  FC.CUIIO END ) AS COL1,
NULL AS COL2,
NULL AS COL3

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
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA 
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (:pFORM) AND FC.STATUT <> '3') FC
           INNER JOIN CIS.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
               
               ) FC 
               
              
               GROUP BY 
               FC.CUATM
               
               
               UNION 
               
               
               SELECT 
D.CUATM,
NULL AS COL1,
COUNT (DISTINCT CASE WHEN D.FORM  = :pFORM THEN  D.CUIIO END ) AS COL2,
NULL AS COL3

FROM
(
SELECT
DISTINCT D.CUIIO,
D.CUIIO_VERS,
D.CUATM,
--C.FULL_CODE,
D.FORM


    FROM CIS.VW_DATA_ALL D
        INNER JOIN CIS2.VW_CL_CUATM C ON D.CUATM = C.CODUL 
    
    WHERE 
    
    D.PERIOADA = :pPERIOADA 
    AND D.FORM = :pFORM
    ) D
    
    
GROUP BY 

D.CUATM



UNION 

SELECT 
D.CUATM,
NULL AS COL1,
NULL AS COL2,
COUNT (DISTINCT CASE WHEN D.FORM  = :pFORM THEN  D.CUIIO END ) AS COL3

FROM
(
SELECT
DISTINCT D.CUIIO,
D.CUIIO_VERS,
D.CUATM,
--C.FULL_CODE,
D.FORM


    FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
        INNER JOIN CIS2.VW_CL_CUATM C ON D.CUATM = C.CODUL 
    
    WHERE 
    
    D.PERIOADA = :pPERIOADA 
    AND D.FORM = :pFORM
    ) D
    
GROUP BY 

D.CUATM
        
      


                
    
     ) L
     
     INNER JOIN CIS.VW_CL_CUATM C   ON C.CODUL = L.CUATM
     INNER JOIN CIS.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')
     
     WHERE 
     
     CC.PRGS IN('2')
     group by 
      CC.CODUL,
      CC.DENUMIRE,
      CC.FULL_CODE
      
      ORDER BY
      CC.FULL_CODE