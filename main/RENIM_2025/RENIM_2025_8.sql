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
                        
                        C.CUIIO IS  NOT  NULL  
                        AND C.CUIIO_VERS IS NOT  NULL 
                        
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




SELECT
  D.CUIIO,
  D.CUIIO_VERS,
  D.DENUMIRE,
  D.CUATM, 
  D.CFP,
  D.CFOJ,
  D.COCM,
  D.CAEM2,
  D.CAEM,
  D.IDNO    

FROM USER_BANCU.KAT_112 D

                                
--                                
----                                INNER JOIN CIS2.CL_CUATM74 L ON D.CUATM = L.CODUL4 
--                                 LEFT JOIN  USER_BANCU.VW_MAX_RENIM_CIS2   DD ON DD.CUIIO = D.CUIIO    
--                                
--                                
--                                
--                                ) D
                                
                           

                       -- LEFT JOIN  USER_BANCU.VW_MAX_RENIM_CIS2   DD ON DD.CUIIO = D.CUIIO    
                                
                     --  LEFT JOIN CIS2.VW_CL_CUATM C ON C.CODUL =  D.CUATM
                        
                   --    LEFT JOIN CIS2.VW_CL_CAEM2 C ON C.CODUL =  D.CAEM2
                        
                    --  LEFT JOIN CIS2.VW_CL_CFOJ C ON C.CODUL =  L.CFOJ
                       
                        WHERE 
                        
                        C.CODUL IS    NULL 