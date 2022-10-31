 SELECT DISTINCT 
          D.CUIIO,
          R.DENUMIRE, 
          R.CUATM,
          R.CAEM2,
       
          SUM(CASE WHEN D.capitol=1199 AND D.RIND IN ('1') THEN D.COL1 ELSE 0 END) AS SR_1,
          SUM(CASE WHEN D.capitol=1197 AND D.RIND IN ('1') THEN D.COL2 ELSE 0 END) AS RIND_1_NU,
          
          SUM(CASE WHEN D.capitol=1197 AND D.RIND IN ('1.1','1.2','1.3') THEN D.COL1 ELSE 0 END)  AS RIND_1_1_2_3
         
        FROM CIS2.VW_DATA_ALL D
                INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO 
                        AND R.CUIIO_VERS  = D.CUIIO_VERS  
                       
          
      WHERE 
        D.capitol IN  (1199,1197)
        AND D.PERIOADA IN (1053)
        AND D.FORM IN (74)


GROUP BY 
 D.CUIIO,
          R.DENUMIRE, 
          R.CUATM,
          R.CAEM2
          
          HAVING 
        
SUM(CASE WHEN D.capitol=1199 AND D.RIND IN ('1') THEN D.COL1 ELSE 0 END) = 1

AND
SUM(CASE WHEN D.capitol=1197 AND D.RIND IN ('1') THEN D.COL2 ELSE 0 END) = 1

AND SUM(CASE WHEN D.capitol=1197 AND D.RIND IN ('1.1','1.2','1.3') THEN D.COL1 ELSE 0 END) = 1