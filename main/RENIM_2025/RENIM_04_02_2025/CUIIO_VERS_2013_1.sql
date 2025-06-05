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
--)
 



SELECT 
 CUIIO,
 2014 CUIIO_VERS,
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

   
                    FROM --USER_BANCU.VW_MAX_RENIM_TRIM_CIS2     
                    USER_BANCU.VW_MAX_RENIM_CIS2
                    
                    WHERE 
                  
CUIIO IN (

41722426,
41693529,
41342333,
40841761,
40875085,
41619250,
41693558,
41722432,
41726921,
41344119,
41173221,
41651880,
41268447,
41693512,
41558091,
41214612,
41733737,
41582988,
41693535,
41722418,
41733772,
41651643,
41722573,
41232490,
41693340,
41733565,
41761871,
41733714,
41501731,
41733559,
41535629,
41827378,
41501671,
41151751,
41057124,
41268335,
41500909

 

       )
        
--        AND CUIIO_VERS <> 2014
        
        
--        AND CUIIO NOT IN (
--        SELECT FC.CUIIO
--
--              FROM
--              ( 
--              SELECT FC.CUIIO,
--                   FC.CUIIO_VERS,
--                   FC.FORM,
--                   FC.FORM_VERS,
--                   FC.STATUT
--              FROM CIS2.FORM_CUIIO  FC
--                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
--                                   FROM CIS2.FORM_CUIIO
--                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
--                                  
--                               GROUP BY CUIIO) BB
--                       ON (    BB.CUIIO = FC.CUIIO
--                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
--             WHERE 
--             FC.FORM IN (:pFORM) AND FC.STATUT <> '3'
--             and FC.FORM_VERS = 1004
--             ) FC
--             
--             
--             WHERE
--             
--             FC.CUIIO IN (
--            SELECT
--               DISTINCT  CUIIO
--            FROM  USER_BANCU.ADD_NEW_SU_M3_2024
--
--          )
--
--        AND FC.CUIIO_VERS =  1064
--        
--             
--        )