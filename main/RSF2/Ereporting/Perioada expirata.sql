SELECT DISTINCT
'CUIIO: '||DD.CUIIO||'-'||TRIM(IC.IDNO)||' nu este in lista'   AS REZULTAT
FROM   
USER_EREPORTING.DATA_ALL_FOR_VALIDATE_FR DD   INNER JOIN  
  USER_EREPORTING.IDNO_CUIIO_CIS2 IC ON DD.CUIIO=IC.CUIIO AND DD.CUIIO_VERS=IC.CUIIO_VERS
                                      
WHERE 
  (DD.PERIOADA=:PERIOADA        ) AND
  (DD.CUIIO=:CUIIO              OR :CUIIO = -1) AND
  ( :CUIIO=:CUIIO               OR :CUIIO = -1) AND
  ( :CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  ( :FORM = :FORM               OR :FORM = -1) AND
  ( :FORM_VERS=:FORM_VERS       OR :FORM_VERS = -1) AND
  ( :CAPITOL=:CAPITOL           OR :CAPITOL = -1) AND
  ( :CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  ( :ID_MD=:ID_MD               OR :ID_MD = -1) AND
  
  DD.FORM = 57
  GROUP BY 
  DD.CUIIO, 
  IC.IDNO
  
  
  
  

--HAVING 
--
--DD.CUIIO||'-'||TRIM(IC.IDNO) NOT IN (
--SELECT     
--DISTINCT
--  R.CUIIO||'-'||TRIM(R.IDNO) AS IDENTIFICARE
--         
--          
--           
--      FROM (
--      
--      SELECT FC.CUIIO,
--                   FC.CUIIO_VERS,
--                   FC.FORM,
--                   FC.FORM_VERS,
--                   FC.STATUT
--              FROM CIS2.FORM_CUIIO  FC
--                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
--                                   FROM CIS2.FORM_CUIIO
--                                  WHERE FORM IN (:FORM) AND CUIIO_VERS <= :PERIOADA
--                               GROUP BY CUIIO) BB
--                       ON (    BB.CUIIO = FC.CUIIO
--                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
--             WHERE FC.FORM IN (:FORM) AND FC.STATUT <> '3'
--                    AND FC.FORM_VERS = 2009
--             
--             
--             
--             ) FC
--           INNER JOIN CIS2.RENIM R
--               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
--  WHERE 
--  R.CUIIO =:CUIIO 
--  
--  
--  )
--  