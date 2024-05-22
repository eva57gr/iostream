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
--  ORDINE,
--  DECIMAL_POS,
--  NUME_ROW,
--  
--  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8, COL9, COL10, COL11, COL12, COL13, COL14
--)

SELECT
  :pPERIOADA AS PERIOADA,
  :pFORM AS FORM,
  :pFORM_VERS AS FORM_VERS,
  :pID_MDTABLE AS ID_MDTABLE,
  :pCOD_CUATM AS COD_CUATM,
  '0' AS NR_SECTIE,
  '0' AS NUME_SECTIE,
  '0' AS NR_SECTIE1,
  '0' AS NUME_SECTIE1,
  '0' AS NR_SECTIE2,
  '0' AS NUME_SECTIE2,
  ROUND(R.COL1,0) ||'~'||R.NR_ROW AS NR_ROW,
  TO_NUMBER(R.NR_ROW) AS ORDINE,
  '00011110111110' AS DECIMAL_POS,
  R.NUME_ROW AS NUME_ROW,
  ROUND(R.COL2,0) AS COL1,ROUND(R.COL3,0) AS COL2, ROUND(R.COL4,0) AS COL3, ROUND(R.COL5,1) AS COL4,
  ROUND(R.COL6,1) AS COL5,ROUND(R.COL7,1) AS COL6, ROUND(R.COL8,0) AS COL7, ROUND(R.COL9,1) AS COL8,
  ROUND(R.COL10,1) AS COL9,ROUND(R.COL11,1) AS COL10, ROUND(R.COL12,1) AS COL11,
  ROUND(R.COL13,1) AS COL12,ROUND(R.COL14,1) AS COL13, ROUND(R.COL15,0) AS COL14

