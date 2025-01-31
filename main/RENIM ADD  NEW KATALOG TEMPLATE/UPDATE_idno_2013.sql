SELECT 
  distinct 
  
  CUIIO,
  CUIIO_VERS,
  IDNO  

--------------------------------
------------------------------------
FROM cis2.RENIM



group by

  CUIIO,
  CUIIO_VERS,
  IDNO  

having 

IDNO is not null 

AND CUIIO_VERS > 2011
