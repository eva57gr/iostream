SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
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
              FROM CIS.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS.FORM_CUIIO
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (:pFORM) AND FC.STATUT <> '3' 
             ) FC 
             
             
             WHERE 
             
           
          
             
         CUIIO IN (
             
             
41290033,
40088826,
38344392,
40419223,
5913113,
38997088,
41093812,
41140285,
41541647,
40942077,
41236536,
40688288,
38368961,
41399468,
40986904,
40112878,
37786225,
40180166,
40920621,
41127563,
03399706,
37261089,
15811247,
41317720,
37452501,
40814050


             )



             