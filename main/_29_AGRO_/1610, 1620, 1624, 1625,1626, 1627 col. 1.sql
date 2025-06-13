--CREATE OR REPLACE VIEW USER_BANCU.VW_45_1059  AS
        SELECT
                D.CUIIO,
                R.DENUMIRE,
                R.CUATM,
                R.CFOJ,
                SUM(CASE WHEN  D.capitol=399   AND  D.RIND IN ('1610')THEN D.COL1 ELSE NULL END ) AS R_1610,
                SUM(CASE WHEN  D.capitol=399   AND  D.RIND IN ('1620')THEN D.COL1 ELSE NULL END ) AS R_1620,
                SUM(CASE WHEN  D.capitol=399   AND  D.RIND IN ('1624')THEN D.COL1 ELSE NULL END ) AS R_1624,
                SUM(CASE WHEN  D.capitol=399   AND  D.RIND IN ('1625')THEN D.COL1 ELSE NULL END ) AS R_1625,
                SUM(CASE WHEN  D.capitol=399   AND  D.RIND IN ('1626')THEN D.COL1 ELSE NULL END ) AS R_1626,
                SUM(CASE WHEN  D.capitol=399   AND  D.RIND IN ('1627')THEN D.COL1 ELSE NULL END ) AS R_1627
                
                --1610, 1620, 1624, 1625,1626, 1627 col. 1
                
                
                FROM CIS2.VW_DATA_ALL D
                
                        INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS
                        INNER JOIN CIS2.MD_CAPITOL MR ON MR.CAPITOL = D.CAPITOL AND MR.CAPITOL_VERS = D.CAPITOL_VERS  
            
                    WHERE 
                    D.PERIOADA IN (1064)
                    AND D.FORM IN (45)
                    AND D.CAPITOL = 399
                   
                    
                    
                   
                GROUP BY
                
                D.CUIIO,
                R.DENUMIRE,
                R.CUATM,
                R.CFOJ
                
                HAVING 
                
               ( SUM(CASE WHEN  D.capitol=399   AND  D.RIND IN ('1610')THEN D.COL1 ELSE NULL END ) > 0 
                AND 
                SUM(CASE WHEN  D.capitol=399   AND  D.RIND IN ('1610')THEN D.COL1 ELSE NULL END ) IS NOT NULL
              )
              OR 
               ( SUM(CASE WHEN  D.capitol=399   AND  D.RIND IN ('1620')THEN D.COL1 ELSE NULL END ) > 0 
                AND 
                SUM(CASE WHEN  D.capitol=399   AND  D.RIND IN ('1620')THEN D.COL1 ELSE NULL END ) IS NOT NULL
              ) 
              
              
              OR 
               ( SUM(CASE WHEN  D.capitol=399   AND  D.RIND IN ('1624')THEN D.COL1 ELSE NULL END ) > 0 
                AND 
                SUM(CASE WHEN  D.capitol=399   AND  D.RIND IN ('1624')THEN D.COL1 ELSE NULL END ) IS NOT NULL
              )
              
              OR 
               ( SUM(CASE WHEN  D.capitol=399   AND  D.RIND IN ('1625')THEN D.COL1 ELSE NULL END ) > 0 
                AND 
                SUM(CASE WHEN  D.capitol=399   AND  D.RIND IN ('1625')THEN D.COL1 ELSE NULL END ) IS NOT NULL
              )
              
              OR 
               ( SUM(CASE WHEN  D.capitol=399   AND  D.RIND IN ('1626')THEN D.COL1 ELSE NULL END ) > 0 
                AND 
                SUM(CASE WHEN  D.capitol=399   AND  D.RIND IN ('1626')THEN D.COL1 ELSE NULL END ) IS NOT NULL
              )
              
              OR 
               ( SUM(CASE WHEN  D.capitol=399   AND  D.RIND IN ('1627')THEN D.COL1 ELSE NULL END ) > 0 
                AND 
                SUM(CASE WHEN  D.capitol=399   AND  D.RIND IN ('1627')THEN D.COL1 ELSE NULL END ) IS NOT NULL
              )
--1610, 1620, 1624, 1625,1626, 1627 col. 1


                ORDER BY
                R.CUATM