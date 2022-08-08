


        SELECT D.CUIIO,
               D.CUATM,
               
               MAX(CASE WHEN DD.CAPITOL = 1129  AND DD.RIND IN ('8') THEN DD.COL31 ELSE NULL END )    AS CAEM_ASA 

        FROM     USER_BANCU.VW_KATALOG_ASA_2010 D 
                        LEFT JOIN (
                        
                        
       SELECT D.* 
           FROM  CIS2.VW_DATA_ALL D
           
           WHERE 
           D.FORM = 64
           AND D.PERIOADA = 2010 
                        ) DD ON DD.CUIIO = D.CUIIO 
                                                    AND  DD.CUIIO_VERS  = D.CUIIO_VERS                               
                        
                         
        GROUP BY 
        D.CUIIO,
               D.CUATM