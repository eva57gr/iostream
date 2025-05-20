SELECT 
      D.CUIIO,
      MAX(D.PACHET) PACHET
      
      FROM CIS2.VW_DATA_ALL D  

WHERE  
       D.FORM IN (71)             AND  
       D.PERIOADA IN (:pPERIOADA ) AND
       D.FORM = :pFORM AND
       D.FORM_VERS = :pFORM_VERS  AND  
       D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%'
        AND D.CUIIO = 277954
       GROUP BY 
       D.CUIIO 