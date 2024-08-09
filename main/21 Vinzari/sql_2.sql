SELECT 
    '5~9' AS COL1,
    CASE
        WHEN INSTR('5~9', '~') > 1 THEN SUBSTR('5~9', 1, INSTR('5~9', '~') - 1)
        ELSE '0'  -- Replace '0' with NULL if you prefer NULL instead of 0
    END AS COL1_M,
    
    '~9' AS COL2,
    CASE
        WHEN INSTR('~9', '~') > 1 THEN SUBSTR('~9', 1, INSTR('~9', '~') - 1)
        ELSE '0'  -- Replace '0' with NULL if you prefer NULL instead of 0
    END AS COL2_M
    
FROM DUAL;
