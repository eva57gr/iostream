1.    SELECT 
          D.CUIIO
                
  FROM USER_BANCU.VW_KATALOG_29_AGRO_TRIM_4_22 D

--This is the new catalog


SELECT 
        DISTINCT D.CUIIO,
                 D.DATA_REG
            
                FROM CIS2.VW_DATA_ALL D

                    WHERE 
                    D.PERIOADA IN (:pPERIOADA)
                    AND D.FORM  IN (:pFORM)
                

ORDER BY 
D.DATA_REG DESC


2. 
They are already included in the old catalog.

     SELECT 
        DISTINCT D.CUIIO,
                 D.DATA_REG
            
                FROM CIS2.VW_DATA_ALL D

                    WHERE 
                    D.PERIOADA IN (:pPERIOADA)
                    AND D.FORM  IN (:pFORM)
                

ORDER BY 
D.DATA_REG DESC


3. 


Which ones from the old catalog are not in the new catalog and are already entered.


{

   SELECT 
          D.CUIIO D_CUIIO,
          R.CUIIO R_CUIIO,
          R.DATA_REG
                
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


ORDER BY 
R.DATA_REG DESC                    
                     
}

4. There are 11 statistical units that are not in the new catalog but have already been introduced.



5. The statistical units that are in the new catalog and are in the old catalog.

6. The statistical units that must be blocked must be in the FORM CUIIO table with CUIIO_VERS - 2011

7. I found in the catalog the statistical units that do not have CUIIO_VERS = 2011. Now you have to insert them into the table with cuiio_vers = 2011.

8. Those that are in the new catalog but are not in the old catalog must be inserted.


  







