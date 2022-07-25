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
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (44) AND CUIIO_VERS <= :pPERIOADA
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (44) AND FC.STATUT <> '3' ) FC   LEFT JOIN (
             
             SELECT 
                
    DISTINCT 
    D.CUIIO
   
 
   

                FROM USER_EREPORTING.VW_DATA_ALL D
                            INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS 
                            INNER JOIN USER_EREPORTING.F_XML_FORMS F ON F.FORMID = D.T_XML_FORM_ID AND F.STATUS = '5'
                
                WHERE 
                D.PERIOADA IN (:pPERIOADA)
                AND D.FORM  IN (:pFORM)
                
                
        GROUP BY 
        D.CUIIO,
        R.DENUMIRE,
         F.STATUS,

    D.CUATM,
    D.CUATM_FULL,
    
    D.DATA_REG,
    
  
    D.COL4,
   
   
    D.COL31,
 
    D.COL33,
    T_XML_FORM_ID
                
                HAVING 
                
                    COL4 IS NULL 
   
   
    AND COL31 IS NULL 
 
    AND COL33 IS null 
             ) R  ON R.CUIIO = FC.CUIIO 
             
             WHERE 
             
             R.CUIIO IS NOT NULL 