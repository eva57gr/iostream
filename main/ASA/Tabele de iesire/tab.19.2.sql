SELECT 
B.NR_ROW,
B.NUME_ROW,
COUNT(CASE WHEN B.NR_ROW1 LIKE '%'||C.CODUL||'%' THEN DD.CUIIO   END) AS COL2

FROM
   (
SELECT 
 
 DISTINCT D.CUIIO, 
CASE WHEN MAX(CASE WHEN  D.RIND IN ('8') AND D.CAPITOL IN (1129) THEN D.COL31 END ) IS NULL 
 THEN    MAX(SUBSTR(D.CAEM2,2,4))  ELSE MAX(CASE WHEN  D.RIND IN ('8') AND D.CAPITOL IN (1129) THEN D.COL31 END ) END 
  AS CAEM2_ACTUALIZAT,
--
 MAX(SUBSTR(D.CAEM2,2,4))  AS CAEM2
 
 
 
FROM   
    CIS2.VW_DATA_ALL D       
WHERE
  D.FORM IN (64)             AND 
  D.FORM_VERS = :PFORM_VERS  AND      
  D.PERIOADA =:pPERIOADA AND
 -- D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%'   AND
 D.CAPITOL IN (100,1123,1124,1125,1126,1127,1128,1129) 
  
AND  D.CUIIO=40856685
 GROUP BY 
 D.CUIIO
 
 ) DD
 
  
  INNER JOIN CIS2.VW_CL_CAEM2 C ON  --SUBSTR( C.CODUL,2,4)  = DD.CAEM2_ACTUALIZAT
                                    SUBSTR( C.CODUL,2,4) = DD.CAEM2
                                    
 CROSS JOIN
