



SELECT 

        '5~9' AS COL1,
        REGEXP_SUBSTR('5~9', '\d+') COL1_M,
        
        '~9' AS COL2,
        REGEXP_SUBSTR('~9', '\d+') COL2_M
        
        FROM DUAL  
        
        -- Este o interogare in Oracle  
        -- Modifica SQl sa afiseze  daca este ceva pana la '~' sa afiseze nu mai pana la '~' dar daca nu este nimic sa afiseze zero sau null 
        
   