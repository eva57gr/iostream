CREATE OR REPLACE VIEW USER_BANCU.VW_45_1060  AS
        SELECT
                D.CUIIO,
                R.DENUMIRE,
                R.CUATM,
                R.CFOJ,
                SUM(CASE WHEN  D.capitol=399   AND  D.RIND IN ('1218')THEN D.COL1 ELSE NULL END ) AS R_1218,
                SUM(CASE WHEN  D.capitol=401   AND  D.RIND IN ('2200')THEN D.COL1 ELSE NULL END ) AS R_2200
                
                
                --1610, 1620, 1624, 1625,1626, 1627 col. 1
                
                
                FROM CIS2.VW_DATA_ALL D
                
                        INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS
                        INNER JOIN CIS2.MD_CAPITOL MR ON MR.CAPITOL = D.CAPITOL AND MR.CAPITOL_VERS = D.CAPITOL_VERS  
            
                    WHERE 
                    D.PERIOADA IN (1060)
                    AND D.FORM IN (45)
                   -- AND D.CAPITOL IN  (399,401)
                   
                    
                    
                   
                GROUP BY
                
                D.CUIIO,
                R.DENUMIRE,
                R.CUATM,
                R.CFOJ
                
--                HAVING 
--                SUM(CASE WHEN  D.capitol=399   AND  D.RIND IN ('1218')THEN D.COL1 ELSE NULL END ) IS NOT NULL
--               OR 
--               SUM(CASE WHEN  D.capitol=401   AND  D.RIND IN ('2200')THEN D.COL1 ELSE NULL END ) IS NOT NULL
                ORDER BY
                R.CUATM