----(Statistical units that are not in the old catalog and must be blocked.) and are not already entered.
   SELECT 
          D.CUIIO D_CUIIO,
          R.CUIIO R_CUIIO
          
                
  FROM USER_BANCU.VW_KATALOG_29_AGRO_TRIM_4_23 D RIGHT   JOIN (
     SELECT     R.CUIIO,
           R.CUIIO_VERS
          
      FROM (SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (:pFORM) AND FC.STATUT <> '3') FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)



  ) R ON D.CUIIO = R.CUIIO 
  
  WHERE 
  D.CUIIO IS NOT NULL 


AND   R.CUIIO NOT IN (

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
)
                  
                     