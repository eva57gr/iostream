 --How do I remove dot from char in Oracle?
 SELECT 
REPLACE(S1.COD_SPEC, '.', '') AS COD_SPEC, -- Removes the dots from COD_SPEC
 S1.COD_SPEC, --715.10.1, 714.10.1
 TO_CHAR (REPLACE(S1.COD_SPEC, '.', ''),'0000000') AS COD_SPEC_MOD,
 ORDINE,
 NIVEL   
 
 FROM CL_SPEC_3EDU_24 S1 
   
--    WHERE 
--    NIVEL = 3


ORDER BY 
ORDINE
 