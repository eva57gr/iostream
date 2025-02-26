CREATE OR REPLACE FORCE VIEW USER_BANCU.VW_MAX_RENIM_CIS_2013
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
    ETAPA_PROD,
    RENIM_PERS,
    CAEM2
)
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
           R.ETAPA_PROD,
           R.RENIM_PERS,
           R.CAEM2
      FROM CIS.RENIM  R
           INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) AS CUIIO_VERS
                           FROM CIS.RENIM
                       GROUP BY CUIIO) A
               ON (A.CUIIO = R.CUIIO AND A.CUIIO_VERS = R.CUIIO_VERS)
               
               
                WHERE
                R.CUIIO_VERS <= 2013    
