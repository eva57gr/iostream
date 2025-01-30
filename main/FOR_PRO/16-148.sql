

SELECT
        'Cap.I,Col.1,R.400(Ancheta A+Ancheta B):'||A.REZULTAT|| '<>' ||B.REZULTAT||': Munca1 Decembrie Col.1(R.10+R20)' 
        
        AS REZULTAT

FROM 
(

SELECT
    
     D.CUIIO,
   
     SUM(CASE WHEN D.FORM IN (16)  AND D.CAPITOL  IN  (352)  AND D.RIND IN ('400') THEN  D.COL1 ELSE NULL END) 
     
     AS REZULTAT
      
    
    FROM CIS2.VW_DATA_ALL_TEMP  D
    
  WHERE
  (D.PERIOADA =:PERIOADA        ) AND
  (D.CUIIO=:CUIIO               ) AND
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM = :FORM               ) AND
  (D.FORM_VERS=:FORM_VERS  OR :FORM_VERS = -1) AND
  (D.CAPITOL=:CAPITOL           OR :CAPITOL = -1) AND 
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
  
  D.FORM IN (16)  AND D.CAPITOL  IN  (352)  AND D.RIND IN ('400')
  
  
  
  
  GROUP BY 
  
  D.CUIIO


    
    ) A  LEFT JOIN (
    
    
    SELECT
    
     D.CUIIO,
     
  
     SUM(CASE WHEN D.FORM IN (5)  AND D.CAPITOL  IN  (27)   AND D.RIND IN ('10','20') THEN  D.COL1 ELSE 0 END) 
     
     AS REZULTAT
      
    
    FROM CIS.VW_DATA_ALL  D 
   
          
    

  WHERE
  (D.PERIOADA =  479) AND 
  (D.CUIIO=:CUIIO) AND 
 
  
  D.FORM IN (5)  AND D.CAPITOL  IN  (27,0)  
  
  
  
  
  GROUP BY 
  
  D.CUIIO
 
    
    
    )  B ON (B.CUIIO = A.CUIIO)
    
    
   
     WHERE 
    
     B.REZULTAT IS NOT NULL
    

    GROUP BY
    A.REZULTAT,
    B.REZULTAT  
    
    HAVING
    
    NVAL(A.REZULTAT) <> NVAL(B.REZULTAT)