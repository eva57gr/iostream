SELECT D.CUIIO 

FROM 


(
SELECT DISTINCT D.CUIIO,
                          D.CUIIO_VERS,
                          D.CUATM,
                          D.FORM
            FROM CIS2.VW_DATA_ALL D
                 INNER JOIN CIS2.VW_CL_CUATM C ON D.CUATM = C.CODUL
                 
           WHERE D.PERIOADA = :pPERIOADA_ANUL AND D.FORM IN (8)) D
           
           