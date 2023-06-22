         INSERT INTO RENIM (
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
  
    IDNO
         )
         

SELECT 
    L.CUIIO,
    L.CUIIO_VERS,
    L.DENUMIRE,
    L.EDIT_USER,
    L.STATUT,
    L.CUATM,
    L.CFP,
    L.CFOJ,
    L.COCM,
    L.CAEM,
    L.BUGET,
    L.TIP,
    L.PROD,
    L.FOR_CUB,
    L.GENMUZEE,
    L.TIPMUZEE,
    L.TIP_LOCAL,
    L.TIP_INST,
    L.CAEM2,
    L.N85_NTL,
    L.N85_NTIIP,
    L.N85_NDIIP,
    L.N85_NPDS,
    L.N85_NRIIP,
    L.N85_NSIIP,
    L.GENMUZEE2,
    L.NFI,
    L.NTII,
    L.NPDS,
    L.ORGANE,
    L.TIP_INV,
    L.RENIM_PERS,
    L.ORGANE_COND,
   
    L.IDNO
FROM USER_BANCU.VW_4_AGRO_1057  L 


 LEFT JOIN 

                                          CIS2.RENIM R ON R.CUIIO = L.CUIIO--
                                           AND  R.CUIIO_VERS = L.CUIIO_VERS 
                                          
                                          WHERE 
                                          R.CUIIO IS    NULL