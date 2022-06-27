

SELECT 
TO_NUMBER(CR.NR_ROW) AS ORDINE,
CR.NUME_ROW AS NR_ROW,

SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL1 ELSE NULL END ) AS IND_TS_COL1,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL2 ELSE NULL END ) AS IND_TS_COL2,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL3 ELSE NULL END ) AS IND_TS_COL3,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL4 ELSE NULL END ) AS SERV_TS_COL4,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL5 ELSE NULL END ) AS SERV_TS_COL5,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL6 ELSE NULL END ) AS SERV_TS_COL6,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL7 ELSE NULL END ) AS MUNCA_1_COL7,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL8 ELSE NULL END ) AS MUNCA_1_COL8,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL9 ELSE NULL END ) AS MUNCA_1_COL9,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL10 ELSE NULL END ) AS CONS_TS_COL10,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL11 ELSE NULL END ) AS CONS_TS_COL11,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL12 ELSE NULL END ) AS CONS_TS_COL12,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL13 ELSE NULL END ) AS MUNCA_2_COL13,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL14 ELSE NULL END ) AS MUNCA_2_COL14,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.COL15 ELSE NULL END ) AS MUNCA_2_COL15,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.auto_1_COL16 ELSE NULL END ) AS auto_1_COL16,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.auto_1_COL17 ELSE NULL END ) AS auto_1_COL17,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.auto_1_COL18 ELSE NULL END ) AS auto_1_COL18,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.CIS_5_CI__COL19 ELSE NULL END ) AS CIS_5_CI__COL19,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.CIS_5_CI__COL20 ELSE NULL END ) AS CIS_5_CI__COL20,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.CIS_5_CI__COL21 ELSE NULL END ) AS CIS_5_CI__COL21,

SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.TRIM_2_INV___COL22 ELSE NULL END ) AS TRIM_2_INV___COL22,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.TRIM_2_INV___COL23 ELSE NULL END ) AS TRIM_2_INV___COL23,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.TRIM_2_INV___COL24 ELSE NULL END ) AS TRIM_2_INV___COL24,

SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.TRIM_65_auto_COL25 ELSE NULL END ) AS TRIM_65_auto_COL25,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.TRIM_65_auto_COL26 ELSE NULL END ) AS TRIM_65_auto_COL26,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.TRIM_65_auto_COL27 ELSE NULL END ) AS TRIM_65_auto_COL27,


SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.TRIM_1_turism_COL28 ELSE NULL END ) AS TRIM_1_turism_COL28,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.TRIM_1_turism_COL29 ELSE NULL END ) AS TRIM_1_turism_COL29,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.TRIM_1_turism_COL30 ELSE NULL END ) AS TRIM_1_turism_COL30,


SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.TRIM_1_INVEST_COL31 ELSE NULL END ) AS TRIM_1_INVEST_COL31,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.TRIM_1_INVEST_COL32 ELSE NULL END ) AS TRIM_1_INVEST_COL32,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.TRIM_1_INVEST_COL33 ELSE NULL END ) AS TRIM_1_INVEST_COL33,

SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.TRIM_5_CON_COL34 ELSE NULL END ) AS TRIM_5_CON_COL34,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.TRIM_5_CON_COL35 ELSE NULL END ) AS TRIM_5_CON_COL35,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.TRIM_5_CON_COL36 ELSE NULL END ) AS TRIM_5_CON_COL36,

SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.TRIM_1_B_SC_COL37 ELSE NULL END ) AS TRIM_1_B_SC_COL37,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.TRIM_1_B_SC_COL38 ELSE NULL END ) AS TRIM_1_B_SC_COL38,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.TRIM_1_B_SC_COL39 ELSE NULL END ) AS TRIM_1_B_SC_COL39,


SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.M3_COL40 ELSE NULL END ) AS M3_COL40,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.M3_COL41 ELSE NULL END ) AS M3_COL41,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.M3_COL42 ELSE NULL END ) AS M3_COL42,


SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.ANUL_1_TR_AUTO_COL43 ELSE NULL END ) AS ANUL_1_TR_AUTO_COL43,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.ANUL_1_TR_AUTO_COL44 ELSE NULL END ) AS ANUL_1_TR_AUTO_COL44,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.ANUL_1_TR_AUTO_COL45 ELSE NULL END ) AS ANUL_1_TR_AUTO_COL45,


SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.ANUL_2_INV_COL47 ELSE NULL END ) AS ANUL_2_INV_COL47,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.ANUL_2_INV_COL48 ELSE NULL END ) AS ANUL_2_INV_COL48,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.ANUL_2_INV_COL49 ELSE NULL END ) AS ANUL_2_INV_COL49,


SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.ANUL_1_CC_COL50 ELSE NULL END ) AS ANUL_1_CC_COL50,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.ANUL_1_CC_COL51 ELSE NULL END ) AS ANUL_1_CC_COL51,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.ANUL_1_CC_COL52 ELSE NULL END ) AS ANUL_1_CC_COL52,



SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.FORPRO_COL53 ELSE NULL END ) AS FORPRO_COL53,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.FORPRO_COL54 ELSE NULL END ) AS FORPRO_COL54,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.FORPRO_COL55 ELSE NULL END ) AS FORPRO_COL55,


SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.ANUL_1_A_SC_COL56 ELSE NULL END ) AS ANUL_1_A_SC_COL56,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.ANUL_1_A_SC_COL57 ELSE NULL END ) AS ANUL_1_A_SC_COL57,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.ANUL_1_A_SC_COL58 ELSE NULL END ) AS ANUL_1_A_SC_COL58,




SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.Nr_9_AGR_COL59 ELSE NULL END ) AS Nr_9_AGR_COL59,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.Nr_9_AGR_COL60 ELSE NULL END ) AS Nr_9_AGR_COL60,
SUM(CASE WHEN  C.FULL_CODE LIKE '%'||CR.CS_CUATM||'%'  THEN L.Nr_9_AGR_COL61 ELSE NULL END ) AS Nr_9_AGR_COL61

FROM 

(

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
NULL AS COL9,
NULL AS COL10,
NULL AS COL11,
NULL AS COL12,
NULL AS COL13,
NULL AS COL14,
NULL AS COL15,
         NULL AS auto_1_COL16,
         NULL AS auto_1_COL17,
         NULL AS auto_1_COL18,
         NULL  AS CIS_5_CI__COL19,
         NULL  AS CIS_5_CI__COL20,
         NULL  AS CIS_5_CI__COL21,

                                                      NULL AS TRIM_2_INV___COL22,
                                                      NULL AS  TRIM_2_INV___COL23,
                                                      NULL AS  TRIM_2_INV___COL24,
                                                      
       NULL AS   TRIM_65_auto_COL25,                                              
       NULL AS  TRIM_65_auto_COL26,                                              
       NULL AS  TRIM_65_auto_COL27,
       
       NULL AS TRIM_1_turism_COL28,
       NULL AS TRIM_1_turism_COL29,
       NULL AS TRIM_1_turism_COL30,
       
       NULL AS TRIM_1_INVEST_COL31,
       NULL AS TRIM_1_INVEST_COL32,
       NULL AS TRIM_1_INVEST_COL33,
       
       NULL AS TRIM_5_CON_COL34,
       NULL AS TRIM_5_CON_COL35,
       NULL AS TRIM_5_CON_COL36,
       
       NULL AS  TRIM_1_B_SC_COL37,
       NULL AS  TRIM_1_B_SC_COL38,
       NULL AS  TRIM_1_B_SC_COL39,
       
       
       NULL AS M3_COL40,
       NULL AS M3_COL41,
       NULL AS M3_COL42,
       
 
NULL AS ANUL_1_TR_AUTO_COL43,
NULL AS ANUL_1_TR_AUTO_COL44,
NULL AS ANUL_1_TR_AUTO_COL45,


NULL AS ANUL_2_INV_COL47,
NULL AS ANUL_2_INV_COL48,
NULL AS ANUL_2_INV_COL49,


NULL AS ANUL_1_CC_COL50,
NULL AS ANUL_1_CC_COL51,      
NULL AS ANUL_1_CC_COL52,



NULL AS FORPRO_COL53,
NULL AS FORPRO_COL54,
NULL AS FORPRO_COL55,



COUNT (DISTINCT CASE WHEN FC.FORM  = 20 THEN  FC.CUIIO END)  AS ANUL_1_A_SC_COL56,
NULL AS ANUL_1_A_SC_COL57,
NULL AS ANUL_1_A_SC_COL58
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
              FROM CIS2.FORM_CUIIO  FC
                         
              
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (20) AND CUIIO_VERS <= :pPERIOADA_ANUL 
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (20) AND FC.STATUT <> '3') FC
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
         NULL                                                       AS COL1,
         NULL                                                       AS COL2,
         NULL                                                       AS COL3,
         NULL                                                       AS COL4,
         NULL                                                       AS COL5,
         NULL                                                       AS COL6,
         NULL                                                       AS COL7,
         NULL                                                       AS COL8,
         NULL                                                       AS COL9,
         NULL                                                       AS COL10,
         NULL                                                       AS COL11,
         NULL                                                       AS COL12,
         NULL                                                       AS COL13,
         NULL                                                       AS COL14,
         NULL                                                       AS COL15,
         NULL  AS auto_1_COL16,
         NULL  AS auto_1_COL17,
         NULL  AS auto_1_COL18,
         NULL  AS CIS_5_CI__COL19,
         NULL  AS CIS_5_CI__COL20,
         NULL  AS CIS_5_CI__COL21,

       NULL AS TRIM_2_INV___COL22,
                                                      NULL AS  TRIM_2_INV___COL23,
                                                      NULL AS  TRIM_2_INV___COL24,
                                                      
       NULL AS   TRIM_65_auto_COL25,                                              
       NULL AS  TRIM_65_auto_COL26,                                              
       NULL AS  TRIM_65_auto_COL27,
       
       NULL AS TRIM_1_turism_COL28,
       NULL AS TRIM_1_turism_COL29,
       NULL AS TRIM_1_turism_COL30,
       
       NULL AS TRIM_1_INVEST_COL31,
       NULL AS TRIM_1_INVEST_COL32,
       NULL AS TRIM_1_INVEST_COL33,
       
       NULL AS TRIM_5_CON_COL34,
       NULL AS TRIM_5_CON_COL35,
       NULL AS TRIM_5_CON_COL36,
       
        NULL AS  TRIM_1_B_SC_COL37,
       NULL AS  TRIM_1_B_SC_COL38,
       NULL AS  TRIM_1_B_SC_COL39,
       
       
   NULL AS M3_COL40,
       NULL AS M3_COL41,
       NULL AS M3_COL42,
       
 
 
