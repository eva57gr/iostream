SELECT       
               DISTINCT 
               D.ANUL,
               D.CUIIO,
               DD.IDNO,
               DD.DENUMIRE,
               D.CUATM,
               D.CUATM_FULL,
               DD.CFP,
               DD.CAEM2,
               MAX(CASE WHEN D.CAPITOL = 1129  AND D.RIND IN ('8') THEN D.COL31 ELSE NULL END )    AS CAEM_ACT,
               SUM(CASE WHEN D.CAPITOL = 1124  AND D.RIND IN ('100') THEN D.COL1 ELSE NULL END )    AS R100,
               SUM(CASE WHEN D.CAPITOL = 1124  AND D.RIND IN ('110') THEN D.COL1 ELSE NULL END )    AS R110,
               SUM(CASE WHEN D.CAPITOL = 1124  AND D.RIND IN ('111') THEN D.COL1 ELSE NULL END )    AS R111,
               SUM(CASE WHEN D.CAPITOL = 1124  AND D.RIND IN ('112') THEN D.COL1 ELSE NULL END )    AS R112,
               SUM(CASE WHEN D.CAPITOL = 1124  AND D.RIND IN ('120') THEN D.COL1 ELSE NULL END )    AS R120,
               SUM(CASE WHEN D.CAPITOL = 1124  AND D.RIND IN ('121') THEN D.COL1 ELSE NULL END )    AS R121,
               SUM(CASE WHEN D.CAPITOL = 1124  AND D.RIND IN ('122') THEN D.COL1 ELSE NULL END )    AS R122,
               SUM(CASE WHEN D.CAPITOL = 1124  AND D.RIND IN ('130') THEN D.COL1 ELSE NULL END )    AS R130,
               SUM(CASE WHEN D.CAPITOL = 1124  AND D.RIND IN ('140') THEN D.COL1 ELSE NULL END )    AS R140,
               SUM(CASE WHEN D.CAPITOL = 1124  AND D.RIND IN ('150') THEN D.COL1 ELSE NULL END )    AS R150,
               SUM(CASE WHEN D.CAPITOL = 1124  AND D.RIND IN ('151') THEN D.COL1 ELSE NULL END )    AS R151,
               SUM(CASE WHEN D.CAPITOL = 1124  AND D.RIND IN ('160') THEN D.COL1 ELSE NULL END )    AS R160,
               SUM(CASE WHEN D.CAPITOL = 1124  AND D.RIND IN ('170') THEN D.COL1 ELSE NULL END )    AS R170,
               SUM(CASE WHEN D.CAPITOL = 1124  AND D.RIND IN ('180') THEN D.COL1 ELSE NULL END )    AS R180
               
           FROM  CIS2.VW_DATA_ALL_COEF D 
                   INNER  JOIN CIS2.RENIM  DD ON DD.CUIIO = D.CUIIO AND DD.CUIIO_VERS = D.CUIIO_VERS  
           
                                 
           
                                  
           
           WHERE 
           D.FORM = 64
           AND D.PERIOADA = 2010 
                               
                        
                         
        GROUP BY 
        D.ANUL,
               D.CUIIO,
               DD.IDNO,
               DD.DENUMIRE,
               D.CUATM,
               D.CUATM_FULL,
               DD.CFP,
               DD.CAEM2
   

 ORDER BY 
    D.CUATM_FULL