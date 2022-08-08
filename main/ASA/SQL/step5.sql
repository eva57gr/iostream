







                SELECT
                D.CUIIO, 
                D.FORM  AS RSF1,
                MAX(CASE WHEN D.FORM = 57 AND D.CAPITOL IN (1091) AND D.RIND IN ('6') THEN  D.COL1 ELSE NULL END) AS NUM_MEDIU,
                MAX(CASE WHEN D.FORM = 57 AND D.CAPITOL IN (1091) AND D.RIND IN ('CAEM') THEN  D.COL1 ELSE NULL END) AS CAEM,
                SUM(CASE WHEN D.FORM = 57 AND D.CAPITOL IN (1092) AND D.RIND IN ('010')   THEN  D.COL1 ELSE NULL END) AS COL1,
                SUM(CASE WHEN D.FORM = 57 AND D.CAPITOL IN (1092) AND D.RIND IN ('010')   THEN  D.COL2 ELSE NULL END) AS COL2 
                
                FROM CIS2.VW_DATA_ALL_FR D 
                 
                WHERE 
                
                D.PERIOADA IN (2010)
                AND D.CAPITOL IN (1091,1092)
                AND D.FORM = 57 
                
                GROUP BY 
                D.CUIIO,
                D.FORM 
                
                ORDER BY 
                D.CUIIO 