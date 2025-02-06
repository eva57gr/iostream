UPDATE USER_BANCU.IDNO

SET CUIIO_VERS = 2013;


SELECT *

FROM USER_BANCU.IDNO;


DELETE

 FROM USER_BANCU.IDNO;


--CAEM2 = CFOJ
--CFOJ = NULL;  

--Is SQL Oracle
--IDNO  is field varchar 
--Fiind duplicates IDNO 



SELECT
  D.CUIIO,
  D.CUIIO_VERS,
  D.DENUMIRE,
  D.CUATM,
  D.CFP,
  D.CFOJ,
  D.CAEM2,
  D.IDNO
--  D.ETAPA_PROD
  FROM USER_BANCU.ADD_NEW_SU_M3_2024 D;
  
  
  SELECT   R.CUIIO,
           R.CUIIO_VERS
         
          
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
           --  AND FC.FORM_VERS = 2011
             
             
             ) FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)  
  
  WHERE 
  R.CUIIO IN (
  SELECT
  D.CUIIO
  

  FROM USER_BANCU.IDNO D
  )
  
  AND R.CUIIO_VERS = 2013