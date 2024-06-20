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
        TRIM(L.CUIIO_VERS) CUIIO_VERS,
        TRIM(L.DENUMIRE)  DENUMIRE,
        1   EDIT_USER,
        '1' STATUT,
        TRIM(L.CUATM) CUATM,
        TRIM(L.CFP) CFP,
        TRIM(L.CFOJ) CFOJ,
        TRIM(L.CAEM2)  CAEM2,
        TRIM(L.IDNO)  IDNO
      --  TRIM(L.ETAPA_PROD) ETAPA_PROD 
      --  L.IDNO
        FROM   USER_BANCU.RSF_1 L
        
             --   CIS.RENIM  L
        
        
                        LEFT  JOIN CIS2.RENIM C ON C.CUIIO  =  L.CUIIO  
                                                  AND C.CUIIO_VERS  =  L.CUIIO_VERS  
                        
                        WHERE 
                        
                        C.CUIIO IS   NOT NULL
                        
--                        CUIIO  IN (
--41605732,
--41605749,
--41605755,
--38898937,
--41602751,
--40715513,
--40715559,
--40715542,
--40715571,
--40425940,
--40685634,
--37700229,
--41605560
--
--
--
--)
--
--
--
-- AND CUIIO_VERS IN (2012)



;

 SELECT 
 
        TRIM(L.CUIIO) CUIIO ,
        TRIM(L.CUIIO_VERS) CUIIO_VERS,
        TRIM(L.DENUMIRE)  DENUMIRE,
        1   EDIT_USER,
        '1' STATUT,
        TRIM(L.CUATM) CUATM,
        TRIM(L.CFP) CFP,
        TRIM(L.CFOJ) CFOJ,
        TRIM(L.CAEM2)  CAEM2,
        TRIM(L.IDNO)  IDNO

FROM CIS2.RENIM L

WHERE 

L.CUIIO NOT IN ()