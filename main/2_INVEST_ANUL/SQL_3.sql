

SELECT     R.CUIIO,
       --    R.CUIIO_VERS,
           R.DENUMIRE,
       --    R.EDIT_USER,
       --    R.STATUT,
           R.CUATM,
           R.CFP,
      --     R.CFOJ,
           R.CAEM2,
          -- R.IDNO,
           L.COL1_2021,
           L.COL2_2021,
           L.COL1_2020,
           L.COL2_2020
           
      FROM (


SELECT     R.CUIIO,
           R.CUIIO_VERS,
           R.DENUMIRE,
           R.EDIT_USER,
           R.STATUT,
           R.CUATM,
           R.CFP,
           R.CFOJ,
           R.CAEM2,
           R.IDNO
      FROM (SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (8) AND CUIIO_VERS <= :pPERIOADA
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (8) AND FC.STATUT <> '3') FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)) R  LEFT JOIN (
               
               SELECT 
        
        D.CUIIO,
        D.CAPITOL_DEN,
        D.RIND,
        SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) THEN  D.COL1 ELSE NULL END) AS COL1_2021,
        SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) THEN  D.COL2 ELSE NULL END) AS COL2_2021,
        
         SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA-1) THEN  D.COL1 ELSE NULL END) AS COL1_2020,
        SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA-1) THEN  D.COL2 ELSE NULL END) AS COL2_2020
        
        
                FROM CIS2.VW_DATA_ALL D 
                
                    WHERE 
                    D.FORM IN (:pFORM)
                    AND D.PERIOADA IN (:pPERIOADA,:pPERIOADA-1)
                    AND D.CAPITOL IN (323)
                    AND D.RIND IN ('100')
                    
                    
                    GROUP BY 
                         D.CUIIO,
        D.CAPITOL_DEN,
        D.RIND
               
               ) L ON L.CUIIO = R.CUIIO 
               
               
               WHERE 
               
               R.CUIIO = 1123
               ORDER BY 
               R.CUIIO