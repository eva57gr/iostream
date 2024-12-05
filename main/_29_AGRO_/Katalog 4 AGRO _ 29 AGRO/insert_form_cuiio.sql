--insert INTO  CIS2.form_cuiio 
--(
--                   CUIIO,
--                   CUIIO_VERS,
--                   FORM,
--                   FORM_VERS,
--                   STATUT
--)


SELECT             
                   FC.CUIIO,
                   1063 CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
                   
                   FROM

(
SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (45) AND CUIIO_VERS <= 1063
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (45) AND FC.STATUT <> '3') FC
             
             
             WHERE
FC.CUIIO IN (

40630840,
41811414,
41694724,
40176051,
41706367,
37092824,
41745893,
41417479,
41745634,
41710802,
41558398,
41779343,
41342801,
39018861,
41816328,
41746007,
41796376,
41816593,
41710759,
41731537,
41816570,
41560998,
41739527,
41191495,
41314259,
41149487,
41810722,
41779372,
40347831,
41739674,
31261342,
41710908,
41745597,
41314689,
41786395,
41700788,
41710943,
41779366,
41779219,
41031225,
40902391,
41260753,
41619148,
20421427,
41392851,
40749067,
38629864,
41786538,
41731431,
41678719,
40674027,
41362028
)


AND FC.CUIIO_VERS  <> 1063