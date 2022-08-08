SELECT
                D.CUIIO, 
                D.FORM  AS RSF1_ps,
                MAX(CASE WHEN D.FORM = 63 AND D.CAPITOL IN (1119) AND D.RIND IN ('3') THEN  D.COL1 ELSE NULL END) AS NUM_MEDIU,
                MAX(CASE WHEN D.FORM = 63 AND D.CAPITOL IN (1119) AND D.RIND IN ('CAEM') THEN  D.COL1 ELSE NULL END) AS CAEM,
                SUM(CASE WHEN D.FORM = 63 AND D.CAPITOL IN (1121) AND D.RIND IN ('010')   THEN  D.COL1 ELSE NULL END) AS COL1,
                SUM(CASE WHEN D.FORM = 63 AND D.CAPITOL IN (1121) AND D.RIND IN ('010')   THEN  D.COL2 ELSE NULL END) AS COL2 
                
                FROM CIS2.VW_DATA_ALL_FR D 
                 
                WHERE 
                
                D.PERIOADA IN (2010)
                AND D.CAPITOL IN (1119,1121)
                AND D.FORM = 63 
                --AND D.CUIIO = 2936183
                GROUP BY 
                D.CUIIO,
                D.FORM 
                
                ORDER BY 
                D.CUIIO 