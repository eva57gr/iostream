--         INSERT INTO RENIM (
--           CUIIO,
--           CUIIO_VERS,
--           DENUMIRE,
--           EDIT_USER,
--           STATUT,
--           CUATM,
--           CFP,
--           CFOJ,
--           COCM,
--           CAEM,
--           BUGET,
--           TIP,
--           PROD,
--           FOR_CUB,
--           ETAPA_PROD,
--           RENIM_PERS,
--           CAEM2
--         )
--         
         
         SELECT
         
--    CUIIO,
--    1061 CUIIO_VERS,
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

           R.CUIIO,
           473 CUIIO_VERS,
           R.DENUMIRE,
           R.EDIT_USER,
           R.STATUT,
           R.CUATM,
           R.CFP,
           R.CFOJ,
           R.COCM,
           R.CAEM,
           R.BUGET,
           R.TIP,
           R.PROD,
           R.FOR_CUB,
           R.ETAPA_PROD,
           R.RENIM_PERS,
           R.CAEM2
            FROM 
            
             USER_BANCU.VW_MAX_RENIM_CIS_1004 R
            
            
            WHERE
            
            -------------------------------------------------------------
            
           R.CUIIO IN 

(
SELECT CUIIO
    
    FROM USER_BANCU.RENIM_1061
)

---------------------------------------------------------------------------------
-----------------------------------
AND 
CUIIO_VERS   NOT IN (473)
----            
--            ORDER BY 
--            CUIIO_VERS