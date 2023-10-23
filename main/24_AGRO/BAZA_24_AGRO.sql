              SELECT
                     CASE WHEN TO_CHAR(D.PERIOADA) = '1056'  THEN 'TRM I'  
              WHEN TO_CHAR(D.PERIOADA) = '1057'  THEN 'TRM II' 
              WHEN TO_CHAR(D.PERIOADA) = '1058'  THEN 'TRM III'
              WHEN TO_CHAR(D.PERIOADA) = '1059'  THEN 'TRM IV'
         ELSE  TO_CHAR(D.PERIOADA) END TRIMESTRU,
                    D.CUIIO,
                    R.DENUMIRE,
                    R.CUATM, 
--                    D.CAPITOL,
                    
                    
                     CASE 
         
              WHEN D.CAPITOL = 379 THEN 'Cap I'
              WHEN D.CAPITOL = 380 THEN 'Cap II'
              WHEN D.CAPITOL = 381 THEN 'Cap III'
              
              WHEN D.CAPITOL = 419 THEN 'Cap SR'
         END 
          AS CAPITOL,
                    D.RIND,
                    SUM(D.COL1) AS COL1,
                    SUM(D.COL2) AS COL2,
                    SUM(D.COL3) AS COL4,
                    SUM(D.COL4) AS COL4
               
               
               
               
                    FROM CIS2.VW_DATA_ALL D 
                    
                                INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO 
                                                          AND R.CUIIO_VERS = D.CUIIO_VERS   
                    
                    
                    WHERE 
                    
                    
                     D.PERIOADA IN (1056,1057,1058,1059)  
                      AND D.FORM IN (33)       
  


                    GROUP BY 
                         D.PERIOADA,
                    D.CUIIO,
                    R.DENUMIRE,
                    R.CUATM, 
                    D.CAPITOL,
                    D.RIND
                    
                      ORDER BY 
     R.CUATM,
   D.CUIIO,
   D.CAPITOL,
   D.RIND