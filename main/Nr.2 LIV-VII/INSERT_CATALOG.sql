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
 1827 CUIIO_VERS,
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
                 6808000,
38465233,
40106694,
40507915,
40715849,
40900788,
41234796,
41558518,
3818338080,
4106724680








        
        ) 
        
        AND 
        
        (
        CUIIO_VERS  <>   1827 
         
        ) 