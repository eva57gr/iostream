


        SELECT D.CUIIO,
               D.CUATM,
               DD.CUATM_FULL,
               
               MAX(CASE WHEN DD.CAPITOL = 1129  AND DD.RIND IN ('8') THEN DD.COL31 ELSE NULL END )    AS CAEM_ASA 

        FROM     USER_BANCU.VW_KATALOG_ASA_2010 D 
                        LEFT JOIN CIS2.VW_DATA_ALL DD   ON (DD.FORM = 64 AND DD.PERIOADA = 2010 AND DD.CUIIO = D.CUIIO   AND  DD.CUIIO_VERS  = D.CUIIO_VERS )
                        
                        
                               
                        
                         
        GROUP BY 
        D.CUIIO,
               D.CUATM,
                              DD.CUATM_FULL
               
               ORDER BY 
               DD.CUATM_FULL
               