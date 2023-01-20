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
--L.*,
--R.*,

  L.ID_USER,
  L.CUATM,
  L.FORM,
  2011 FORM_VERS,
  L.ISADMIN,
  L.ACCES_TYPE,
  L.CAPITOL_ACCES,
  SYSDATE DATA_REG       

FROM

    (

        SELECT *
        
        
        FROM CIS2.SYS_USER_ACCES
        
        
        WHERE 
        
        FORM = 71
        AND FORM_VERS = 2000
        
        
        ORDER BY 
        ID_USER,
        FORM_VERS  
        
        
        
        ) L  LEFT JOIN (
        SELECT *
        
        
        FROM CIS2.SYS_USER_ACCES
        
        
        WHERE 
        
        FORM = 71
        AND FORM_VERS = 2011
        
        )  R ON R.ID_USER = L.ID_USER
             
                
                
                WHERE 
                R.ID_USER IS NULL
                
                
                
                GROUP BY 
                  L.ID_USER,
  L.CUATM,
  L.FORM,
  
  L.ISADMIN,
  L.ACCES_TYPE,
  L.CAPITOL_ACCES,
  ROWNUM
  
  HAVING
  ROWNUM = 5
  
  