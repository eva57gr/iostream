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


                    FROM -- USER_BANCU.VW_MAX_RENIM_CIS2
                    
                    
                          USER_BANCU.VW_MAX_RENIM_TRIM_CIS2
                    
                    WHERE 
                  
                  
                  CUIIO IN (
                    
                   20371879,
37670899,
38752435,
40211741,
40299859,
40489710,
40641482,
36218742,
40659542,
38307362,
41039936,
40287491,
41001299,
38841104,
38660584,
38989930,
37433981,
40677117,
37696752,
41149010,
40721442


        
        ) 
        
        AND 
        
        
        CUIIO_VERS  <>  1057 
         
         