NULL AS ANUL_1_TR_AUTO_COL43,
NULL AS ANUL_1_TR_AUTO_COL44,
NULL AS ANUL_1_TR_AUTO_COL45,

NULL AS ANUL_2_INV_COL47,
NULL AS ANUL_2_INV_COL48,
NULL AS ANUL_2_INV_COL49,


NULL AS ANUL_1_CC_COL50,
NULL AS ANUL_1_CC_COL51,      
NULL AS ANUL_1_CC_COL52,



NULL AS FORPRO_COL53,
NULL AS FORPRO_COL54,
NULL AS FORPRO_COL55,



NULL AS  ANUL_1_A_SC_COL56,
COUNT (DISTINCT CASE WHEN D.FORM  = 20 THEN  D.CUIIO END)  AS  ANUL_1_A_SC_COL57,
NULL AS ANUL_1_A_SC_COL58


         
         
    FROM (SELECT DISTINCT D.CUIIO,
                          D.CUIIO_VERS,
                          D.CUATM,
                          D.FORM
            FROM CIS2.VW_DATA_ALL D
                 INNER JOIN CIS2.VW_CL_CUATM C ON D.CUATM = C.CODUL
                 
           WHERE D.PERIOADA = :pPERIOADA_ANUL AND D.FORM IN (20)
             
           ) D
         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
GROUP BY C.CODUL, C.FULL_CODE

