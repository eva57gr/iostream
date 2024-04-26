DECLARE -- ====================================================================

  CURSOR C IS
  
SELECT 
 FORMID,
   CUIIO,
   TRIM(STATUS) STATUS,
   FORM_TYPE
       FROM  USER_EREPORTING.F_XML_FORMS
          
          
          WHERE
               
            FORM_TYPE = '16_agr_23'
    
          --  AND STATUS IN ('2')
 

  
  
  
  GROUP BY
 FORMID,
   CUIIO,
   STATUS,
   FORM_TYPE
   
   ORDER BY 
   STATUS

                            

          
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


