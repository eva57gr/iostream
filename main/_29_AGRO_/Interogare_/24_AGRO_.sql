        SELECT
                D.CUIIO,
                R.DENUMIRE,
                R.CUATM,
                R.CFOJ,
             
                SUM(CASE WHEN  D.capitol= 369   AND  D.RIND IN ('1')THEN D.COL1 ELSE NULL END ) AS cap2_1_r_01,
                SUM(CASE WHEN  D.capitol= 369   AND  D.RIND IN ('18')THEN D.COL1 ELSE NULL END ) AS cap2_1_r_18,
                SUM(CASE WHEN  D.capitol= 369   AND  D.RIND IN ('12')THEN D.COL1 ELSE NULL END ) AS cap2_1_r_12,
                SUM(CASE WHEN  D.capitol= 369   AND  D.RIND IN ('21')THEN D.COL1 ELSE NULL END ) AS cap2_1_r_21,
                SUM(CASE WHEN  D.capitol= 369   AND  D.RIND IN ('37')THEN D.COL1 ELSE NULL END ) AS cap2_1_r_37,
                SUM(CASE WHEN  D.capitol= 369   AND  D.RIND IN ('39')THEN D.COL1 ELSE NULL END ) AS cap2_1_r_39,
                SUM(CASE WHEN  D.capitol= 369   AND  D.RIND IN ('44')THEN D.COL1 ELSE NULL END ) AS cap2_1_r_44,
                SUM(CASE WHEN  D.capitol= 369   AND  D.RIND IN ('33')THEN D.COL1 ELSE NULL END ) AS cap2_1_r_33,
                SUM(CASE WHEN  D.capitol= 369   AND  D.RIND IN ('47')THEN D.COL1 ELSE NULL END ) AS cap2_1_r_47,
                SUM(CASE WHEN  D.capitol= 369   AND  D.RIND IN ('54')THEN D.COL1 ELSE NULL END ) AS cap2_1_r_54
           
              
                
                FROM CIS2.VW_DATA_ALL D
                
                        INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS
                        INNER JOIN CIS2.MD_CAPITOL MR ON MR.CAPITOL = D.CAPITOL AND MR.CAPITOL_VERS = D.CAPITOL_VERS  
            
                    WHERE 
                    D.PERIOADA IN (2013)
                    AND D.FORM IN (27)
                   AND D.capitol=369 AND D.capitol_vers=2013
                    
                    
                   
                GROUP BY
                
                D.CUIIO,
                R.DENUMIRE,
                R.CUATM,
                R.CFOJ
              
                ORDER BY
                D.CUIIO
             
                
               
                