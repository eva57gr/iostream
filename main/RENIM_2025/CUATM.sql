SELECT     
           R.CUIIO,
           R.CUIIO_VERS,
           R.CUATM
          
      FROM (
      
      
      SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (:pFORM) AND FC.STATUT <> '3'

             
             
             ) FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)   
               
                INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM
               
               WHERE 
               
               C.FULL_CODE LIKE '%'||:pCUATM||';%';
               
               
               
               
               SELECT *
               
               
               FROM AGRO_16_17
               
               
               WHERE 
               1=1 AND 
               CUIIO NOT IN (
               41484916,
40746063,
41002117,
41520378,
41232768,
41745634,
41710802,
41210548,
41571223,
41095202,
41315402,
41558398,
40876179,
41374617,
41151291,
41450560,
41262284,
41429270,
41739527,
38306594,
41314259,
41150252,
40872543,
41536735,
41095946,
41189127,
38627248,
41105981,
40631443,
40631222,
41313544,
41153997,
41262158,
41830877,
41260753,
41739674,
41342758,
41619148,
40010787,
15788293,
41362028,
41559512,
41417700,
41536965,
41033141,
41173988

               )
               
               