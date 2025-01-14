




            SELECT
                D.PERIOADA, 
                D.CUIIO,
                D.CUIIO_VERS,
                D.ID_MD,
                D.COL1
                FROM CIS2.DATA_ALL D
                
                WHERE
                
                 (D.PERIOADA=:PERIOADA) AND 
                  (D.CUIIO=:CUIIO                ) AND
           (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
         (D.FORM = :FORM               ) AND
              (D.FORM_VERS=:FORM_VERS ) 
              AND D.ID_MD = 58735
                