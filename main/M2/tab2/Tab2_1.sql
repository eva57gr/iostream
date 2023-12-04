--INSERT INTO TABLE_OUT 
--(
--  PERIOADA,
--  FORM,
--  FORM_VERS,
--  ID_MDTABLE,
--  COD_CUATM,
--  NR_SECTIE,
--  NUME_SECTIE,
--  NR_SECTIE1,
--  NUME_SECTIE1,
--  NR_SECTIE2,
--  NUME_SECTIE2,
--  NR_ROW,
-- -- ORDINE,
--  DECIMAL_POS,
--  NUME_ROW,
--  
-- COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8, COL9, COL10, COL11, COL12, COL13, COL14, COL15, COL16, COL17
--)


SELECT
  :pPERIOADA AS PERIOADA,
--  :pFORM AS FORM,
--  :pFORM_VERS AS FORM_VERS,
--  :pID_MDTABLE AS ID_MDTABLE,
--  :pCOD_CUATM AS COD_CUATM,
--  '0' AS NR_SECTIE,
--  '0' AS NUME_SECTIE,
--  '0' AS NR_SECTIE1,
--  '0' AS NUME_SECTIE1,
--  '0' AS NR_SECTIE2,
--  '0' AS NUME_SECTIE2,
   R.CUIIO||'~'||R.CAEM2||'_'||R.FORM AS NR_ROW,
  '0000111111111111111111111' AS DECIMAL_POS,
   R.DENUMIRE AS NUME_ROW, 
 
   R.CUATM AS COL1,
   R.CAEM2 AS COL2,
   R.FORM AS COL3,
   R.COL4,
   R.COL5,
   R.COL6,
   R.COL7,
   R.COL8,
   R.COL9,
   R.COL10,
   R.COL11,
   R.COL12,
   R.COL13,
   R.COL14,
   R.COL15,
   R.COL16,
   R.COL17
  

FROM

