SELECT *
FROM USER_BANCU.AUTO_65
WHERE IDNO IN (
    SELECT IDNO
    FROM USER_BANCU.AUTO_65
    GROUP BY IDNO
    HAVING COUNT(*) > 1
)

ORDER BY 
IDNO;



SELECT CUIIO
FROM USER_BANCU.KATALOG_24_2013;




SELECT L.CUIIO

    FROM USER_BANCU.KATALOG_24_2013 L 
    
    
    LEFT JOIN (
    
    
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
             and FC.FORM_VERS = 1004 
   

 ) R  ON R.CUIIO =  L.CUIIO
 
 
 WHERE 
 R.CUIIO IS NULL

