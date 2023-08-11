DROP VIEW USER_BANCU.VW_KATALOG_3_EDU;

CREATE OR REPLACE FORCE VIEW USER_BANCU.VW_KATALOG_1_EDU_22
(CUIIO, CUIIO_VERS, DENUMIRE, EDIT_USER, STATUT, 
 CUATM, CFP, CFOJ, COCM, CAEM, 
 BUGET, TIP, PROD, FOR_CUB, GENMUZEE, 
 TIPMUZEE, TIP_LOCAL, TIP_INST, CAEM2, N85_NTL, 
 N85_NTIIP, N85_NDIIP, N85_NPDS, N85_NRIIP, N85_NSIIP, 
 GENMUZEE2, NFI, NTII, NPDS, ORGANE, 
 TIP_INV, RENIM_PERS, ORGANE_COND)
AS 
SELECT R.CUIIO,
           R.CUIIO_VERS,
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
           R.ORGANE_COND
      FROM (SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (40) AND CUIIO_VERS <= 2011
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (40) AND FC.STATUT <> '3') FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS);
