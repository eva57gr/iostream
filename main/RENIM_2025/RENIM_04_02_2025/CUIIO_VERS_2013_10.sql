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
---- 
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

   
                    FROM --USER_BANCU.VW_MAX_RENIM_TRIM_CIS2     
                     USER_BANCU.VW_MAX_RENIM_CIS2
                    
                    WHERE 
                  
CUIIO IN (
   41310178,

 41311953,                  

41341233,

41345550,

41371493,

41384067,

41411413,

41411583,

41454552,

41495841,

41495858,

41506579,

41557542,

41594945,

40131692,

41433389,

41142083,

41257065,

41415954,

41010022,

40063921,

38285962,

407247727,

40895716,

40920453,

41041933,

41050033,

41196877,

41242726,

41365587,
                41433248 
)

AND CUIIO_VERS IN (2013)

--SELECT FC.CUIIO
--              FROM
--
--(
--SELECT FC.CUIIO,
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
--             and FC.FORM_VERS = 1004 ) FC
--             
--             
--             WHERE
--             
--             FC.CUIIO_VERS <> 1064
--        )
--        
--        AND CUIIO_VERS <> 1065
--        
        
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
--        AND FC.CUIIO_VERS =  2013
--        
--             
--        )