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
          
          
         



--    r�nd.1490 col.2 = r�nd.1491+1492 pe col.2
--    r�nd. 1800 col. 3 =  r�nd. 1620 col.3 (cap.I)+ r�nd. 6100 col.2(cap.Ia)- autosuma
--    r�nd. 1800 col. 5 =  r�nd. 1620 col.5- autosuma
--    R�nd. 5000 col. 1   = r�nd. 5100 col. 1 + (r�nd. 7100 col. 1 + r�nd. 7200 col. 1 + r�nd. 7300 col. 1 + r�nd. 7400 col. 1 + r�nd. 7500 col. 1 din cap. II)
--    R�nd. 5100 col. 1   = r�nd. 2000 col. 1

 
