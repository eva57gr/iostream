SELECT

  C.CODUL,
  C.FULL_CODE,
  C.DENUMIRE,
  NULL CUIIO,
  NULL DENUMIRE_CUIIO,
  NULL AS CFP 

    

        FROM  CIS2.VW_CL_CUATM C
        
        
            WHERE 
            
            C.PRGS IN ('2')
                
            
            GROUP BY 
              C.CODUL,
  C.FULL_CODE,
  C.DENUMIRE
