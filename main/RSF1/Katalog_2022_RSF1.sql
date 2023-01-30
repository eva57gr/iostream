SELECT R.CUIIO,
       --    R.CUIIO_VERS,
       --    R.DENUMIRE,
--           R.EDIT_USER,
--           R.STATUT,
           R.CUATM
--           R.CFP,
--           R.CFOJ,
--           R.COCM,
--           R.CAEM,
--           R.BUGET,
--           R.TIP,
--           R.PROD,
--           R.FOR_CUB,
--           R.GENMUZEE,
--           R.TIPMUZEE,
--           R.TIP_LOCAL,
--           R.TIP_INST,
--           R.CAEM2,
--           R.N85_NTL,
--           R.N85_NTIIP,
--           R.N85_NDIIP,
--           R.N85_NPDS,
--           R.N85_NRIIP,
--           R.N85_NSIIP,
--           R.GENMUZEE2,
--           R.NFI,
--           R.NTII,
--           R.NPDS,
--           R.ORGANE,
--           R.TIP_INV,
--           R.RENIM_PERS,
--           R.ORGANE_COND,
        --   R.IDNO
      FROM (SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN
                   (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                        FROM CIS2.FORM_CUIIO
                       WHERE     FORM IN (63)
                             AND FORM_VERS = 2000
                             AND CUIIO_VERS <= :pPERIOADA
                    GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (63) 
             AND 
             FC.FORM_VERS IN (2000)
             AND FC.STATUT <> '3'
             ) FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)