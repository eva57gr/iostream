SELECT
D.CUIIO,
D.CUIIO_VERS,
D.CUATM,
SUM(CASE WHEN D.CAPITOL = 1206 AND D.RIND IN ('900') THEN D.COL1 ELSE 0 END ) AS COL1

    FROM
      CIS2.VW_DATA_ALL D     
                   
            
       WHERE  
       D.PERIOADA IN (:pPERIOADA) AND
       D.FORM = :pFORM AND
       D.FORM_VERS = :pFORM_VERS  AND  

       D.FORM = 71 AND
       D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%'
       AND D.CAPITOL = 1206 AND D.RIND IN ('900') 
   

        GROUP BY 
        D.CUIIO,
        D.CUATM,
        D.CUIIO_VERS