
-- "CATALOGUL 2-INV an 2021 + datele din cap.I r.100 col.1 si col.2 din an 2021 + datele din cap.I r.100 col.1 si col.2 din an 2020 + persoane (din baza sau registru) 

        SELECT 
        
        D.CUIIO,
        D.CAPITOL_DEN,
        D.RIND,
        SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) THEN  D.COL1 ELSE NULL END) AS COL1_2021,
        SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) THEN  D.COL2 ELSE NULL END) AS COL2_2021,
        
         SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA-1) THEN  D.COL1 ELSE NULL END) AS COL1_2020,
        SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA-1) THEN  D.COL2 ELSE NULL END) AS COL2_2020
        
  -------------------------------------   -------------------------------------------
  
  -----------------------------------------------------------------------------------   
  ------------------------------------------------------------------------------------
  -------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------
  
  
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
        
        ORDER BY 
        D.CUIIO