             SELECT  
             CUIIO,  
             DENUMIRE,
             CUATM,
--             FULL_CODE,
             CAEM2,
             CAEM_CALCULAT

FROM
(
SELECT  DISTINCT       

             D.CUIIO,  
             R.DENUMIRE,
             R.CUATM,
             C.FULL_CODE,
             R.CAEM2,
             MAX(CASE WHEN D.CAPITOL IN (1129) AND D.RIND IN ('8') THEN D.COL31 ELSE NULL  END) AS CAEM_CALCULAT
             
             
           
 
            FROM CIS2.VW_DATA_ALL_COEF D 
            
                    INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS 
                    INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
                    WHERE 
                    D.FORM IN (64)
                    AND D.PERIOADA IN (2011)
                   -- AND D.CUIIO = 68179 

                    GROUP BY 
                           D.CUIIO,  
             R.DENUMIRE,
             R.CUATM,
             C.FULL_CODE,
             R.CAEM2



HAVING 



MAX(CASE WHEN D.CAPITOL IN (1127) AND D.RIND NOT IN ('400','-') THEN D.COL31 ELSE NULL  END)    LIKE '41%'
OR 
MAX(CASE WHEN D.CAPITOL IN (1127) AND D.RIND NOT IN ('400','-') THEN D.COL31 ELSE NULL  END)    LIKE '42%'
OR 
MAX(CASE WHEN D.CAPITOL IN (1127) AND D.RIND NOT IN ('400','-') THEN D.COL31 ELSE NULL  END)    LIKE '43%'



ORDER BY 
C.FULL_CODE

)
