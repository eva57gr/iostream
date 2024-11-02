SELECT DISTINCT 
D.CUIIO,
R.DENUMIRE
--R.IDNO
         
    FROM (
    
    SELECT DISTINCT D.CUIIO,
                          D.CUIIO_VERS,
                          D.CUATM,
                          D.FORM
            FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
                 --INNER JOIN CIS2.VW_CL_CUATM C ON D.CUATM = C.CODUL
                 
           WHERE D.PERIOADA  = :pPERIOADA_LUNA   AND D.FORM IN (:pFORM)
             AND D.ID_SCHEMA = 1
             
                 
           ) D
         INNER JOIN CIS.RENIM  R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS
GROUP BY 
D.CUIIO,
R.DENUMIRE

