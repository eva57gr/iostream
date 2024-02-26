SELECT 
D.CUIIO,
D.IDNO,
D.DENUMIRE,
D.CUATM,
D.RIND,
D.COL1 AS COL1

FROM


(
SELECT 
D.CUIIO,
D.IDNO,
D.DENUMIRE,
D.CUATM,
D.RIND,
D.COL1 AS COL1 

FROM

(

SELECT 
D.NEW_CUIIO CUIIO,
D.IDNO,
D.DENUMIRE,
D.CUATM,
D.RIND,
D.COL1 AS COL1 

FROM
(
SELECT 
D.CUIIO,
CASE WHEN 
SUBSTR(TO_CHAR(D.CUIIO), -2) = SUBSTR(TO_CHAR(D.CUATM), 1,2) THEN 
SUBSTR(TO_CHAR(D.CUIIO), 1, LENGTH(TO_CHAR(D.CUIIO)) - 2) ELSE TO_CHAR(D.CUIIO) END  AS NEW_CUIIO,
R.IDNO,
R.DENUMIRE,
D.CUATM,
D.RIND,
SUM(D.COL1) AS COL1 

FROM CIS2.VW_DATA_ALL D 
        INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS 

        

WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND
  D.FORM IN (45)                
  AND D.RIND IN ('1440')
  
 --  AND D.CUIIO  LIKE '%'||41070998||'%' 
  
GROUP BY 
D.CUIIO,
R.IDNO,
R.DENUMIRE,
D.CUATM,
D.RIND

  
  ORDER BY
  
   D.CUIIO
   
   ) D
   ) D
   
   
   WHERE 
   
   D.IDNO IS NULL 
   
)  D  LEFT JOIN (

SELECT 
          R.CUIIO,
          R.CUIIO_VERS,
--           57 FORM,
--           2009 FORM_VERS,
--           '1' STATUT 

           R.IDNO
--           
           
      FROM (SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (57) AND 
                                  FORM_VERS = 2009 AND 
                                  CUIIO_VERS <= 2012
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (57) 
             AND FC.STATUT <> '3'
             AND FC.FORM_VERS = 2009
             
             ) FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
               
               WHERE
               1=1


) L ON D.CUIIO = L.CUIIO 


WHERE 
L.CUIIO  IS NULL 