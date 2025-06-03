SELECT FC.CUIIO,
       FC.CUIIO_VERS  
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
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
                                  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (:pFORM) AND FC.STATUT <> '3'
             --and FC.FORM_VERS = 1004 
             
             
             
             ) FC
             
             
             WHERE
             
             --FC.CUIIO_VERS = 1064
            

 
             
             CUIIO LIKE :pCUIIO||'%'


AND 

FORM IN (43)

 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 select DISTINCT 
 CUIIO,
 CUIIO_VERS 
 
 from USER_EREPORTING.DATA_ALL
 
 WHERE
 
 
 PERIOADA IN (:pPERIOADA)
             and CUIIO LIKE :pCUIIO||'%'


AND 

FORM IN (43)

 
;



select DISTINCT 
 CUIIO,
 CUIIO_VERS 
 
 from USER_EREPORTING.DATA_ALL_PRIMIT
 
 WHERE
 
 PERIOADA IN (:pPERIOADA)
             and CUIIO LIKE :pCUIIO||'%'


AND 

FORM IN (43)

 