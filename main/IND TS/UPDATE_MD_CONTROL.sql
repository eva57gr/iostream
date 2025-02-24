SELECT 
      L.CONTROL,
      L.CONTROL_VERS,
      L.FORMULA,
      L.SQL_TEXT,
      L.PRIORITATEA,
      L.STATUT
      
      
        
        FROM

( 
SELECT 
      B.CONTROL,
      B.CONTROL_VERS,
      B.FORMULA,
      B.SQL_TEXT,
      B.PRIORITATEA,
      B.STATUT
      
      
        
        FROM CIS.MD_CONTROL B  INNER JOIN (
        SELECT 
        A.CONTROL, 
        MAX(A.CONTROL_VERS) CONTROL_VERS
        
        FROM CIS.MD_CONTROL A
        
        
         WHERE
         1=1
         AND A.FORM  = 10
               
         GROUP BY 
          A.CONTROL
         
         ORDER BY 
          A.CONTROL
        
        )  A  ON A.CONTROL = B.CONTROL AND A.CONTROL_VERS = B.CONTROL_VERS   
        
        
         WHERE
         1=1
         AND B.FORM  = 10
         AND B.STATUT <> '3'
        -- AND B.FORM_VERS = 2009
               
         
         
         ORDER BY 
          B.CONTROL ) L
          ---------------------------
          
          WHERE 
          1=1  

----create update  
----L.SQL_TEXT LIKE '%VW_DATA_ALL%'
--
----

AND 
DBMS_LOB.INSTR(L.SQL_TEXT, 'VW_DATA_ALL_TEMP') > 0
--AND 
--DBMS_LOB.INSTR(L.SQL_TEXT, '%VW_DATA_ALL%') > 0





-- 
--
--
--
--          --and  control_vers <> 384
----          AND  L.FORMULA LIKE '%Cap.I %'
--
--    AND
--    L.CONTROL NOT IN ('54-002','54-004','54-007','54-008','54-013','54-020', '54-014','54-017','54-015','54-001','54-010', '54-005','54-006'
--    ,'54-009','54-011','54-016') 

          
          
          