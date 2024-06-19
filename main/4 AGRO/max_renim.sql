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
 2013 CUIIO_VERS,
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


                    FROM   --USER_BANCU.VW_RENIM_2012_CIS2
                     
                           USER_BANCU.VW_MAX_RENIM_CIS2
                    
                    
                  --       USER_BANCU.VW_MAX_RENIM_TRIM_CIS2
                    
                    WHERE 
                  
                  

                    
                   


CUIIO IN (

4049128478,
38594249,
41322655,
41154577,
41536534,
41242152,
4119582078,
4137882278,
4134160678,
38904431,
41189140


)

        
        AND 
        
        
        CUIIO_VERS  <>  2013 
         
         

ORDER BY 

CUIIO