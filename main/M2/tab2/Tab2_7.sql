



            SELECT 
            D.CUIIO,
            SUM(CASE WHEN D.RIND IN('CAEM') THEN D.COL3 ELSE NULL END ) CAEM
            
              FROM  VW_DATA_ALL D    
                INNER JOIN VW_CL_CUATM VC ON (D.CUATM = VC.CODUL)
            
                WHERE 
                VC.FULL_CODE LIKE '%'||:pCOD_CUATM||';%' AND 
                D.PERIOADA = :pPERIOADA AND
                D.CAPITOL IN (40) AND
                D.FORM IN (7) AND 
                 D.RIND IN ('10','20','30','40','50','60','70','80','90','100','110','120','130','160') 
                 AND D.CUIIO=20195572
                 
                 GROUP BY 
                 D.CUIIO