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
40876498,
41138992,
41183410,
41371493,
411785209601,
41010111,
41195056,
40192469,
41010022,
41151640,
100475460,
100195463,
41173971,
100699460,
41371493,
41228146

)

        
        AND 
        
        
        CUIIO_VERS  <>  2013 
         
         

ORDER BY 

CUIIO