

      SELECT 
      
      DISTINCT LL.CUIIO,
      LL.CUIIO_VERS
      FROM   

      (
      SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS.FORM_CUIIO
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (:pFORM) AND FC.STATUT <> '3' ) LL  LEFT JOIN  CIS.VW_DATA_ALL D  ON D.CUIIO = LL.CUIIO AND D.CUIIO_VERS  = LL.CUIIO_VERS  AND D.FORM IN (:pFORM) AND D.PERIOADA = :pPERIOADA
             
             
             WHERE 
             
             D.CUIIO IS  NOT NULL 
             
             AND D.FORM IN (:pFORM) AND D.PERIOADA = :pPERIOADA
             
             
             
             
             