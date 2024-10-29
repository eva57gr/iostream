----------------------------------------------------------------------------------
SELECT
      R.CUIIO,
      MAX(R.CUIIO_VERS) AS  CUIIO_VERS,
      R.IDNO 

            FROM CIS2.RENIM R 
        

       GROUP BY
       R.CUIIO,
       R.IDNO
       
       HAVING 
       R.IDNO IS NOT NULL 
   