(
SELECT D.*

FROM
    VW_DATA_ALL_COEF V
    INNER JOIN
    (

    SELECT 
        RN.DENUMIRE,
        R.CUIIO,
        TO_NUMBER(D.CUATM) AS CUATM,
        R.CAEM2 AS CAEM2,
        D.FORM AS FORM,
        SUM( CASE WHEN D.RIND IN ('10') THEN
        DECODE(R.COL,'1',D.COL1,'2',D.COL2,'3',D.COL3,'4',D.COL4,'5',D.COL5,'6',D.COL6,'7',D.COL7,'8',D.COL8,'9',D.COL9,'10',D.COL10,'11',D.COL11,'12',D.COL12)
             END ) AS COL4,
             
        SUM( CASE WHEN D.RIND IN ('20')  THEN
        DECODE(R.COL,'1',D.COL1,'2',D.COL2,'3',D.COL3,'4',D.COL4,'5',D.COL5,'6',D.COL6,'7',D.COL7,'8',D.COL8,'9',D.COL9,'10',D.COL10,'11',D.COL11,'12',D.COL12)
             END ) AS COL5,
        
        SUM( CASE WHEN D.RIND IN ('30')  THEN
        DECODE(R.COL,'1',D.COL1,'2',D.COL2,'3',D.COL3,'4',D.COL4,'5',D.COL5,'6',D.COL6,'7',D.COL7,'8',D.COL8,'9',D.COL9,'10',D.COL10,'11',D.COL11,'12',D.COL12)
             END ) AS COL6,     
        
        SUM( CASE WHEN D.RIND IN ('40')  THEN
        DECODE(R.COL,'1',D.COL1,'2',D.COL2,'3',D.COL3,'4',D.COL4,'5',D.COL5,'6',D.COL6,'7',D.COL7,'8',D.COL8,'9',D.COL9,'10',D.COL10,'11',D.COL11,'12',D.COL12)
             END ) AS COL7,
        
        SUM( CASE WHEN D.RIND IN ('50')  THEN
        DECODE(R.COL,'1',D.COL1,'2',D.COL2,'3',D.COL3,'4',D.COL4,'5',D.COL5,'6',D.COL6,'7',D.COL7,'8',D.COL8,'9',D.COL9,'10',D.COL10,'11',D.COL11,'12',D.COL12)
             END ) AS COL8,
        
        SUM( CASE WHEN D.RIND IN ('60')  THEN
        DECODE(R.COL,'1',D.COL1,'2',D.COL2,'3',D.COL3,'4',D.COL4,'5',D.COL5,'6',D.COL6,'7',D.COL7,'8',D.COL8,'9',D.COL9,'10',D.COL10,'11',D.COL11,'12',D.COL12)
             END ) AS COL9,
        
        SUM( CASE WHEN D.RIND IN ('70') THEN
        DECODE(R.COL,'1',D.COL1,'2',D.COL2,'3',D.COL3,'4',D.COL4,'5',D.COL5,'6',D.COL6,'7',D.COL7,'8',D.COL8,'9',D.COL9,'10',D.COL10,'11',D.COL11,'12',D.COL12)
             END ) AS COL10,
             
        SUM( CASE WHEN D.RIND IN ('80')  THEN 
        DECODE(R.COL,'1',D.COL1,'2',D.COL2,'3',D.COL3,'4',D.COL4,'5',D.COL5,'6',D.COL6,'7',D.COL7,'8',D.COL8,'9',D.COL9,'10',D.COL10,'11',D.COL11,'12',D.COL12)
             END ) AS COL11,
        
        SUM( CASE WHEN D.RIND IN ('90') THEN
        DECODE(R.COL,'1',D.COL1,'2',D.COL2,'3',D.COL3,'4',D.COL4,'5',D.COL5,'6',D.COL6,'7',D.COL7,'8',D.COL8,'9',D.COL9,'10',D.COL10,'11',D.COL11,'12',D.COL12)
             END ) AS COL12,
             
        SUM( CASE WHEN D.RIND IN ('100')  THEN
        DECODE(R.COL,'1',D.COL1,'2',D.COL2,'3',D.COL3,'4',D.COL4,'5',D.COL5,'6',D.COL6,'7',D.COL7,'8',D.COL8,'9',D.COL9,'10',D.COL10,'11',D.COL11,'12',D.COL12)
             END ) AS COL13,
         
        SUM( CASE WHEN D.RIND IN ('110')  THEN
        DECODE(R.COL,'1',D.COL1,'2',D.COL2,'3',D.COL3,'4',D.COL4,'5',D.COL5,'6',D.COL6,'7',D.COL7,'8',D.COL8,'9',D.COL9,'10',D.COL10,'11',D.COL11,'12',D.COL12)
             END ) AS COL14,
          
   SUM( CASE WHEN D.RIND IN ('120')  THEN
        DECODE(R.COL,'1',D.COL1,'2',D.COL2,'3',D.COL3,'4',D.COL4,'5',D.COL5,'6',D.COL6,'7',D.COL7,'8',D.COL8,'9',D.COL9,'10',D.COL10,'11',D.COL11,'12',D.COL12)
             END ) AS COL15,




   SUM( CASE WHEN D.RIND IN ('130')  THEN
        DECODE(R.COL,'1',D.COL1,'2',D.COL2,'3',D.COL3,'4',D.COL4,'5',D.COL5,'6',D.COL6,'7',D.COL7,'8',D.COL8,'9',D.COL9,'10',D.COL10,'11',D.COL11,'12',D.COL12)
             END ) AS COL16,

   
        SUM( CASE WHEN D.RIND IN ('160')  THEN
        DECODE(R.COL,'1',D.COL1,'2',D.COL2,'3',D.COL3,'4',D.COL4,'5',D.COL5,'6',D.COL6,'7',D.COL7,'8',D.COL8,'9',D.COL9,'10',D.COL10,'11',D.COL11,'12',D.COL12)
             END ) AS COL17

    FROM 
        VW_DATA_ALL D
        INNER JOIN RENIM RN ON (RN.CUIIO = D.CUIIO AND RN.CUIIO_VERS = D.CUIIO_VERS)
        INNER JOIN VW_CL_CUATM VC ON (D.CUATM = VC.CODUL)
        INNER JOIN 
        (
        SELECT * FROM
            (
            SELECT
                DISTINCT
                D.CUIIO,
                D.CUIIO_VERS,
                D.FORM,
                    CASE WHEN D.RIND IN ('CAEM') THEN
                     DECODE(C.NR_COL,'3',D.COL3,'4',D.COL4,'5',D.COL5,'6',D.COL6,'7',D.COL7,'8',D.COL8,'9',D.COL9,'10',D.COL10,'11',D.COL11,'12',D.COL12)
                     WHEN C.NR_COL IN('1','2','3','4') THEN
                     DECODE(C.NR_COL,'1',0,'2',TO_NUMBER(SUBSTR(D.CAEM2,2,5)))
                END AS CAEM2,
                
                C.NR_COL AS COL
                         
            FROM 
                VW_DATA_ALL D    
                INNER JOIN VW_CL_CUATM VC ON (D.CUATM = VC.CODUL),
                (
                SELECT '1' AS NR_COL FROM DUAL UNION
                SELECT '2' AS NR_COL FROM DUAL UNION
                SELECT '3' AS NR_COL FROM DUAL UNION
                SELECT '4' AS NR_COL FROM DUAL UNION
                SELECT '5' AS NR_COL FROM DUAL UNION
                SELECT '6' AS NR_COL FROM DUAL UNION
                SELECT '7' AS NR_COL FROM DUAL UNION
                SELECT '8' AS NR_COL FROM DUAL UNION
                SELECT '9' AS NR_COL FROM DUAL UNION
                SELECT '10' AS NR_COL FROM DUAL UNION
                SELECT '11' AS NR_COL FROM DUAL UNION
                SELECT '12' AS NR_COL FROM DUAL 
                ) C

            WHERE
                VC.FULL_CODE LIKE '%'||:pCOD_CUATM||';%' AND 
                D.PERIOADA = :pPERIOADA AND
                D.CAPITOL IN (40) AND
                D.FORM IN (7) AND 
                 D.RIND IN ('CAEM','10','20','30','40','50','60','70','80','90','100','110','120','130','160') 
                 AND D.CUIIO=20195572

            ORDER BY 
                D.CUIIO
            ) R

        WHERE
        1=1
          AND   R.CAEM2 IS NOT NULL
        ) R ON (R.CUIIO = D.CUIIO AND R.FORM = D.FORM AND R.CUIIO_VERS = D.CUIIO_VERS)
            
    WHERE

        VC.FULL_CODE LIKE '%'||:pCOD_CUATM||';%' AND 
        D.PERIOADA = :pPERIOADA AND
        D.CAPITOL IN (40) AND
        D.FORM IN (7)AND
        D.RIND IN ('10','20','30','40','50','60','70','80','90','100','110','120','130','160') 
        AND D.CUIIO=20195572
       

    GROUP BY
        R.CUIIO,
        R.CAEM2,
        R.FORM,
        D.CUATM,
        D.CAEM,
        D.FORM,
        D.CFP,
        RN.DENUMIRE
            
    ) D ON (D.CUIIO = V.CUIIO AND D.FORM = V.FORM)

WHERE
     V.PERIOADA IN (:pPERIOADA) AND 
     --V.NUM_PERS >= 4 AND
     V.CAPITOL IN (0) AND
     V.RIND IN ('01')

ORDER BY
    D.CUATM,
    D.CUIIO,
    D.CAEM2
) R