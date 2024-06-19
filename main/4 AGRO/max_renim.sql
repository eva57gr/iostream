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
9778511,
37080353,
38740627,
38752620,
39072572,
40197136,
40528596,
40749699,
40802821,
40965492,
4008112683,
4028749183,
4054031583,
4071016083
)

        
        AND 
        
        
        CUIIO_VERS  <>  2013 
         
         

ORDER BY 

CUIIO