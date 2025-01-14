--CREATE OR REPLACE FORCE VIEW USER_BANCU.VW_KAT_29_AGRO_ANUAL 
--(
--             CUIIO,
--             CUIIO_VERS,
--             DENUMIRE,
--             CUATM,
--             CFP,
--             CFOJ,
--             COCM,
--             CAEM2,
--             CAEM,
--             IDNO
-- 
-- )
--AS 
SELECT     R.CUIIO,
           R.CUIIO_VERS,
           R.DENUMIRE,
           R.CUATM,
           R.CFP,
           R.CFOJ,
           R.COCM,
           R.CAEM2,
           R.CAEM,
           R.TIP,
           R.IDNO
           
           
 
       FROM (SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (76) AND CUIIO_VERS <= 1062
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (76) AND FC.STATUT <> '3') FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
               
               
               WHERE
               
--               R.CUIIO_VERS = 1063
--               
--               
--               AND 
--               
               
               R.CUIIO IN (

40294804,
40301711,
40645126,
40900966,
40054230,
40975088,
5913202,
40162014,
40070909,
40373573,
41661883,
37777386,
38972332,
40636950,
40259073,
40819773,
9773620,
2562430,
40843205,
41154011,
1210633,
41171185,
40032620,
38950365,
41237205,
40625572,
41069328,
41188263,
2749363,
40491284,
40021377,
38182084,
38469797,
40756541,
40673513,
41289917,
300446,
40134816,
15807381,
41002117,
40703906,
40063252,
40878356,
820950,
40850903,
41373322,
38987397,
38764970,
38602977,
15808570,
40573415,
40741443,
15841509
 )
 
               
               