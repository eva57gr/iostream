SELECT 

COUNT (D.CUIIO) AS CNT 

FROM 
(
SELECT 
D.PERIOADA,
D.CUIIO,
D.FORM,
D.DATA_REG
FROM  

           
(
            SELECT 
            
               DISTINCT
                D.PERIOADA, 
                D.CUIIO,
                D.FORM,
                MAX(D.DATA_REG) DATA_REG 
                 
                
                FROM CIS.VW_DATA_ALL D
                
                WHERE 
                
                D.PERIOADA IN (456,457,458,459,460,461,1056,1057,2011)
                
                AND FORM IN (5,2,3,4,6,1,10)
                
             --   AND D.CUIIO = 135094

                        
                
                
                GROUP BY
                D.CUIIO,
                D.FORM,
                D.PERIOADA
                
                
                ORDER BY 
                 D.CUIIO,
                 D.FORM
                 
                 ) D
                 
                 
                 
                 WHERE 
                 
                 
                 (DATA_REG > TO_DATE('01/01/2023 00:00:00', 'MM/DD/YYYY HH24:MI:SS')  AND  DATA_REG < TO_DATE('07/01/2023 00:00:00', 'MM/DD/YYYY HH24:MI:SS') )
                 
                 ORDER BY 
                 D.CUIIO,
                 D.PERIOADA,
                 D.DATA_REG
                 
                  ) D