SELECT D.*
        
--            D.CUIIO,
--            D.RIND,
--            SUM(D.COL1) AS COL1,
--            SUM(D.COL2) AS COL2,
--            SUM(D.COL3) AS COL3,
--            SUM(D.COL4) AS COL4,
--            SUM(D.COL5) AS COL5
            
            FROM  STAT.VW_DATA_ALL D
            
            
            WHERE
            D.CUIIO = 41188607

            AND D.FORM = 73
            AND D.PERIOADA = 2013
            AND D.T_XML_FORM_ID = 16709862
            
--            GROUP BY 
--            D.CUIIO,
--            D.RIND
--            
--            ORDER BY 
--            D.RIND