 INSERT INTO CIS2.RENIM (
 
 
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
)
 



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

41670244,
40805989,
40437356,
38648749,
40770972,
41049863,
40224608,
40614031,
41127882,
40569543,
40933865,
37629000,
2745187,
40843205,
40789316,
41344295,
41165204,
41236045,
41231740,
41421966,
2735562,
41155074,
40804949,
41254155,
40037711,
41331884,
38824531,
41407251,
38764970,
40900966
 

       )
        
        AND CUIIO_VERS <> 2014
        
        
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