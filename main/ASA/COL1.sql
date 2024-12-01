-- The extended SQL script with additional rows and columns

SELECT 
   RR.NR_ROW,
  ROUND(SUM ( CASE WHEN  1=1 THEN DECODE(RR.NR_ROW, 
         
         'Rind 100 col1', (DD.COL1),
         'Rind 110 col1', (DD.COL2),
         'Rind 111 col1', (DD.COL3),
         'Rind 112 col1', (DD.COL4),
         'Rind 120 col1', (DD.COL5),
         'Rind 121 col1', (DD.COL6),
         'Rind 122 col1', (DD.COL7),
         'Rind 130 col1', (DD.COL8),
         'Rind 140 col1', (DD.COL9),
         'Rind 150 col1', (DD.COL10),
         'Rind 151 col1', (DD.COL11),
         'Rind 160 col1', (DD.COL12),
         'Rind 170 col1', (DD.COL13),
         'Rind 180 col1', (DD.COL14),
         'Rind 200 col1', (DD.COL15),
         'Rind 210 col1', (DD.COL16),
         'Rind 220 col1', (DD.COL17),
         'Rind 221 col1', (DD.COL18),
         'Rind 222 col1', (DD.COL19),
         'Rind 240 col1', (DD.COL20),
         'Rind 241 col1', (DD.COL21),
         'Rind 242 col1', (DD.COL22),
         'Rind 243 col1', (DD.COL23),
         'Rind 260 col1', (DD.COL24),
         'Rind 270 col1', (DD.COL25),
         'Rind 280 col1', (DD.COL26),
         'Rind 281 col1', (DD.COL27),
         'Rind 282 col1', (DD.COL28),
         'Rind 290 col1', (DD.COL29),
         'Rind 291 col1', (DD.COL30),
         'Rind 2911 col1', (DD.COL31),
         'Rind 2912 col1', (DD.COL32),
         'Rind 292 col1', (DD.COL33),
         'Rind 293 col1', (DD.COL34),
         'Rind 2931 col1', (DD.COL35),
         'Rind 294 col1', (DD.COL36),
         'Rind 2941 col1', (DD.COL37),
         'Rind 2942 col1', (DD.COL38),
         'Rind 2943 col1', (DD.COL39),
         'Rind 2944 col1', (DD.COL40),
         'Rind 295 col1', (DD.COL41),
         'Rind 296 col1', (DD.COL42),
         'Rind 2961 col1', (DD.COL43),
         'Rind 2962 col1', (DD.COL44),
         'Rind 297 col1', (DD.COL45),
         'Rind 300 col1', (DD.COL46),
         'Rind 300 col2', (DD.COL47),
         'Rind 310 col1', (DD.COL48),
         'Rind 310 col2', (DD.COL49),
         'Rind 320 col1', (DD.COL50),
         'Rind 320 col2', (DD.COL51),
         'Rind 330 col1', (DD.COL52),
         'Rind 330 col2', (DD.COL53),
         'Rind 340 col1', (DD.COL54),
         'Rind 340 col2', (DD.COL55),
         'Rind 350 col1', (DD.COL56),
         'Rind 350 col2', (DD.COL57),
         'Rind 400 col1', (DD.COL58),
         'Rind 400 col2', (DD.COL59),
         'Rind 500 col1', (DD.COL60),
         'Rind 500 col2', (DD.COL61)
         ) END),1)     
         
         AS COL1, 

 -- Add further logic as needed, following the established pattern

FROM (
    -- Subquery with DISTINCT, GROUP BY, and HAVING logic as specified
) DD

CROSS JOIN (
    -- CROSS JOIN logic with mappings for rows to columns as specified earlier
) RR

WHERE 
    -- WHERE clause with proper conditions for filtering and input parameters

GROUP BY 
    RR.NR_ROW

ORDER BY 
    RR.NR_ROW;
