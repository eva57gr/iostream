----There are 11 statistical units that are not in the new catalog but have already been introduced.
SELECT 
R_CUIIO CUIIO  

FROM 
(
   SELECT 
          D.CUIIO D_CUIIO,
          R.CUIIO R_CUIIO ,
          MAX(R.DATA_REG) DATA_REG 
                
  FROM USER_BANCU.VW_KATALOG_29_AGRO_TRIM_4_22 D RIGHT  JOIN (
     SELECT 
        DISTINCT D.CUIIO,
                 D.DATA_REG
            
                FROM CIS2.VW_DATA_ALL D

                    WHERE 
                    D.PERIOADA IN (:pPERIOADA)
                    AND D.FORM  IN (:pFORM)
                

ORDER BY 
D.DATA_REG DESC



  ) R ON D.CUIIO = R.CUIIO 
  
  WHERE 
  D.CUIIO IS  NULL 



GROUP BY 

    D.CUIIO,
    R.CUIIO
                  
                     ) L 