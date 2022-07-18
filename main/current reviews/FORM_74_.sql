SELECT 
TO_NUMBER(CR.NR_ROW) AS ORDINE,
CR.NUME_ROW AS NR_ROW,



SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.AM_COL89 ELSE NULL END ) AS TRIM_2_Catalog,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.AM_COL90 ELSE NULL END ) AS TRIM_2_Cu_date,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.AM_COL91 ELSE NULL END ) AS TRIM_2_CTIF


FROM 

(
--1--

--Start RSFReprezentatnt

SELECT 
C.CODUL,
C.FULL_CODE,

 
 COUNT (DISTINCT CASE WHEN FC.FORM  = 74 THEN  FC.CUIIO END)  AS   AM_COL89,
 NULL AS AM_COL90,
 NULL AS AM_COL91
 
FROM 

(
SELECT     

           R.CUIIO,
           R. CUIIO_VERS,
           FC.FORM,
          
           R.CUATM
           
      FROM (
      
  SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                         
              
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (74) AND CUIIO_VERS <= :pPERIOADA_TRIM  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (74) AND FC.STATUT <> '3'
                        
             
             
             ) FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
               
               ) FC 
          
               
                 INNER JOIN CIS2.VW_CL_CUATM C   ON C.CODUL = FC.CUATM
              
               GROUP BY 
              C.CODUL,
              C.FULL_CODE
              
              UNION 

SELECT C.CODUL,
         C.FULL_CODE,
 NULL AS AM_COL89,
 COUNT (DISTINCT CASE WHEN D.FORM  = 74 THEN  D.CUIIO END)  AS  AM_COL90,
 NULL AS AM_COL91


         
         
    FROM (SELECT DISTINCT D.CUIIO,
                          D.CUIIO_VERS,
                          D.CUATM,
                          D.FORM
            FROM CIS2.VW_DATA_ALL D
                 INNER JOIN CIS2.VW_CL_CUATM C ON D.CUATM = C.CODUL
                 
           WHERE D.PERIOADA = :pPERIOADA_TRIM AND D.FORM IN (74)
             
           ) D
         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
GROUP BY C.CODUL, C.FULL_CODE

UNION 

  SELECT C.CODUL,
         C.FULL_CODE,
         
 
 NULL AS   AM_COL89,
 NULL AS   AM_COL90,
 COUNT (DISTINCT CASE WHEN D.FORM  = 74 THEN  D.CUIIO END)  AS  AM_COL91




         
         
    FROM (
    
    SELECT DISTINCT D.CUIIO,
                          D.CUIIO_VERS,
                          D.CUATM,
                          D.FORM
            FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
                 INNER JOIN CIS2.VW_CL_CUATM C ON D.CUATM = C.CODUL
                 
           WHERE D.PERIOADA  = :pPERIOADA_TRIM   AND D.FORM IN (74)
             AND D.ID_SCHEMA = 2
             
                 
           ) D
         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
GROUP BY C.CODUL, C.FULL_CODE
--End RSF Reprezentanta
              ) L
     
     INNER JOIN CIS.VW_CL_CUATM C   ON C.CODUL = L.CODUL
     CROSS JOIN (
     
     /* Formatted on 6/22/2022 4:39:31 PM (QP5 v5.326) */
SELECT
      DECODE(CS.CODUL, 
      '0000000','01','0100000','02','1111111','03','0300000','04',
      '1400000','05','3400000','06','3600000','07','4100000','08','4300000','09',
      '4500000','10','4800000','11','6200000','12','7100000','13','7400000','14',
      '7800000','15','2222222','16','1000000','17','2500000','18','3100000','19',
      '3800000','20','5300000','21','5500000','22','6000000','23','6400000','24',
      '6700000','25','8000000','26','8300000','27','8900000','28','9200000','29',
      '3333333','30','1200000','31','1700000','32','2100000','33','2700000','34',
      '2900000','35','5700000','36','8500000','37','8700000','38','9600000','39',
          
               '9601000', '40',
               '9602000', '41',
               '9603000', '74'
      
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
         '1200000','1700000','2100000','2700000','2900000','5700000','8500000','8700000','9600000',
              
               '9601000', 
               '9602000', 
               '9603000' 
         
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