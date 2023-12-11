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




SELECT 
 CUIIO,
 CUIIO_VERS,
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


                    FROM  --USER_BANCU.VW_MAX_RENIM_CIS2
                    
                    
                          USER_BANCU.VW_MAX_RENIM_SIMESTRU_CIS2
                    
                    WHERE 
                  
                  
                  CUIIO IN (
                  411097,
37745574,
38277661,
38617341,
38628310,
38636025,
38958473,
38988304,
40575905,
40577991,
40579984,
40606149,
40750337,
41033342,
41267133,
41365268,
41453736,
41536528,
3729611392,
3775803992,
4048491864,
4100179664






        
        ) 
        
--        AND 
--        
--        (
--        CUIIO_VERS  <>   1827 
--         
--        ) 