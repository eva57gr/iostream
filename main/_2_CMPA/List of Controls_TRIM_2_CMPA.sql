SELECT 
      L.CONTROL,
      L.FORMULA,
      L.SQL_TEXT,
      L.PRIORITATEA,
      L.STATUT
      
      
        
        FROM

( 
SELECT 
      B.CONTROL,
      B.FORMULA,
      B.SQL_TEXT, 
      B.PRIORITATEA,
      B.STATUT
      
      
        
        FROM CIS2.MD_CONTROL B  INNER JOIN (
        SELECT 
        A.CONTROL, 
        MAX(A.CONTROL_VERS) CONTROL_VERS
        
        FROM CIS2.MD_CONTROL A
        
        
         WHERE
         1=1
         AND A.FORM  = 45
               
         GROUP BY 
          A.CONTROL
         
         ORDER BY 
          A.CONTROL
        
        )  A  ON A.CONTROL = B.CONTROL AND A.CONTROL_VERS = B.CONTROL_VERS   
        
        
         WHERE
         1=1
         AND B.FORM  = 45
         AND B.STATUT <> '3'
        -- AND B.FORM_VERS = 2009
               
         
         
         ORDER BY 
          B.CONTROL ) L
          
          --Vitalie Bancu
          
          
         



--    rând.1490 col.2 = rând.1491+1492 pe col.2
--    rând. 1800 col. 3 =  rând. 1620 col.3 (cap.I)+ rând. 6100 col.2(cap.Ia)- autosuma
--    rând. 1800 col. 5 =  rând. 1620 col.5- autosuma
--    Rând. 5000 col. 1   = rând. 5100 col. 1 + (rând. 7100 col. 1 + rând. 7200 col. 1 + rând. 7300 col. 1 + rând. 7400 col. 1 + rând. 7500 col. 1 din cap. II)
--    Rând. 5100 col. 1   = rând. 2000 col. 1

 
