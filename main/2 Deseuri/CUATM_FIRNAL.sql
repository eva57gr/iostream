

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


UNION 

SELECT
  C.CODUL,
  C.FULL_CODE,
  C.DENUMIRE,
  D.CUIIO,
  R.DENUMIRE DENUMIRE_CUIIO,
  R.CFP 
    
    FROM CIS2.VW_DATA_ALL D 
    
            INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
            INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS 
    
    WHERE 
    
    D.PERIOADA IN (:pPERIOADA)
    AND D.FORM IN (:pFORM)    
    AND D.CAPITOL IN (365)
    
GROUP BY 
  C.CODUL,
  C.FULL_CODE,
  C.DENUMIRE,
  D.CUIIO,
  R.DENUMIRE,
  R.CFP



ORDER BY 
FULL_CODE



        