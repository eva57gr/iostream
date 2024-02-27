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
                  
                  

                    
                   
CUIIO IN (
7005182,
7010964,
7012006,
7012029,
7012041,
7012070,
7012348,
7012354,
7012383,
7012495,
7012503,
7012615,
7012621,
7012650,
7012748,
7012779,
7012785,
7012845,
7012868,
7012928,
7012934,
7012940,
7019729,
7019758,
7019770,
7019787,
7019830,
7019882,
7019965,
7020075,
7020342,
7020365,
7020371,
7020388,
7020715,
7020804,
7021169



)

        
        
        
        AND 
        
        
        CUIIO_VERS  <>      2012 
----         
         

ORDER BY 

CUIIO