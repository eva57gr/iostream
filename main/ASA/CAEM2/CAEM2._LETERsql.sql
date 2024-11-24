SELECT
CODUL, 
DENUMIRE, 
GRUPA, 
ORDINE, 
FULL_CODE, 
NUM_CODE, 
PRIM                
                FROM  CIS2.VW_CL_CAEM2
                
               
                
                WHERE 
                CODUL LIKE 'C%'
                OR CODUL LIKE 'B%'
                OR CODUL LIKE 'D%'
                OR CODUL LIKE 'E%'
                OR CODUL LIKE 'F%'
                OR CODUL LIKE 'G%'
                OR CODUL LIKE 'H%'
                OR CODUL LIKE 'I%'
                OR CODUL LIKE 'J%'
                OR CODUL LIKE 'L%'
                OR CODUL LIKE 'M%'
                OR CODUL LIKE 'N%'
                OR CODUL LIKE 'S%'
             
                
                ORDER BY
                FULL_CODE