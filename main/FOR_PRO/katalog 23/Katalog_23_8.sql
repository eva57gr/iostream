-- INSERT INTO CIS.RENIM (
-- 
-- 
---- CUIIO,
----    CUIIO_VERS,
----    DENUMIRE,
----    EDIT_USER,
----    STATUT,
----    CUATM,
----    CFP,
----    CFOJ,
----    COCM,
----    CAEM,
----    BUGET,
----    TIP,
----    PROD,
----    FOR_CUB,
----    GENMUZEE,
----    TIPMUZEE,
----    TIP_LOCAL,
----    TIP_INST,
----    CAEM2,
----    N85_NTL,
----    N85_NTIIP,
----    N85_NDIIP,
----    N85_NPDS,
----    N85_NRIIP,
----    N85_NSIIP,
----    GENMUZEE2,
----    NFI,
----    NTII,
----    NPDS,
----    ORGANE,
----    TIP_INV,
----    RENIM_PERS,
----    ORGANE_COND,
----    GEN_INSTITUTIE,
----    IDNO
--
--
-- CUIIO,
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
-- 
-- )
----



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


-- R.CUIIO,
--           1060 CUIIO_VERS,
--           R.DENUMIRE,
--           R.EDIT_USER,
--           R.STATUT,
--           R.CUATM,
--           R.CFP,
--           R.CFOJ,
--           R.COCM,
--           R.CAEM,
--           R.BUGET,
--           R.TIP,
--           R.PROD,
--           R.FOR_CUB,
--           R.ETAPA_PROD,
--           R.RENIM_PERS,
--           R.CAEM2


                    FROM  -- USER_BANCU.VW_RENIM_2012_CIS2
                     
                     USER_BANCU.VW_MAX_RENIM_CIS2
                  --  USER_BANCU.VW_MAX_RENIM_TRIM_CIS R
                    
                       ---   USER_BANCU.VW_MAX_RENIM_TRIM_CIS2
                    
                    WHERE 
                  
                  
               
                    

                       CUIIO IN (
            SELECT 
 
        L.CUIIO
--        L.CUIIO_VERS,
--        L.DENUMIRE,
--        L.CUATM,
--        L.CFP,
--        L.CFOJ,
--        L.CAEM2,
--        L.TIP ,
--        L.BUGET
        FROM  USER_BANCU.ASA L

)


        
      
--        AND 
--        
--        
--        CUIIO_VERS  <>       2012 
--         
         

