SELECT       
               DISTINCT 
               D.ANUL,
               D.CUIIO,
               D.CUATM,
               D.CUATM_FULL,
               D.RIND,
               SUM(D.COL9) AS COL1,
               SUM(D.COL10) AS COL2
           FROM  CIS2.VW_DATA_ALL_COEF D 
                 
           
                                 
           
                                  
           
           WHERE 
           D.FORM = 64
           AND D.PERIOADA = 2011 
           AND   D.CAPITOL = 1128                   
                   
                         
        GROUP BY 
               D.ANUL,
               D.CUIIO,
               D.CUATM,
               D.CUATM_FULL,
               D.RIND

 ORDER BY 
    D.CUATM_FULL,
    D.CUIIO,
    D.RIND