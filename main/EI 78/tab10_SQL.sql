
--Now is 
SELECT 

 '1_63.11.11' AS COL1
 
 FROM DUAL
 
 UNION ALL 
 
 SELECT SUBSTR('1_63.11.11', INSTR('1_63.11.11', '_')+1)
 
 FROM DUAL
 
 --Must be
 
 --63.11.11
 
 
