

        
        SELECT *
      --  COUNT (DISTINCT CUIIO ) AS CNT
        
        FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT
        
            WHERE 
            FORM = 44
            AND 
            PERIOADA = 1053
          --   AND RIND IN ('1')
           --  AND CAPITOL = 405

AND CUIIO = 41304189

ORDER BY 
DATA_REG DESC
        