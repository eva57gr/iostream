insert into renim 
 (
 
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
           R.CUIIO, 
           1058 CUIIO_VERS,
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
           R.GENMUZEE,
           R.TIPMUZEE,
           R.TIP_LOCAL,
           R.TIP_INST,
           R.CAEM2,
           R.N85_NTL,
           R.N85_NTIIP,
           R.N85_NDIIP,
           R.N85_NPDS,
           R.N85_NRIIP,
           R.N85_NSIIP,
           R.GENMUZEE2,
           R.NFI,
           R.NTII,
           R.NPDS,
           R.ORGANE,
           R.TIP_INV,
           R.RENIM_PERS,
           R.ORGANE_COND,
           R.GEN_INSTITUTIE,
           R.IDNO
      FROM USER_BANCU.VW_MAX_RENIM_TRIM_CIS2 R
      
      
      WHERE
      
 
 R.CUIIO IN (
 41154442,
41318895,
41124530,
41232857,
38576627,
41173296,
41047781,
40872046,
29908610,
30172617,
41154413,
40842080,
41191510,
40803465,
40910114 )


AND R.CUIIO_VERS <> 1058