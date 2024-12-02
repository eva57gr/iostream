SELECT 
    'Rind 100 col1' AS ORIGINAL_STRING,
    REGEXP_SUBSTR('Rind 100 col1', 'Rind') AS PART1, -- Extracts 'Rind'
    REGEXP_SUBSTR('Rind 100 col1', '[0-9]+') AS PART2, -- Extracts '100'
    REGEXP_SUBSTR('Rind 100 col1', 'col[0-9]+') AS PART3 -- Extracts 'col1'
FROM DUAL;