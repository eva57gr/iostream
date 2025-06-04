----------------------------------------------------------------------------------
--INSERT INTO CIS2.FORM_CUIIO R (
--        CUIIO,
--        CUIIO_VERS,
--        FORM,
--        FORM_VERS,
--        STATUT 
--)
--




SELECT   
         L.CUIIO, 
        2014 CUIIO_VERS,
        43 FORM,
        2000    FORM_VERS,
        '1' STATUT
         
         FROM (

SELECT     R.CUIIO,
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
                                  WHERE FORM IN (43) AND CUIIO_VERS <= 2014
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (43) AND FC.STATUT <> '3'
           --  AND FC.FORM_VERS = 2011
             
             
             ) FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS) ) R 
               
               RIGHT  JOIN (
               
              SELECT 
    DISTINCT D.CUIIO 
        FROM CIS2.RENIM  D
        WHERE
        CUIIO IN (

41670244,
40805989,
40437356,
38648749,
40770972,
41049863,
40224608,
40614031,
41127882,
40569543,
40933865,
37629000,
2745187,
40843205,
40789316,
41344295,
41165204,
41236045,
41231740,
41421966,
2735562,
41155074,
40804949,
41254155,
40037711,
41331884,
38824531,
41407251,
38764970,
40900966
 

       )
        
        AND CUIIO_VERS = 2014
        
        


        
               ) L ON L.CUIIO = R.CUIIO
               
               
               WHERE 
               R.CUIIO IS     NULL  
           --    )
               

-- L )  
              
               
               
--              AND CUIIO_VERS = 2013
--              
--              AND FORM = 27 