SELECT 
SUM(CAP_6_RIND_600_COL1) AS RIND_600
FROM 

(
SELECT  DISTINCT       

         
             D.CUIIO, 
             MAX(CASE WHEN D.CAPITOL IN (1129) AND D.RIND IN ('8') THEN D.COL31 ELSE NULL  END) AS CEAM2,
             ROUND(SUM(CASE WHEN D.CAPITOL IN (1178) AND D.RIND IN ('600') THEN D.COL1 ELSE 0 END ),2) AS CAP_6_RIND_600_COL1
           
 
            FROM CIS2.VW_DATA_ALL D
                    WHERE 
                    D.FORM IN (64)
                    AND D.PERIOADA IN (2010)
                    
                    GROUP BY 
                    D.CUIIO

                    

HAVING 

MAX(CASE WHEN D.CAPITOL IN (1129) AND D.RIND IN ('8') THEN D.COL31 ELSE NULL  END)      LIKE '45%'


)
