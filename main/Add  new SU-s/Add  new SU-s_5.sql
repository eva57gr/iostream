--INSERT INTO CIS.RENIM R (
--        CUIIO,
--        CUIIO_VERS,
--        DENUMIRE,
--        EDIT_USER,
--        STATUT,
--        CUATM,
--        CFP,
--        CFOJ,
--        CAEM2,
--        ETAPA_PROD
--        
--)
--


 SELECT 
 
        TRIM(L.CUIIO) CUIIO ,
        TRIM(L.CUIIO_VERS)  CUIIO_VERS,
        TRIM(L.DENUMIRE)  DENUMIRE,
        1   EDIT_USER,
        '1' STATUT,
        TRIM(L.CUATM) CUATM,
        TRIM(L.CFP) CFP,
        L.CFOJ,
        TRIM(L.CAEM2)  CAEM2,
        TRIM(L.ETAPA_PROD) ETAPA_PROD 
      --  L.IDNO
        FROM USER_BANCU.ADD_PRODMOLD_22 L
        
        
                        LEFT JOIN CIS.RENIM C ON C.CUIIO  =  L.CUIIO  
                                                  AND C.CUIIO_VERS  =  L.CUIIO_VERS  
                        
                        WHERE 
                        
                        C.CUIIO  IS  NOT     NULL 