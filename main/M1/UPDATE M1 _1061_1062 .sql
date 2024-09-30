DECLARE -- ====================================================================

  CURSOR C IS

SELECT     
R.CUIIO,
1062 CUIIO_VERS,
R.CUATM,
R.CFP,
R.CAEM2,
R.BUGET,
R.TIP
          
          
      FROM (
      
      
      SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS.FORM_CUIIO
                                  WHERE FORM IN (5) AND CUIIO_VERS <= 475
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (5) AND FC.STATUT <> '3'
             
             
             
             ) FC
           INNER JOIN CIS.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS ) 
               
               
               WHERE 
               1=1
              -- AND R.CFOJ IS NULL
  
  ;        
  
BEGIN -- ======================================================================
  FOR CR IN C
  LOOP
    UPDATE CIS2.RENIM SET 
      
    --  DENUMIRE = CR.DENUMIRE,
        CUATM = CR.CUATM,
        CFP = CR.CFP,
        BUGET = CR.BUGET,
        TIP = CR.TIP,
    --  CFOJ = CR.CFOJ
       CAEM2 = CR.CAEM2
--      IDNO = CR.IDNO
      

    WHERE 
      CUIIO  = CR.CUIIO 
      AND
      CUIIO_VERS = CR.CUIIO_VERS 
      
      
      
    ;
  END LOOP;
END; -- =======================================================================


