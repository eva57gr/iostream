--INSERT INTO CIS2.RENIM  (
--        CUIIO,
--        CUIIO_VERS,
--        DENUMIRE,
--        EDIT_USER,
--        STATUT,
--        CUATM,
--        CFP,
--        CFOJ,
--        CAEM2,
--        IDNO
--        
--        
--)



 SELECT 
 
        TRIM(L.CUIIO) CUIIO ,
        L.CUIIO_VERS,
        TRIM(L.DENUMIRE)  DENUMIRE,
        1   EDIT_USER,
        '1' STATUT,
        TRIM(L.CUATM) CUATM,
        TRIM(L.CFP) CFP,
        TRIM(L.CFOJ) CFOJ,
        TRIM(L.CAEM2)  CAEM2,
 
        TRIM(TRIM(L.IDNO))  IDNO
      
      --  L.KAT_112
        FROM   KAT_112 L
        
             --   CIS.RENIM  L
        
        
                        LEFT  JOIN CIS2.RENIM C ON C.CUIIO  =  TRIM(L.CUIIO)  
                                                  AND C.CUIIO_VERS  =  TRIM(L.CUIIO_VERS) 
                        
                        WHERE
                        
                        C.CUIIO IS   NULL  
                        AND C.CUIIO_VERS IS NULL 
                        
                        --                        
--                        C.CUIIO  is    NULL
--                        
                  --      AND L.CUIIO IS NOT NULL
                        
--                        

ORDER BY 

TRIM(TRIM(L.IDNO)) DESC;


UPDATE USER_BANCU.KAT_112
SET 
    CUIIO = REPLACE(REPLACE(TRIM(CUIIO), CHR(9), ' '), '  ', ' '),
    CUIIO_VERS = REPLACE(REPLACE(TRIM(CUIIO_VERS), CHR(9), ' '), '  ', ' '),
    DENUMIRE = REPLACE(REPLACE(TRIM(DENUMIRE), CHR(9), ' '), '  ', ' '),
    CUATM = REPLACE(REPLACE(TRIM(CUATM), CHR(9), ' '), '  ', ' '),
    CFP = REPLACE(REPLACE(TRIM(CFP), CHR(9), ' '), '  ', ' '),
    CFOJ = REPLACE(REPLACE(TRIM(CFOJ), CHR(9), ' '), '  ', ' '),
    CAEM2 = REPLACE(REPLACE(TRIM(CAEM2), CHR(9), ' '), '  ', ' '),
    IDNO = REPLACE(REPLACE(TRIM(IDNO), CHR(9), ' '), '  ', ' ')
    
    ;













;;



SELECT 

        TRIM(L.CUIIO) CUIIO,
        L.CUIIO_VERS

        FROM   KAT_112 L
        
             --   CIS.RENIM  L
        
        
                        LEFT  JOIN CIS2.RENIM C ON C.CUIIO  =  TRIM(L.CUIIO)  
                                                  AND C.CUIIO_VERS  =  TRIM(L.CUIIO_VERS) 
                        
                        WHERE
                        
                        C.CUIIO IS   NULL  
                        AND C.CUIIO_VERS IS NULL 
                        
  
                        
--                        

ORDER BY 

TRIM(TRIM(L.IDNO)) DESC;