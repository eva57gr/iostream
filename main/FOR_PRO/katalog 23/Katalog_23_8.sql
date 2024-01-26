-- INSERT INTO CIS2.RENIM (
-- 
-- 
-- CUIIO,
--    CUIIO_VERS,
--    DENUMIRE,
--    EDIT_USER,
--    STATUT,
--    CUATM,
--    CFP,
--    CFOJ,
--    COCM,
--    CAEM,
--    BUGET,
--    TIP,
--    PROD,
--    FOR_CUB,
--    GENMUZEE,
--    TIPMUZEE,
--    TIP_LOCAL,
--    TIP_INST,
--    CAEM2,
--    N85_NTL,
--    N85_NTIIP,
--    N85_NDIIP,
--    N85_NPDS,
--    N85_NRIIP,
--    N85_NSIIP,
--    GENMUZEE2,
--    NFI,
--    NTII,
--    NPDS,
--    ORGANE,
--    TIP_INV,
--    RENIM_PERS,
--    ORGANE_COND,
--    GEN_INSTITUTIE,
--    IDNO
--
-- 
-- )
--
--


SELECT 
 CUIIO,
 2012 CUIIO_VERS,
 DENUMIRE,
 EDIT_USER,
 STATUT,
 CUATM,
 CFP,
 CFOJ,
 COCM,
 CAEM,
 BUGET,
 TIP,
 PROD,
 FOR_CUB,
 GENMUZEE,
 TIPMUZEE,
 TIP_LOCAL,
 TIP_INST,
 CAEM2,
 N85_NTL,
 N85_NTIIP,
 N85_NDIIP,
 N85_NPDS,
 N85_NRIIP,
 N85_NSIIP,
 GENMUZEE2,
 NFI,
 NTII,
 NPDS,
 ORGANE,
 TIP_INV,
 RENIM_PERS,
 ORGANE_COND,
 GEN_INSTITUTIE,
 IDNO


                    FROM  -- USER_BANCU.VW_RENIM_2012_CIS2
                     
                     USER_BANCU.VW_MAX_RENIM_CIS2
                    
                    
                       ---   USER_BANCU.VW_MAX_RENIM_TRIM_CIS2
                    
                    WHERE 
                  
                  
                  CUIIO  IN (
                    
                   

SELECT 
 
        TRIM(L.CUIIO) CUIIO 
--        2012  CUIIO_VERS,
--        TRIM(L.DENUMIRE)  DENUMIRE,
--        1   EDIT_USER,
--        '1' STATUT,
--        TRIM(L.CUATM) CUATM,
--        TRIM(L.CFP) CFP,
--        TRIM(L.CFOJ) CFOJ,
--        TRIM(L.CAEM2)  CAEM2
--      --  L.IDNO
--      --  TRIM(L.ETAPA_PROD) ETAPA_PROD 
      --  L.IDNO
        FROM  -- USER_BANCU.CIS2_RENIM_1_TUR L
        
                USER_BANCU.FOR_PRO_2  L
        
        
                        LEFT JOIN CIS2.RENIM C ON C.CUIIO  =  L.CUIIO  
                                                  AND C.CUIIO_VERS  =  L.CUIIO_VERS  
                        
                        WHERE 
                        C.CUIIO IS NULL 
        
        ) 
        
        AND 
        
        
        CUIIO_VERS  <>      2012 
----         
         

