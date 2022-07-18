

        
        SELECT *
      --  COUNT (DISTINCT CUIIO ) AS CNT
        
        FROM CIS2.VW_DATA_ALL
        
            WHERE 
            FORM = 44
            AND 
            PERIOADA = 1053
          --   AND RIND IN ('1')
           --  AND CAPITOL = 405

AND CUIIO = 40450836


ORDER BY 
DATA_REG DESC
        