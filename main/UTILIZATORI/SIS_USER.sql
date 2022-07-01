
INSERT INTO CIS2.SYS_USER_ACCES

(
  ID_USER, 
  CUATM,
  FORM,
  FORM_VERS,
  ISADMIN,
  ACCES_TYPE,     
  CAPITOL_ACCES,
  DATA_REG

)

SELECT 

  L.ID_USER, 
  L.CUATM,
  L.FORM,
  L.FORM_VERS,
  L.ISADMIN,
  L.ACCES_TYPE,     
  L.CAPITOL_ACCES,
  L.DATA_REG
   
FROM
(
SELECT   
  L.ID_USER, 
  ADDRES CUATM,
  74 FORM,
  1004 FORM_VERS,
  '0' ISADMIN,
  '1' ACCES_TYPE,     
  NULL CAPITOL_ACCES,
  SYSDATE DATA_REG    

            FROM CIS2.SYS_USER L 
            
            WHERE 
            
            L.ID_USER IN (
            
            32

            
            ) )L LEFT JOIN CIS2.SYS_USER_ACCES R ON R.ID_USER = L.ID_USER
                 AND L.FORM = R.FORM
                 
                 WHERE 
                 R.ID_USER IS  NULL
              

GROUP BY 

  L.ID_USER, 
  L.CUATM,
  L.FORM,
  L.FORM_VERS,
  L.ISADMIN,
  L.ACCES_TYPE,     
  L.CAPITOL_ACCES,
  L.DATA_REG,
  
  ROWNUM   
                   
       HAVING 
      
      ROWNUM <= 18  
               
                 
                         
            
            
            
            