SELECT 
          ----------------------------------------  
          ----------------------------------------------
        DISTINCT 
       -- D.PERIOADA,
        D.CUIIO,
        R.DENUMIRE,
        R.CUATM,
        D.RIND AS STATUT,
        SUM(COL1) AS COL1,
        'TIM 4 2024 ' AS COL2
        
            FROM CIS2.VW_DATA_ALL D 
                    INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO  AND R.CUIIO_VERS = D.CUIIO_VERS
            
            WHERE
            D.FORM = 44
         --   AND D.ANUL= 2024
            AND D.PERIOADA = 1063
            AND D.RIND NOT IN ('01','05')
            AND D.capitol=1 AND D.capitol_vers=1028
            
            
            GROUP BY
            D.PERIOADA,
            D.CUIIO,
        R.DENUMIRE,
        R.CUATM,
        D.RIND
        

UNION 

SELECT 
            
        DISTINCT 
       -- D.PERIOADA,
        D.CUIIO,
        R.DENUMIRE,
        R.CUATM,
        D.RIND AS STATUT,
        SUM(COL1) AS COL1,
        'TIM 3 2024 ' AS COL2
        
            FROM CIS2.VW_DATA_ALL D 
                    INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO  AND R.CUIIO_VERS = D.CUIIO_VERS
            
            WHERE
            D.FORM = 44
         --   AND D.ANUL= 2024
            AND D.PERIOADA = 1062
            AND D.RIND NOT IN ('01','05')
            AND D.capitol=1 AND D.capitol_vers=1028
            
            
            GROUP BY
            D.PERIOADA,
            D.CUIIO,
        R.DENUMIRE,
        R.CUATM,
        D.RIND
        
UNION 

SELECT 
            
        DISTINCT 
       -- D.PERIOADA,
        D.CUIIO,
        R.DENUMIRE,
        R.CUATM,
        D.RIND AS STATUT,
        SUM(COL1) AS COL1,
        'TIM 2 2024 ' AS COL2
        
            FROM CIS2.VW_DATA_ALL D 
                    INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO  AND R.CUIIO_VERS = D.CUIIO_VERS
            
            WHERE
            D.FORM = 44
         --   AND D.ANUL= 2024
            AND D.PERIOADA = 1062
            AND D.RIND NOT IN ('01','05')
            AND D.capitol=1 AND D.capitol_vers=1028
            
            
            GROUP BY
            D.PERIOADA,
            D.CUIIO,
        R.DENUMIRE,
        R.CUATM,
        D.RIND
        



        ORDER BY
        CUIIO

        