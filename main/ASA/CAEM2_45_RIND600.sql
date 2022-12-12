SELECT 
CUIIO 
FROM 
(
SELECT  DISTINCT       

             D.CUIIO, 
            
             MAX(CASE WHEN D.CAPITOL IN (1129) AND D.RIND IN ('8') THEN D.COL31 ELSE NULL  END) AS CAEM
                          
 
            FROM CIS2.VW_DATA_ALL D
                    WHERE 
                    D.FORM IN (64)
                    AND D.PERIOADA IN (:pPERIOADA)

                    GROUP BY 
                    D.CUIIO
HAVING 
MAX(CASE WHEN D.CAPITOL IN (1129) AND D.RIND IN ('8') THEN D.COL31 ELSE NULL  END) LIKE '45%' 
)






