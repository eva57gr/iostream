-- INSERT INTO CIS2.RENIM (
-- 
-- 
--    CUIIO,
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
--)
-- 



--


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
 TIP_INST,-------------------------------------------------------------
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

       
                    FROM   --USER_BANCU.VW_RENIM_2012_CIS2
                     
                             USER_BANCU.VW_MAX_RENIM_CIS2
                       --     USER_BANCU.VW_RENIM_2013_CIS2
                    
                    --   VW_RENIM_2013_CIS2
                      --    USER_BANCU.VW_MAX_RENIM_TRIM_CIS2
                     --   VW_MAX_RENIM_299_CIS2
                          
                    
                    WHERE 
                  
                  
(
                    
                   
CUIIO IN (

41520378,
41745634,
41710802,
40876179,
41558398,
41095202,
41315402,
41374617,
38306594,
41095946,
40631222,
41153997,
41262158,
41342758,
41536965,
41033141,
41484916,
40746063,
41002117,
41232768,
41571223,
41151291,
41450560,
41262284,
41429270,
40091194,
41739527,
41314259,
41150252,
38627248,
40872543,
41189127,
41536735,
41105981,
40631443,
41313544,
41830877,
41262158,
40010787,
41260753,
41619148,
41739674,
15788293,
41362028,
41559512,
41417700,
41173988,
41210548

        
    )
---------------------------------------

AND CUIIO_VERS =  2013
     
)

--AND 
--
--
--CUIIO NOT IN (
--
--SELECT 
-- DISTINCT CUIIO
-- 
-- FROM    VW_RENIM_2013_CIS2
-- 
--    --    USER_BANCU.VW_MAX_RENIM_CIS2
--                    
-- 
--                    
--                    WHERE 
--                  
--                  
--
--                    
--                   
--CUIIO IN (
--
-- SELECT
-- DISTINCT  CUIIO
--        FROM  USER_BANCU.KAT_111
--
--          )
--
--        
--        AND 
--        
--        
--        CUIIO_VERS  =  2013 
--
--)
--
--ORDER BY 
--
--CUIIO;