(

SELECT 'C1000+C1000+C1100+C1200+C1300+C1400+C1500+C1600+C1700+C1800+C1900+C2000+C2100+C2200+C2300+C2400+C2500+C2600+C2700+C2800+C2900+C3000+C3100+C3200+C3300+C1010+C1020+C1030+C1040+C1050+C1060+C1070+C1080+C1090+C1310+C1320+C1330+C1390' AS NR_ROW1, 'C0000' AS NR_ROW,   'INDUSTRIA PRELUCRATOARE' AS NUME_ROW, 1 AS ORDINE FROM DUAL UNION
SELECT 'C1010+C1020+C1030+C1040+C1050+C1060+C1070+C1080+C1090'    AS NR_ROW1, 'C1000'    AS NR_ROW, 'Fabricarea bauturilor'      AS NUME_ROW, 2 AS ORDINE FROM DUAL UNION 
SELECT 'C1200'    AS NR_ROW1, 'C1200'    AS NR_ROW, 'Fabricarea produselor din tutun'      AS NUME_ROW, 2 AS ORDINE FROM DUAL UNION 
SELECT 'C1310+C1320+C1330+C1390'    AS NR_ROW1, 'C1300'    AS NR_ROW, 'Fabricarea produselor textile'      AS NUME_ROW, 2 AS ORDINE FROM DUAL UNION
SELECT 'C1410+C1420+C1430'    AS NR_ROW1, 'C1400'    AS NR_ROW, 'Fabricarea articolelor de imbracaminte'      AS NUME_ROW, 2 AS ORDINE FROM DUAL UNION
SELECT 'C1510+C1520'    AS NR_ROW1, 'C1500'    AS NR_ROW, 'Tabacirea si finisarea pieilor; fabricarea articolelor de voiaj si marochinarie, harnasamentelor si incaltamintei; prepararea si vopsirea blanurilor'   AS NUME_ROW, 2 AS ORDINE FROM DUAL UNION 
SELECT 'C1610+C1620'    AS NR_ROW1, 'C1600'    AS NR_ROW, 'Prelucrarea lemnului, fabricarea  produselor din lemn si pluta, cu exceptia mobilei; fabricarea articolelor din paie si din alte materiale vegetale impletite'   AS NUME_ROW, 2 AS ORDINE FROM DUAL UNION 
SELECT 'C1710+C1720'    AS NR_ROW1, 'C1700'    AS NR_ROW, 'Fabricarea hartiei si a produselor din hartie'   AS NUME_ROW, 2 AS ORDINE FROM DUAL UNION 
SELECT 'C1810+C1820'    AS NR_ROW1, 'C1800'    AS NR_ROW, 'Tiparire si reproducerea pe suporti a inregistrarilor'   AS NUME_ROW, 2 AS ORDINE FROM DUAL UNION
SELECT 'C1910+C1920'    AS NR_ROW1, 'C1900'    AS NR_ROW, 'Fabricarea produselor de cocserie si a produselor obtinute din prelucrarea titeiului'   AS NUME_ROW, 2 AS ORDINE FROM DUAL UNION
SELECT 'C2010+C2020+C2030+C2040+C2050,C2060'    AS NR_ROW1, 'C2000'    AS NR_ROW, 'Fabricarea substantelor si a produselor chimice'   AS NUME_ROW, 2 AS ORDINE FROM DUAL UNION
SELECT 'C2110+C2120'    AS NR_ROW1, 'C2100'    AS NR_ROW, 'Fabricarea produselor farmaceutice de baza si a preparatelor farmaceutice'   AS NUME_ROW, 2 AS ORDINE FROM DUAL UNION
SELECT 'C2210+C2220'    AS NR_ROW1, 'C2200'    AS NR_ROW, 'Fabricarea produselor din cauciuc si mase plastice'   AS NUME_ROW, 2 AS ORDINE FROM DUAL UNION
SELECT 'C1710+C1720'    AS NR_ROW1, 'C2300'    AS NR_ROW, 'Fabricarea altor produse din minerale nemetalice'   AS NUME_ROW, 2 AS ORDINE FROM DUAL UNION 
SELECT 'C1710+C1720'    AS NR_ROW1, 'C1700'    AS NR_ROW, 'Fabricarea hartiei si a produselor din hartie'   AS NUME_ROW, 2 AS ORDINE FROM DUAL UNION
SELECT 'C1710+C1720'    AS NR_ROW1, 'C1700'    AS NR_ROW, 'Fabricarea hartiei si a produselor din hartie'   AS NUME_ROW, 2 AS ORDINE FROM DUAL UNION
SELECT 'C1710+C1720'    AS NR_ROW1, 'C1700'    AS NR_ROW, 'Fabricarea hartiei si a produselor din hartie'   AS NUME_ROW, 2 AS ORDINE FROM DUAL UNION
SELECT 'C1710+C1720'    AS NR_ROW1, 'C1700'    AS NR_ROW, 'Fabricarea hartiei si a produselor din hartie'   AS NUME_ROW, 2 AS ORDINE FROM DUAL UNION
SELECT 'C1710+C1720'    AS NR_ROW1, 'C1700'    AS NR_ROW, 'Fabricarea hartiei si a produselor din hartie'   AS NUME_ROW, 2 AS ORDINE FROM DUAL UNION
SELECT 'C1710+C1720'    AS NR_ROW1, 'C1700'    AS NR_ROW, 'Fabricarea hartiei si a produselor din hartie'   AS NUME_ROW, 2 AS ORDINE FROM DUAL UNION
SELECT 'C1710+C1720'    AS NR_ROW1, 'C1700'    AS NR_ROW, 'Fabricarea hartiei si a produselor din hartie'   AS NUME_ROW, 2 AS ORDINE FROM DUAL UNION
SELECT 'C1710+C1720'    AS NR_ROW1, 'C1700'    AS NR_ROW, 'Fabricarea hartiei si a produselor din hartie'   AS NUME_ROW, 2 AS ORDINE FROM DUAL UNION
SELECT 'C1710+C1720'    AS NR_ROW1, 'C1700'    AS NR_ROW, 'Fabricarea hartiei si a produselor din hartie'   AS NUME_ROW, 2 AS ORDINE FROM DUAL  

) B                                   
                                    
                                      
   
   GROUP BY
B.NR_ROW,
B.NUME_ROW
   
   
   ORDER BY 
B.NR_ROW,
B.NUME_ROW



--Cap SR 1 5

--