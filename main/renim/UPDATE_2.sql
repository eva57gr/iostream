DECLARE -- ====================================================================

  CURSOR C IS
  
SELECT 
 FORMID,
   CUIIO,
   '2 'STATUS,
   FORM_TYPE
       FROM  USER_EREPORTING.F_XML_FORMS
          
          
          WHERE
            STATUS  =  '5' AND   FORM_TYPE = '16_agr_23'

 
--   AND FORMID = 21598116
  
  
  AND CUIIO IN (
  
  
  SELECT 
  CUIIO 
  FROM USER_BANCU.CTIF_16_AGRO
  
  WHERE 
  CUIIO NOT IN (
  SELECT DISTINCT D.CUIIO
  FROM CIS2.VW_DATA_ALL D
 WHERE     D.FORM IN (36)
       AND D.PERIOADA IN (2012)
       AND D.CUIIO IN
               (  SELECT CUIIO
                    FROM USER_EREPORTING.F_XML_FORMS
                   WHERE     STATUS = '5'
                         AND FORM_TYPE = '16_agr_23'
                         AND CUIIO IN
                                 (SELECT CUIIO FROM USER_BANCU.CTIF_16_AGRO)
                GROUP BY FORMID,
                         CUIIO,
                         STATUS,
                         FORM_TYPE)
  )
  )
  
  
  
  GROUP BY
 FORMID,
   CUIIO,
   STATUS,
   FORM_TYPE

                            

          
          ;

BEGIN -- ======================================================================
  FOR CR IN C
  LOOP
    UPDATE USER_EREPORTING.F_XML_FORMS SET 
      

         STATUS = CR.STATUS

    
    
    WHERE 
      FORMID  = CR.FORMID 
      AND
      FORM_TYPE = CR.FORM_TYPE 
      
      
      
    ;
  END LOOP;
END; -- =======================================================================


