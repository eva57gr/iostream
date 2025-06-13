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
-- 



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

40091722,
40211876,
41289917,
41324631,
41343322,
300446,
20206063,
37603236,
40772250,
40819773,
41457817,
41541363,
4117185,
40037651,
40159176,
40280587,
40309032,
40948335,
41306231,
415090632,
41511250,
41513740,
41553225,
41158664,
820950,
40846913,
41721361,
37021793,
41624505,
40381420,
20467119,
40162014,
40683374,
41184420,
41430304,
41441489,
41510888,
41736598,
20372910,
41187520,
41619846,
40883794,
38989031,
15808570,
38393309,
40134816,
40828476,
5921006,
41081401,
40712644,
40491284,
40032620,
40926641
   
)

AND CUIIO_VERS  NOT  IN (2014)

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