UNION 

  SELECT C.CODUL,
         C.FULL_CODE,
         NULL                                                       AS COL1,
         NULL                                                       AS COL2,
         NULL                                                       AS COL3,
         NULL                                                       AS COL4,
         NULL                                                       AS COL5,
         NULL                                                       AS COL6,
         NULL                                                       AS COL7,
         NULL                                                       AS COL8,
         NULL                                                       AS COL9,
         NULL                                                       AS COL10,
         NULL                                                       AS COL11,
         NULL                                                       AS COL12,
         NULL                                                       AS COL13,
         NULL                                                       AS COL14,
         NULL                                                       AS COL15,
         NULL AS auto_1_COL16,
         NULL AS auto_1_COL17,
         NULL AS auto_1_COL18,
         NULL  AS CIS_5_CI__COL19,
         NULL  AS CIS_5_CI__COL20,
         NULL  AS CIS_5_CI__COL21,

                                                            NULL AS TRIM_2_INV___COL22,
                                                      NULL AS  TRIM_2_INV___COL23,
                                                      NULL AS  TRIM_2_INV___COL24,
                                                      
        NULL AS   TRIM_65_auto_COL25,                                              
       NULL AS  TRIM_65_auto_COL26,                                              
       NULL AS  TRIM_65_auto_COL27,
       
       NULL AS TRIM_1_turism_COL28,
       NULL AS TRIM_1_turism_COL29,
       NULL AS TRIM_1_turism_COL30,
       
           NULL AS TRIM_1_INVEST_COL31,
       NULL AS TRIM_1_INVEST_COL32,
       NULL AS TRIM_1_INVEST_COL33,
       
       NULL AS TRIM_5_CON_COL34,
       NULL AS TRIM_5_CON_COL35,
       NULL AS TRIM_5_CON_COL36,
       
        NULL AS  TRIM_1_B_SC_COL37,
       NULL AS  TRIM_1_B_SC_COL38,
       NULL AS  TRIM_1_B_SC_COL39,
       
       
       NULL AS M3_COL40,
       NULL AS M3_COL41,
       NULL AS M3_COL42,
       
 
NULL AS ANUL_1_TR_AUTO_COL43,
NULL AS ANUL_1_TR_AUTO_COL44,
NULL AS ANUL_1_TR_AUTO_COL45,


NULL AS ANUL_2_INV_COL47,
NULL AS ANUL_2_INV_COL48,
NULL AS ANUL_2_INV_COL49,


NULL AS ANUL_1_CC_COL50,
NULL AS ANUL_1_CC_COL51,      
NULL AS ANUL_1_CC_COL52,



NULL AS FORPRO_COL53,
NULL AS FORPRO_COL54,
NULL AS FORPRO_COL55,



NULL AS  ANUL_1_A_SC_COL56,
NULL AS  ANUL_1_A_SC_COL57,
COUNT (DISTINCT CASE WHEN D.FORM  = 20 THEN  D.CUIIO END)  AS  ANUL_1_A_SC_COL58
         
         
    FROM (
    
    SELECT DISTINCT D.CUIIO,
                          D.CUIIO_VERS,
                          D.CUATM,
                          D.FORM
            FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
                 INNER JOIN CIS2.VW_CL_CUATM C ON D.CUATM = C.CODUL
                 
           WHERE D.PERIOADA = :pPERIOADA_ANUL AND D.FORM IN (20)
             AND D.ID_SCHEMA = 2
             
                 
           ) D
         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
GROUP BY C.CODUL, C.FULL_CODE

 ) L
     
     INNER JOIN CIS.VW_CL_CUATM C   ON C.CODUL = L.CODUL
     CROSS JOIN (
     
     /* Formatted on 6/22/2022 4:39:31 PM (QP5 v5.326) */
SELECT DECODE (CS.CODUL,
               '0000000', '01',
               '0100000', '02',
               '1111111', '03',
               '0300000', '04',
               '1400000', '05',
               '3400000', '06',
               '3600000', '07',
               '4100000', '08',
               '4300000', '09',
               '4500000', '10',
               '4800000', '11',
               '6200000', '12',
               '6700000', '13',
               '7100000', '14',
               '7400000', '15',
               '7800000', '16',
               '8900000', '17',
               '2222222', '18',
               '1000000', '19',
               '2500000', '20',
               '2700000', '21',
               '2900000', '22',
               '3100000', '23',
               '3800000', '24',
               '5300000', '25',
               '5500000', '26',
               '6000000', '27',
               '6400000', '28',
               '8000000', '29',
               '8300000', '30',
               '8500000', '31',
               '9200000', '32',
               '3333333', '33',
               '1200000', '34',
               '1700000', '35',
               '2100000', '36',
               '5700000', '37',
               '8700000', '38',
               '9600000', '39',
               '9601000', '40',
               '9602000', '41',
               '9603000', '42')
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