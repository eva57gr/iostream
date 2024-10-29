---------------------------------------------------------------------------------
SELECT
      R.CUIIO,
      R.CUIIO_VERS,
      R.IDNO 

            FROM CIS2.RENIM R INNER JOIN (
            
            
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
   
            ) RR ON RR.CUIIO = R.CUIIO AND RR.CUIIO_VERS = R.CUIIO_VERS 
        

       GROUP BY
       R.CUIIO,
       R.IDNO,
       R.CUIIO_VERS
       
       
    
       
       