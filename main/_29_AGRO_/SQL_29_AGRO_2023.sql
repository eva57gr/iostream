        --Create view from this SQL in Oracle
        
        CREATE OR REPLACE VIEW USER_BANCU.VW_45_1059  AS
        SELECT
                D.CUIIO,
                R.DENUMIRE,
                R.CUATM,
                R.CFOJ,
                SUM(CASE WHEN  D.capitol=399   AND  D.RIND IN ('1630')THEN D.COL1 ELSE NULL END ) AS R_1630,
                SUM(CASE WHEN  D.capitol=399   AND  D.RIND IN ('1631')THEN D.COL1 ELSE NULL END ) AS R_1631,
                SUM(CASE WHEN  D.capitol=399   AND  D.RIND IN ('1140')THEN D.COL1 ELSE NULL END ) AS R_1140,
                SUM(CASE WHEN  D.capitol=399   AND  D.RIND IN ('1104','1110')THEN D.COL1 ELSE NULL END ) AS R_1104_1110,
                SUM(CASE WHEN  D.capitol=399   AND  D.RIND IN ('1105')THEN D.COL1 ELSE NULL END ) AS R_1105,
                SUM(CASE WHEN  D.capitol=399   AND  D.RIND IN ('1106','1112')THEN D.COL1 ELSE NULL END ) AS R_1106_1112,
                SUM(CASE WHEN  D.capitol=399   AND  D.RIND IN ('1113')THEN D.COL1 ELSE NULL END ) AS R_1113,
                SUM(CASE WHEN  D.capitol=399   AND  D.RIND IN ('1116')THEN D.COL1 ELSE NULL END ) AS R_1116,
                SUM(CASE WHEN  D.capitol=399   AND  D.RIND IN ('1135')THEN D.COL1 ELSE NULL END ) AS R_1135,
                SUM(CASE WHEN  D.capitol=399   AND  D.RIND IN ('1120','1121')THEN D.COL1 ELSE NULL END ) AS R_1120_1121,
                SUM(CASE WHEN  D.capitol=399   AND  D.RIND IN ('1123')THEN D.COL1 ELSE NULL END ) AS R_1123,
                SUM(CASE WHEN  D.capitol=399   AND  D.RIND IN ('1301')THEN D.COL1 ELSE NULL END ) AS R_1301,
                SUM(CASE WHEN  D.capitol=399   AND  D.RIND IN ('1213')THEN D.COL1 ELSE NULL END ) AS R_1213,
                SUM(CASE WHEN  D.capitol=399   AND  D.RIND IN ('1224','1225')THEN D.COL1 ELSE NULL END ) AS R_1224_1225,
                SUM(CASE WHEN  D.capitol=399   AND  D.RIND IN ('1240')THEN D.COL1 ELSE NULL END ) AS R_1240,
                SUM(CASE WHEN  D.capitol=399   AND  D.RIND IN ('1221')THEN D.COL1 ELSE NULL END ) AS R_1221,
                SUM(CASE WHEN  D.capitol=399   AND  D.RIND IN ('1242')THEN D.COL1 ELSE NULL END ) AS R_1242,
                SUM(CASE WHEN  D.capitol=399   AND  D.RIND IN ('1241')THEN D.COL1 ELSE NULL END ) AS R_1241,
                SUM(CASE WHEN  D.capitol=399   AND  D.RIND IN ('1216')THEN D.COL1 ELSE NULL END ) AS R_1216,
                NVAL(SUM(CASE WHEN  D.capitol=399   AND  D.RIND IN ('1302','1324')THEN D.COL1 ELSE NULL END )) 
                +
                NVAL(SUM(CASE WHEN  D.capitol=401   AND  D.RIND IN ('2202')THEN D.COL1 ELSE NULL END))
                AS R_1302_1324_2202,
                SUM(CASE WHEN  D.capitol=401   AND  D.RIND IN ('2100')THEN D.COL1 ELSE NULL END ) AS R_2100,
                SUM(CASE WHEN  D.capitol=401   AND  D.RIND IN ('2110')THEN D.COL1 ELSE NULL END ) AS R_2110,
                NVAL(SUM(CASE WHEN  D.capitol=401   AND  D.RIND IN ('2200')THEN D.COL1 ELSE NULL END )) - 
                NVAL(SUM(CASE WHEN  D.capitol=401   AND  D.RIND IN ('2202')THEN D.COL1 ELSE NULL END )) R2200_2202,
                SUM(CASE WHEN  D.capitol=401   AND  D.RIND IN ('2300')THEN D.COL1 ELSE NULL END ) AS R_2300,
                SUM(CASE WHEN  D.capitol=401   AND  D.RIND IN ('2301')THEN D.COL1 ELSE NULL END ) AS R_2301,
                SUM(CASE WHEN  D.capitol=401   AND  D.RIND IN ('2302')THEN D.COL1 ELSE NULL END ) AS R_2302,
                SUM(CASE WHEN  D.capitol=400   AND  D.RIND IN ('1701')THEN D.COL1 ELSE NULL END ) AS R_1701

                
                
                
                
           
              
                
                FROM CIS2.VW_DATA_ALL D
                
                        INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS
                        INNER JOIN CIS2.MD_CAPITOL MR ON MR.CAPITOL = D.CAPITOL AND MR.CAPITOL_VERS = D.CAPITOL_VERS  
            
                    WHERE 
                    D.PERIOADA IN (1059)
                    AND D.FORM IN (45)
                   
                    
                    
                   
                GROUP BY
                
                D.CUIIO,
                R.DENUMIRE,
                R.CUATM,
                R.CFOJ
              
                ORDER BY
                R.CUATM
             

                