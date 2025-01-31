DECLARE -- ====================================================================

CURSOR C IS

--SELECT 
--  distinct 
--  
--  CUIIO,
--  CUIIO_VERS,
--  IDNO  
--
----------------------------------
--------------------------------------
--FROM cis2.RENIM
--
--
--
--group by
--
--  CUIIO,
--  CUIIO_VERS,
--  IDNO  
--
--having 
--
--IDNO is not null 
--
--AND 
--(CUIIO_VERS >= 2011 and CUIIO_VERS < 2013)
--            
--            --------------------------------

SELECT 
  distinct CUIIO,
  IDNO
  
  

--------------------------------
------------------------------------
FROM cis2.RENIM



GROUP BY
CUIIO,
IDNO 

HAVING 

IDNO IS NOT NULL
            ;

BEGIN -- ======================================================================
FOR CR IN C
LOOP
UPDATE CIS2.RENIM SET

--DENUMIRE = CR.DENUMIRE,
--CUATM = CR.CUATM,
--CFP = CR.CFP,
--CFOJ = CR.CFOJ,
--CAEM2 = CR.CAEM2,
IDNO = CR.IDNO

WHERE
CUIIO = CR.CUIIO; 
--AND 
--CUIIO_VERS = CR.CUIIO_VERS;
END LOOP;
END;

---------------------------