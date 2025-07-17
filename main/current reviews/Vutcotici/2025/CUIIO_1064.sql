
SELECT DISTINCT   
                    D.CUIIO,
                    R.CUATM
                    
    FROM CIS2.DATA_ALL D
    INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS 
    WHERE D.PERIOADA = :pPERIOADA 
      AND D.FORM IN (:pFORM)
      AND D.DATA_REG > TO_DATE('01/01/2025 00:00:00', 'MM/DD/YYYY HH24:MI:SS') 
      AND D.FORM_VERS IN (:pFORM_VERS) 
      

                    GROUP BY
                     D.CUIIO,
                    
                                  R.CUATM