FROM
    (
    SELECT 
        D.CS_CUATM AS CUATM,
        D.NR_ROW AS NR_ROW,
        D.NUME_ROW AS NUME_ROW,
        SUM(R.COL1) AS COL1,
        SUM(R.COL2) AS COL2,
        SUM(R.COL3) AS COL3,
        SUM(R.COL4) AS COL4,
        SUM(R.COL5) AS COL5,
        SUM(R.COL6) AS COL6,
        SUM(R.COL7) AS COL7,
        SUM(R.COL8) AS COL8,
        SUM(R.COL9) AS COL9,
        SUM(R.COL10) AS COL10,
        SUM(R.COL11) AS COL11,
        SUM(R.COL12) AS COL12,
        SUM(R.COL13) AS COL13,
        (1000*SUM(R.COL9)/NOZERO(ROUND(SUM(R.COL3),0)))/3 AS COL14,
        SUM(R.COL15) AS COL15

    FROM
        (
        --COL(3-12)
        SELECT  
            R.CUATM_FULL AS CUATM_FULL,
            SUM(R.COL1) AS COL1,
            SUM(R.COL2) AS COL2,
            SUM(R.COL3) AS COL3,
            SUM(R.COL4) AS COL4,
            SUM(R.COL5) AS COL5,
            SUM(R.COL6) AS COL6,
            SUM(R.COL7) AS COL7,
            SUM(R.COL8) AS COL8,
            SUM(R.COL9) AS COL9,
            SUM(R.COL10) AS COL10,
            SUM(R.COL11) AS COL11,
            SUM(R.COL12) AS COL12,
            SUM(R.COL13) AS COL13,
            SUM(R.COL15) AS COL15
         
        FROM
            (
            SELECT
                  D.CUATM_FULL,  
                  TRIM(TO_CHAR(DECODE(C.NR_COL,'3',D.COL3,'4',D.COL4,'5',D.COL5,'6',D.COL6,'7',D.COL7,'8',D.COL8,'9',D.COL9,'10',D.COL10,'11',D.COL11,'12',D.COL12),'0000')) AS CAEM2,
                  SUM(CASE WHEN D1.RIND IN ('10') AND D1.CAPITOL IN (27) THEN 
                  DECODE(C.NR_COL,'3',D1.COL3,'4',D1.COL4,'5',D1.COL5,'6',D1.COL6,'7',D1.COL7,'8',D1.COL8,'9',D1.COL9,'10',D1.COL10,'11',D1.COL11,'12',D1.COL12)
                  END) AS COL1,
                  SUM(CASE WHEN D1.RIND IN ('20') AND D1.CAPITOL IN (27) THEN 
                  DECODE(C.NR_COL,'3',D1.COL3,'4',D1.COL4,'5',D1.COL5,'6',D1.COL6,'7',D1.COL7,'8',D1.COL8,'9',D1.COL9,'10',D1.COL10,'11',D1.COL11,'12',D1.COL12)
                  END) AS COL2,
                  SUM(CASE WHEN D1.RIND IN ('30') AND D1.CAPITOL IN (27) THEN 
                  DECODE(C.NR_COL,'3',D1.COL3,'4',D1.COL4,'5',D1.COL5,'6',D1.COL6,'7',D1.COL7,'8',D1.COL8,'9',D1.COL9,'10',D1.COL10,'11',D1.COL11,'12',D1.COL12)
                  END) AS COL3,
                  SUM(CASE WHEN D1.RIND IN ('40') AND D1.CAPITOL IN (27) THEN 
                  DECODE(C.NR_COL,'3',D1.COL3,'4',D1.COL4,'5',D1.COL5,'6',D1.COL6,'7',D1.COL7,'8',D1.COL8,'9',D1.COL9,'10',D1.COL10,'11',D1.COL11,'12',D1.COL12)
                  END) AS COL4,
                  SUM(CASE WHEN D1.RIND IN ('50') AND D1.CAPITOL IN (27) THEN 
                  DECODE(C.NR_COL,'3',D1.COL3,'4',D1.COL4,'5',D1.COL5,'6',D1.COL6,'7',D1.COL7,'8',D1.COL8,'9',D1.COL9,'10',D1.COL10,'11',D1.COL11,'12',D1.COL12)
                  END) AS COL5,
                  SUM(CASE WHEN D1.RIND IN ('51') AND D1.CAPITOL IN (27) THEN 
                  DECODE(C.NR_COL,'3',D1.COL3,'4',D1.COL4,'5',D1.COL5,'6',D1.COL6,'7',D1.COL7,'8',D1.COL8,'9',D1.COL9,'10',D1.COL10,'11',D1.COL11,'12',D1.COL12)
                  END) AS COL6,
                  SUM(CASE WHEN D1.RIND IN ('52') AND D1.CAPITOL IN (27) THEN 
                  DECODE(C.NR_COL,'3',D1.COL3,'4',D1.COL4,'5',D1.COL5,'6',D1.COL6,'7',D1.COL7,'8',D1.COL8,'9',D1.COL9,'10',D1.COL10,'11',D1.COL11,'12',D1.COL12)
                  END) AS COL7,
                  SUM(CASE WHEN D1.RIND IN ('60') AND D1.CAPITOL IN (27) THEN 
                  DECODE(C.NR_COL,'3',D1.COL3,'4',D1.COL4,'5',D1.COL5,'6',D1.COL6,'7',D1.COL7,'8',D1.COL8,'9',D1.COL9,'10',D1.COL10,'11',D1.COL11,'12',D1.COL12)
                  END) AS COL8,
                  NOZERO(NVAL(SUM(CASE WHEN D1.RIND IN ('70') AND D1.CAPITOL IN (27) THEN 
                  DECODE(C.NR_COL,'3',D1.COL3,'4',D1.COL4,'5',D1.COL5,'6',D1.COL6,'7',D1.COL7,'8',D1.COL8,'9',D1.COL9,'10',D1.COL10,'11',D1.COL11,'12',D1.COL12)
                  END))) AS COL9,
                  NOZERO(NVAL(SUM(CASE WHEN D1.RIND IN ('71') AND D1.CAPITOL IN (27) THEN 
                  DECODE(C.NR_COL,'3',D1.COL3,'4',D1.COL4,'5',D1.COL5,'6',D1.COL6,'7',D1.COL7,'8',D1.COL8,'9',D1.COL9,'10',D1.COL10,'11',D1.COL11,'12',D1.COL12)
                  END))) AS COL10,
                  NOZERO(NVAL(SUM(CASE WHEN D1.RIND IN ('72') AND D1.CAPITOL IN (27) THEN 
                  DECODE(C.NR_COL,'3',D1.COL3,'4',D1.COL4,'5',D1.COL5,'6',D1.COL6,'7',D1.COL7,'8',D1.COL8,'9',D1.COL9,'10',D1.COL10,'11',D1.COL11,'12',D1.COL12)
                  END))) AS COL11,
                  NOZERO(NVAL(SUM(CASE WHEN D1.RIND IN ('73') AND D1.CAPITOL IN (27) THEN 
                  DECODE(C.NR_COL,'3',D1.COL3,'4',D1.COL4,'5',D1.COL5,'6',D1.COL6,'7',D1.COL7,'8',D1.COL8,'9',D1.COL9,'10',D1.COL10,'11',D1.COL11,'12',D1.COL12)
                  END))) AS COL12,
                  SUM(CASE WHEN D1.RIND IN ('110') AND D1.CAPITOL IN (27) THEN 
                  DECODE(C.NR_COL,'3',D1.COL3,'4',D1.COL4,'5',D1.COL5,'6',D1.COL6,'7',D1.COL7,'8',D1.COL8,'9',D1.COL9,'10',D1.COL10,'11',D1.COL11,'12',D1.COL12)
                  END) AS COL13,
                  COUNT (CASE WHEN D.RIND IN ('01','05') AND D.CAPITOL IN (0) AND D.COL1>0 THEN D.CUIIO ELSE NULL END ) AS COL15
              
            FROM VW_DATA_ALL D
                  INNER JOIN VW_DATA_ALL D1 ON (D.CUIIO = D1.CUIIO AND D.CUIIO_VERS = D1.CUIIO_VERS AND D.FORM = D1.FORM AND D.PERIOADA = D1.PERIOADA AND D.CAPITOL = D1.CAPITOL)
                  INNER JOIN VW_CL_CUATM VC ON (D.CUATM = VC.CODUL),
                  (
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
                D.CAPITOL IN (0,27) AND
                D.RIND IN ('CAEM','01','05') AND
                D.FORM IN (5) AND
--                ((D.TIP = '1') OR D.BUGET = '1') AND 
                D.FORM IN (5)
                
 --               AND D.DIH='1'
  AND D.CUIIO IN (SELECT DISTINCT
                  D.CUIIO
                FROM
                  VW_DATA_ALL D
                WHERE
                  D.PERIOADA IN (:pPERIOADA) AND
                  D.FORM IN (5) AND
                  D.CAPITOL IN (0) AND
                  D.RIND IN ('CM'))

            GROUP BY 
                D.CUATM_FULL,C.NR_COL,D.COL3,D.COL4,D.COL5,D.COL6,D.COL7,D.COL8,D.COL9,D.COL10,D.COL11,D.COL12
            ) R
            INNER JOIN VW_CL_CAEM2 V ON(V.CODUL LIKE '%'||R.CAEM2||'%')
            
        WHERE R.CAEM2 IS NOT NULL
            
        GROUP BY R.CUATM_FULL
            
            UNION
            
        --COL(1,2)

        SELECT
              D.CUATM_FULL,
              SUM(CASE WHEN D.RIND IN ('10') AND D.CAPITOL IN (27) THEN D.COL2 END) AS COL1,
              SUM(CASE WHEN D.RIND IN ('20') AND D.CAPITOL IN (27) THEN D.COL2 END) AS COL2,
              SUM(CASE WHEN D.RIND IN ('30') AND D.CAPITOL IN (27) THEN D.COL2 END) AS COL3,
              SUM(CASE WHEN D.RIND IN ('40') AND D.CAPITOL IN (27) THEN D.COL2 END) AS COL4,
              SUM(CASE WHEN D.RIND IN ('50') AND D.CAPITOL IN (27) THEN D.COL2 END) AS COL5,
              SUM(CASE WHEN D.RIND IN ('51') AND D.CAPITOL IN (27) THEN D.COL2 END) AS COL6,
              SUM(CASE WHEN D.RIND IN ('52') AND D.CAPITOL IN (27) THEN D.COL2 END) AS COL7,
              SUM(CASE WHEN D.RIND IN ('60') AND D.CAPITOL IN (27) THEN D.COL2 END) AS COL8,
              NOZERO(
              NVAL(SUM(CASE WHEN D.RIND IN ('70') AND D.CAPITOL IN (27) THEN D.COL2 END))
              ) AS COL9,
              NOZERO(
              NVAL(SUM(CASE WHEN D.RIND IN ('71') AND D.CAPITOL IN (27) THEN D.COL2 END))
              ) AS COL10,
              NOZERO(
              NVAL(SUM(CASE WHEN D.RIND IN ('72') AND D.CAPITOL IN (27) THEN D.COL2 END))
              ) AS COL11,
              NOZERO(
              NVAL(SUM(CASE WHEN D.RIND IN ('73') AND D.CAPITOL IN (27) THEN D.COL2 END))
              ) AS COL12,
              NOZERO(
              NVAL(SUM(CASE WHEN D.RIND IN ('110') AND D.CAPITOL IN (27) THEN D.COL2 END)) 
              ) AS COL13,
              COUNT (CASE WHEN D.RIND IN ('01','05') AND D.CAPITOL IN (0) AND D.COL1>0 THEN D.CUIIO ELSE NULL END ) AS COL15

        FROM VW_DATA_ALL D
              INNER JOIN VW_CL_CUATM VC ON (D.CUATM = VC.CODUL)
              INNER JOIN VW_CL_CAEM2 V ON (D.CAEM2 = V.CODUL)

        WHERE
              VC.FULL_CODE LIKE '%'||:pCOD_CUATM||';%' AND 
              D.PERIOADA = :pPERIOADA AND
              D.CAPITOL IN (0,27) AND
              D.FORM IN (5) AND
--              ((D.TIP = '1') OR D.BUGET = '1') AND 
              D.FORM IN (5)
              
--              AND D.DIH='1'
  AND D.CUIIO IN (
  SELECT DISTINCT
                  D.CUIIO
                FROM
                  VW_DATA_ALL D
                WHERE
                  D.PERIOADA IN (:pPERIOADA) AND
                  D.FORM IN (5) AND
                  D.CAPITOL IN (0) AND
                  D.RIND IN ('CM')
                  
                  
                  )

        GROUP BY 
              D.CUATM_FULL
        ) R
        RIGHT JOIN 
        (
        SELECT
          
          DECODE(CS.CODUL, 
          '0000000','01','0100000','02','1111111','03','0300000','04',
          '1400000','05','3400000','06','3600000','07','4100000','08','4300000','09',
          '4500000','10','4800000','11','6200000','12','7100000','13','7400000','14',
          '7800000','15','2222222','16','1000000','17','2500000','18','3100000','19',
          '3800000','20','5300000','21','5500000','22','6000000','23','6400000','24',
          '6700000','25','8000000','26','8300000','27','8900000','28','9200000','29',
          '3333333','30','1200000','31','1700000','32','2100000','33','2700000','34',
          '2900000','35','5700000','36','8500000','37','8700000','38','9600000','39')
          AS NR_ROW,
          REPLACE( CS.DENUMIRE, 'R-UL', 'R.' ) AS NUME_ROW,
          CS.CODUL AS CS_CUATM

        FROM
          VW_CL_CUATM CS

        WHERE
          CS.CODUL 
          IN(
             '0000000','0100000','1111111','0300000','1400000','3400000','3600000','4100000','4300000','4500000',
             '4800000','6200000','7100000','7400000','7800000','2222222','1000000','2500000','3100000','3800000',
             '5300000','5500000','6000000','6400000','6700000','8000000','8300000','8900000','9200000','3333333',
             '1200000','1700000','2100000','2700000','2900000','5700000','8500000','8700000','9600000'
            )
        ) D ON (R.CUATM_FULL LIKE '%'||D.CS_CUATM||'%') 
        
    GROUP BY
        D.CS_CUATM, D.NR_ROW, D.NUME_ROW

    ) R