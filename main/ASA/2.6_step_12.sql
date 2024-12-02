INSERT INTO CIS2.TABLE_OUT 
(
  PERIOADA,
  FORM,
  FORM_VERS,
  ID_MDTABLE,
  COD_CUATM,
  NR_SECTIE,
  NUME_SECTIE,
  NR_SECTIE1,
  NUME_SECTIE1,
  NR_SECTIE2,
  NUME_SECTIE2,
  NR_ROW,
  ORDINE,
  DECIMAL_POS,
  NUME_ROW,  
 COL1, COL2, COL3,COL4,COL5, COL6, COL7, COL8, COL9, COL10, COL11
)
SELECT 
:pPERIOADA AS PERIOADA,
:pFORM AS FORM,
:pFORM_VERS AS FORM_VERS,
:pID_MDTABLE AS ID_MDTABLE,
:pCOD_CUATM AS COD_CUATM,    
'0' AS  NR_SECTIE,
'0' AS  NUME_SECTIE,
'0' AS NR_SECTIE1,
'0' AS NUME_SECTIE1,
'0' AS NR_SECTIE2,
'0' AS NUME_SECTIE2, 

REGEXP_SUBSTR(NR_ROW, '[0-9]+')||'~'||ROWNUM AS NR_ROW, 
ORDINE,
'01111111111' AS DECIMAL_POS,
NR_ROW NUME_ROW,
COL1, COL2, COL3,COL4,COL5,COL6,COL7,COL8,COL9,COL10,COL11
FROM 

(
SELECT 
    ROWNUM ORDINE,
    NR_ROW,         
  
    COL1, COL2, COL3,COL4,COL5,COL6,COL7,COL8,COL9,COL10,COL11
   
   FROM(

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
         
         'Rind 310 col1', (DD.COL47),
         
         'Rind 320 col1', (DD.COL48),
         'Rind 320 col2', (DD.COL49),
         'Rind 330 col1', (DD.COL50),
         'Rind 330 col2', (DD.COL51),
         'Rind 340 col1', (DD.COL54),
         'Rind 340 col2', (DD.COL55),
         'Rind 350 col1', (DD.COL56),
         'Rind 350 col2', (DD.COL57),
         'Rind 400 col1', (DD.COL58),
         'Rind 400 col2', (DD.COL59),
         'Rind 500 col1', (DD.COL60),
         'Rind 500 col2', (DD.COL61)  
       
    -----------------------------------       
           
         )END),1)     
         
         AS COL1, 
 
 SUM( CASE WHEN (DD.PERS BETWEEN 0 AND 9 OR DD.PERS IS NULL ) THEN  (DECODE(RR.NR_ROW, 
      
       
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
         'Rind 310 col1', (DD.COL47),
         'Rind 320 col1', (DD.COL48),
         
         'Rind 320 col2', (DD.COL49),
         'Rind 330 col1', (DD.COL50),
         'Rind 330 col2', (DD.COL51),
         'Rind 340 col1', (DD.COL54),
         'Rind 340 col2', (DD.COL55),
         'Rind 350 col1', (DD.COL56),
         'Rind 350 col2', (DD.COL57),
         'Rind 400 col1', (DD.COL58),
         'Rind 400 col2', (DD.COL59),
         'Rind 500 col1', (DD.COL60),
         'Rind 500 col2', (DD.COL61)  
           
           
        
         )) END)
  
         AS COL2,
         
        
 
 SUM( CASE WHEN (DD.PERS BETWEEN 10 AND 19 OR DD.PERS IS NULL ) THEN  (DECODE(RR.NR_ROW, 
      
       
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
         'Rind 310 col1', (DD.COL47),
         'Rind 320 col1', (DD.COL48),
         
         'Rind 320 col2', (DD.COL49),
         'Rind 330 col1', (DD.COL50),
         'Rind 330 col2', (DD.COL51),
         'Rind 340 col1', (DD.COL54),
         'Rind 340 col2', (DD.COL55),
         'Rind 350 col1', (DD.COL56),
         'Rind 350 col2', (DD.COL57),
         'Rind 400 col1', (DD.COL58),
         'Rind 400 col2', (DD.COL59),
         'Rind 500 col1', (DD.COL60),
         'Rind 500 col2', (DD.COL61)  
           
           
        
         )) END)
  
         AS COL3,
         
          SUM( CASE WHEN (DD.PERS BETWEEN 20 AND 49 OR DD.PERS IS NULL ) THEN  (DECODE(RR.NR_ROW, 
      
       
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
         'Rind 310 col1', (DD.COL47),
         'Rind 320 col1', (DD.COL48),
         
         'Rind 320 col2', (DD.COL49),
         'Rind 330 col1', (DD.COL50),
         'Rind 330 col2', (DD.COL51),
         'Rind 340 col1', (DD.COL54),
         'Rind 340 col2', (DD.COL55),
         'Rind 350 col1', (DD.COL56),
         'Rind 350 col2', (DD.COL57),
         'Rind 400 col1', (DD.COL58),
         'Rind 400 col2', (DD.COL59),
         'Rind 500 col1', (DD.COL60),
         'Rind 500 col2', (DD.COL61)  
           
           
        
         )) END)
  
         AS COL4,
         
                  SUM( CASE WHEN (DD.PERS BETWEEN 0 AND 49 OR DD.PERS IS NULL ) THEN  (DECODE(RR.NR_ROW, 
      
       
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
         'Rind 310 col1', (DD.COL47),
         'Rind 320 col1', (DD.COL48),
         
         'Rind 320 col2', (DD.COL49),
         'Rind 330 col1', (DD.COL50),
         'Rind 330 col2', (DD.COL51),
         'Rind 340 col1', (DD.COL54),
         'Rind 340 col2', (DD.COL55),
         'Rind 350 col1', (DD.COL56),
         'Rind 350 col2', (DD.COL57),
         'Rind 400 col1', (DD.COL58),
         'Rind 400 col2', (DD.COL59),
         'Rind 500 col1', (DD.COL60),
         'Rind 500 col2', (DD.COL61)  
           
           
        
         )) END)
  
         AS COL5,
         
                  SUM( CASE WHEN (DD.PERS BETWEEN 50 AND 99 OR DD.PERS IS NULL ) THEN  (DECODE(RR.NR_ROW, 
      
       
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
         'Rind 310 col1', (DD.COL47),
         'Rind 320 col1', (DD.COL48),
         
         'Rind 320 col2', (DD.COL49),
         'Rind 330 col1', (DD.COL50),
         'Rind 330 col2', (DD.COL51),
         'Rind 340 col1', (DD.COL54),
         'Rind 340 col2', (DD.COL55),
         'Rind 350 col1', (DD.COL56),
         'Rind 350 col2', (DD.COL57),
         'Rind 400 col1', (DD.COL58),
         'Rind 400 col2', (DD.COL59),
         'Rind 500 col1', (DD.COL60),
         'Rind 500 col2', (DD.COL61)  
           
           
        
         )) END)
  
         AS COL6,
         
                           SUM( CASE WHEN (DD.PERS BETWEEN 100 AND 249 OR DD.PERS IS NULL ) THEN  (DECODE(RR.NR_ROW, 
      
       
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
         'Rind 310 col1', (DD.COL47),
         'Rind 320 col1', (DD.COL48),
         
         'Rind 320 col2', (DD.COL49),
         'Rind 330 col1', (DD.COL50),
         'Rind 330 col2', (DD.COL51),
         'Rind 340 col1', (DD.COL54),
         'Rind 340 col2', (DD.COL55),
         'Rind 350 col1', (DD.COL56),
         'Rind 350 col2', (DD.COL57),
         'Rind 400 col1', (DD.COL58),
         'Rind 400 col2', (DD.COL59),
         'Rind 500 col1', (DD.COL60),
         'Rind 500 col2', (DD.COL61)  
           
           
        
         )) END)
  
         AS COL7,
         
                                    SUM( CASE WHEN (DD.PERS BETWEEN 50 AND 249 OR DD.PERS IS NULL ) THEN  (DECODE(RR.NR_ROW, 
      
       
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
         'Rind 310 col1', (DD.COL47),
         'Rind 320 col1', (DD.COL48),
         
         'Rind 320 col2', (DD.COL49),
         'Rind 330 col1', (DD.COL50),
         'Rind 330 col2', (DD.COL51),
         'Rind 340 col1', (DD.COL54),
         'Rind 340 col2', (DD.COL55),
         'Rind 350 col1', (DD.COL56),
         'Rind 350 col2', (DD.COL57),
         'Rind 400 col1', (DD.COL58),
         'Rind 400 col2', (DD.COL59),
         'Rind 500 col1', (DD.COL60),
         'Rind 500 col2', (DD.COL61)  
           
           
        
         )) END)
  
         AS COL8,
         
             
                                    SUM( CASE WHEN (DD.PERS BETWEEN 250 AND 9999999 OR DD.PERS IS NULL ) THEN  (DECODE(RR.NR_ROW, 
      
       
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
         'Rind 310 col1', (DD.COL47),
         'Rind 320 col1', (DD.COL48),
         
         'Rind 320 col2', (DD.COL49),
         'Rind 330 col1', (DD.COL50),
         'Rind 330 col2', (DD.COL51),
         'Rind 340 col1', (DD.COL54),
         'Rind 340 col2', (DD.COL55),
         'Rind 350 col1', (DD.COL56),
         'Rind 350 col2', (DD.COL57),
         'Rind 400 col1', (DD.COL58),
         'Rind 400 col2', (DD.COL59),
         'Rind 500 col1', (DD.COL60),
         'Rind 500 col2', (DD.COL61)  
           
           
        
         )) END)
  
         AS COL9,
                                        SUM( CASE WHEN (DD.PERS BETWEEN 250 AND 499 OR DD.PERS IS NULL ) THEN  (DECODE(RR.NR_ROW, 
      
       
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
         'Rind 310 col1', (DD.COL47),
         'Rind 320 col1', (DD.COL48),
         
         'Rind 320 col2', (DD.COL49),
         'Rind 330 col1', (DD.COL50),
         'Rind 330 col2', (DD.COL51),
         'Rind 340 col1', (DD.COL54),
         'Rind 340 col2', (DD.COL55),
         'Rind 350 col1', (DD.COL56),
         'Rind 350 col2', (DD.COL57),
         'Rind 400 col1', (DD.COL58),
         'Rind 400 col2', (DD.COL59),
         'Rind 500 col1', (DD.COL60),
         'Rind 500 col2', (DD.COL61)  
           
           
        
         )) END)
  
         AS COL10,
         
         SUM( CASE WHEN (DD.PERS BETWEEN  500 AND 99999999 OR DD.PERS IS NULL ) THEN  (DECODE(RR.NR_ROW, 
      
       
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
         'Rind 310 col1', (DD.COL47),
         'Rind 320 col1', (DD.COL48),
         
         'Rind 320 col2', (DD.COL49),
         'Rind 330 col1', (DD.COL50),
         'Rind 330 col2', (DD.COL51),
         'Rind 340 col1', (DD.COL54),
         'Rind 340 col2', (DD.COL55),
         'Rind 350 col1', (DD.COL56),
         'Rind 350 col2', (DD.COL57),
         'Rind 400 col1', (DD.COL58),
         'Rind 400 col2', (DD.COL59),
         'Rind 500 col1', (DD.COL60),
         'Rind 500 col2', (DD.COL61)  
           
           
        
         )) END)
  
         AS COL11

    FROM 
  (
-------------------------------------------------------------------------------
SELECT 
  
 DISTINCT D.CUIIO, 
   CASE WHEN MAX(CASE WHEN  D.RIND IN ('8') AND D.CAPITOL IN (1129) THEN D.COL31 END ) IS NULL THEN  MAX(SUBSTR(D.CAEM2,2,4)) 
   ELSE MAX(CASE WHEN  D.RIND IN ('8') AND D.CAPITOL IN (1129) THEN D.COL31 END )  END AS CAEM2_ACTUALIZAT,
 MAX(SUBSTR(D.CAEM2,2,4))  AS CAEM2,
 D.CUIIO_VERS, 
 D.CUATM, D.FORM,D.FORM_VERS,D.CUATM_FULL,D.PERIOADA,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (100)  AND D.RIND IN ('CD')  THEN  D.COL1 ELSE 0 END))  AS COL0,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('100') THEN  CIS2.NVAL(D.COL1) END))  AS COL1,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('110') THEN  CIS2.NVAL(D.COL1) END))  AS COL2,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('111') THEN  CIS2.NVAL(D.COL1) END))  AS COL3,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('112') THEN  CIS2.NVAL(D.COL1) END))  AS COL4,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('120') THEN  CIS2.NVAL(D.COL1) END))  AS COL5,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('121') THEN  CIS2.NVAL(D.COL1) END))  AS COL6,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('122') THEN  CIS2.NVAL(D.COL1) END))  AS COL7,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('130') THEN  CIS2.NVAL(D.COL1) END))  AS COL8,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('140') THEN  CIS2.NVAL(D.COL1) END))  AS COL9,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('150') THEN  CIS2.NVAL(D.COL1) END))  AS COL10,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('151') THEN  CIS2.NVAL(D.COL1) END))  AS COL11,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('160') THEN  CIS2.NVAL(D.COL1) END))  AS COL12,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('170') THEN  CIS2.NVAL(D.COL1) END))  AS COL13,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('180') THEN  CIS2.NVAL(D.COL1) END))  AS COL14,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('200') THEN  CIS2.NVAL(D.COL1) END))  AS COL15,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('210') THEN  CIS2.NVAL(D.COL1) END))  AS COL16,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('220') THEN  CIS2.NVAL(D.COL1) END))  AS COL17,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('221') THEN  CIS2.NVAL(D.COL1) END))  AS COL18,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('222') THEN  CIS2.NVAL(D.COL1) END))  AS COL19,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('240') THEN  CIS2.NVAL(D.COL1) END))  AS COL20,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('241') THEN  CIS2.NVAL(D.COL1) END))  AS COL21,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('242') THEN  CIS2.NVAL(D.COL1) END))  AS COL22,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('243') THEN  CIS2.NVAL(D.COL1) END))  AS COL23,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('260') THEN  CIS2.NVAL(D.COL1) END))  AS COL24,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('270') THEN  CIS2.NVAL(D.COL1) END))  AS COL25,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('280') THEN  CIS2.NVAL(D.COL1) END))  AS COL26,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('281') THEN  CIS2.NVAL(D.COL1) END))  AS COL27,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('282') THEN  CIS2.NVAL(D.COL1) END))  AS COL28,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('290') THEN  CIS2.NVAL(D.COL1) END))  AS COL29,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('291') THEN  CIS2.NVAL(D.COL1) END))  AS COL30,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('2911') THEN  CIS2.NVAL(D.COL1) END))  AS COL31,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('2912') THEN  CIS2.NVAL(D.COL1) END))  AS COL32,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('292') THEN  CIS2.NVAL(D.COL1) END))  AS COL33,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('293') THEN  CIS2.NVAL(D.COL1) END))  AS COL34,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('2931') THEN  CIS2.NVAL(D.COL1) END))  AS COL35,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('294') THEN  CIS2.NVAL(D.COL1) END))  AS COL36,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('2941') THEN  CIS2.NVAL(D.COL1) END))  AS COL37,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('2942') THEN  CIS2.NVAL(D.COL1) END))  AS COL38,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('2943') THEN  CIS2.NVAL(D.COL1) END))  AS COL39,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('2944') THEN  CIS2.NVAL(D.COL1) END))  AS COL40,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('295') THEN  CIS2.NVAL(D.COL1) END))  AS COL41,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('296') THEN  CIS2.NVAL(D.COL1) END))  AS COL42,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('2961') THEN  CIS2.NVAL(D.COL1) END))  AS COL43,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('2962') THEN  CIS2.NVAL(D.COL1) END))  AS COL44,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('297') THEN  CIS2.NVAL(D.COL1) END))  AS COL45,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('300') THEN  CIS2.NVAL(D.COL1) END))  AS COL46,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1125) AND D.RIND IN ('310') THEN  CIS2.NVAL(D.COL1) END))  AS COL47,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1126) AND D.RIND IN ('320') THEN  CIS2.NVAL(D.COL1) END))  AS COL48,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1126) AND D.RIND IN ('320') THEN  CIS2.NVAL(D.COL2) END))  AS COL49,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1126) AND D.RIND IN ('330') THEN  CIS2.NVAL(D.COL1) END))  AS COL50,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1126) AND D.RIND IN ('330') THEN  CIS2.NVAL(D.COL2) END))  AS COL51,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1126) AND D.RIND IN ('340') THEN  CIS2.NVAL(D.COL1) END))  AS COL54,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1126) AND D.RIND IN ('340') THEN  CIS2.NVAL(D.COL2) END))  AS COL55,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1126) AND D.RIND IN ('350') THEN  CIS2.NVAL(D.COL1) END))  AS COL56,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1126) AND D.RIND IN ('350') THEN  CIS2.NVAL(D.COL2) END))  AS COL57,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1127) AND D.RIND IN ('400') THEN  CIS2.NVAL(D.COL3) END))  AS COL58,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1127) AND D.RIND IN ('400') THEN  CIS2.NVAL(D.COL4) END))  AS COL59,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('500') THEN  CIS2.NVAL(D.COL8) END))  AS COL60,
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (1128) AND D.RIND IN ('500') THEN  CIS2.NVAL(D.COL9) END))  AS COL61,
 
 (SELECT  CASE WHEN DD.COL4 IS NOT NULL THEN DD.COL4 ELSE 0 END 
 FROM
   CIS2.DATA_ALL DD
 WHERE
   DD.PERIOADA IN (D.PERIOADA) AND
   DD.FORM=D.FORM AND
   DD.ID_MD IN (69986) AND
   DD.CUIIO IN (D.CUIIO)) AS PERS
 
FROM   
    CIS2.VW_DATA_ALL_COEF D       
WHERE
  D.FORM IN (64)             AND 
  D.FORM_VERS = :PFORM_VERS  AND      
  D.PERIOADA =:pPERIOADA AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%'   AND
  D.CAPITOL IN (100,1123,1124,1125,1126,1127,1128,1129) 
 -- AND D.CUIIO IN (26844)


 GROUP BY D.CUIIO, D.CUIIO_VERS, D.CUATM, D.FORM,D.FORM_VERS,D.CUATM_FULL,D.PERIOADA
 
HAVING
--  
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (100)  AND D.RIND IN ('CD') THEN  D.COL1 ELSE 0 END)) >0
  AND 
 
 CIS2.NVAL(SUM(CASE WHEN D.CAPITOL IN (100)  AND D.RIND IN ('1','5') THEN  D.COL1 ELSE 0 END)) > 0
 
 )DD

 
  CROSS JOIN
  ( 
     SELECT 'Rind 100 col1' AS NR_ROW, 'Col1' AS COL FROM DUAL UNION   
     SELECT 'Rind 110 col1' AS NR_ROW, 'Col2' AS COL FROM DUAL UNION
     SELECT 'Rind 111 col1' AS NR_ROW, 'Col3' AS COL FROM DUAL UNION 
     SELECT 'Rind 112 col1' AS NR_ROW, 'Col4' AS COL FROM DUAL UNION 
     SELECT 'Rind 120 col1' AS NR_ROW, 'Col5' AS COL FROM DUAL UNION
     SELECT 'Rind 121 col1' AS NR_ROW, 'Col6' AS COL FROM DUAL UNION
     SELECT 'Rind 122 col1' AS NR_ROW, 'Col7' AS COL FROM DUAL UNION 
     SELECT 'Rind 130 col1' AS NR_ROW, 'Col8' AS COL FROM DUAL UNION
     SELECT 'Rind 140 col1' AS NR_ROW, 'Col9' AS COL FROM DUAL UNION
     SELECT 'Rind 150 col1' AS NR_ROW, 'Col10' AS COL FROM DUAL UNION
     SELECT 'Rind 151 col1' AS NR_ROW, 'Col11' AS COL FROM DUAL UNION
     SELECT 'Rind 160 col1' AS NR_ROW, 'Col12' AS COL FROM DUAL UNION
     SELECT 'Rind 170 col1' AS NR_ROW, 'Col13' AS COL FROM DUAL UNION
     SELECT 'Rind 180 col1' AS NR_ROW, 'Col14' AS COL FROM DUAL UNION
     SELECT 'Rind 200 col1' AS NR_ROW, 'Col15' AS COL FROM DUAL UNION
     SELECT 'Rind 210 col1' AS NR_ROW, 'Col16' AS COL FROM DUAL UNION
     SELECT 'Rind 220 col1' AS NR_ROW, 'Col17' AS COL FROM DUAL UNION 
     SELECT 'Rind 221 col1' AS NR_ROW, 'Col18' AS COL FROM DUAL UNION
     SELECT 'Rind 222 col1' AS NR_ROW, 'Col19' AS COL FROM DUAL UNION
     SELECT 'Rind 240 col1' AS NR_ROW, 'Col20' AS COL FROM DUAL UNION
     SELECT 'Rind 241 col1' AS NR_ROW, 'Col21' AS COL FROM DUAL UNION
     SELECT 'Rind 242 col1' AS NR_ROW, 'Col22' AS COL FROM DUAL UNION
     SELECT 'Rind 243 col1' AS NR_ROW, 'Col23' AS COL FROM DUAL UNION
     SELECT 'Rind 260 col1' AS NR_ROW, 'Col24' AS COL FROM DUAL UNION
     SELECT 'Rind 270 col1' AS NR_ROW, 'Col25' AS COL FROM DUAL UNION
     SELECT 'Rind 280 col1' AS NR_ROW, 'Col26' AS COL FROM DUAL UNION
     SELECT 'Rind 281 col1' AS NR_ROW, 'Col27' AS COL FROM DUAL UNION
     SELECT 'Rind 282 col1' AS NR_ROW, 'Col28' AS COL FROM DUAL UNION
     SELECT 'Rind 290 col1' AS NR_ROW, 'Col29' AS COL FROM DUAL UNION
     SELECT 'Rind 291 col1' AS NR_ROW, 'Col30' AS COL FROM DUAL UNION
     SELECT 'Rind 2911 col1' AS NR_ROW, 'Col31' AS COL FROM DUAL UNION
     SELECT 'Rind 2912 col1' AS NR_ROW, 'Col32' AS COL FROM DUAL UNION
     SELECT 'Rind 292 col1' AS NR_ROW, 'Col33' AS COL FROM DUAL  UNION
     SELECT 'Rind 293 col1' AS NR_ROW, 'Col34' AS COL FROM DUAL  UNION
     SELECT 'Rind 2931 col1' AS NR_ROW, 'Col35' AS COL FROM DUAL  UNION
     SELECT 'Rind 294 col1' AS NR_ROW, 'Col36' AS COL FROM DUAL  UNION
     SELECT 'Rind 2941 col1' AS NR_ROW, 'Col37' AS COL FROM DUAL  UNION
     SELECT 'Rind 2942 col1' AS NR_ROW, 'Col38' AS COL FROM DUAL  UNION
     SELECT 'Rind 2943 col1' AS NR_ROW, 'Col39' AS COL FROM DUAL  UNION
     SELECT 'Rind 2944 col1' AS NR_ROW, 'Col40' AS COL FROM DUAL  UNION
     SELECT 'Rind 295 col1' AS NR_ROW, 'Col41' AS COL FROM DUAL  UNION
     SELECT 'Rind 296 col1' AS NR_ROW, 'Col42' AS COL FROM DUAL  UNION
     SELECT 'Rind 2961 col1' AS NR_ROW, 'Col43' AS COL FROM DUAL  UNION
     SELECT 'Rind 2962 col1' AS NR_ROW, 'Col44' AS COL FROM DUAL  UNION
     SELECT 'Rind 297 col1' AS NR_ROW, 'Col45' AS COL FROM DUAL  UNION
     SELECT 'Rind 300 col1' AS NR_ROW, 'Col46' AS COL FROM DUAL  UNION
     SELECT 'Rind 310 col1' AS NR_ROW, 'Col47' AS COL FROM DUAL  UNION
     SELECT 'Rind 320 col1' AS NR_ROW, 'Col48' AS COL FROM DUAL  UNION
     SELECT 'Rind 320 col2' AS NR_ROW, 'Col49' AS COL FROM DUAL  UNION
     
     SELECT 'Rind 330 col1' AS NR_ROW, 'Col50' AS COL FROM DUAL  UNION
     SELECT 'Rind 330 col2' AS NR_ROW, 'Col51' AS COL FROM DUAL  UNION
     SELECT 'Rind 340 col1' AS NR_ROW, 'Col54' AS COL FROM DUAL  UNION
     SELECT 'Rind 340 col2' AS NR_ROW, 'Col55' AS COL FROM DUAL  UNION
     SELECT 'Rind 350 col1' AS NR_ROW, 'Col56' AS COL FROM DUAL  UNION
     SELECT 'Rind 350 col2' AS NR_ROW, 'Col57' AS COL FROM DUAL  UNION
     SELECT 'Rind 400 col1' AS NR_ROW, 'Col58' AS COL FROM DUAL  UNION
     SELECT 'Rind 400 col2' AS NR_ROW, 'Col59' AS COL FROM DUAL  UNION
     SELECT 'Rind 500 col1' AS NR_ROW, 'Col60' AS COL FROM DUAL  UNION
     SELECT 'Rind 500 col2' AS NR_ROW, 'Col61' AS COL FROM DUAL  
    
   ) RR 


         
 WHERE 
  (DD.FORM=:pFORM) AND
  (DD.FORM_VERS=:pFORM_VERS) AND
  (:pID_MDTABLE=:pID_MDTABLE) AND
  (DD.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND   
  DD.PERIOADA IN (:pPERIOADA) 
 AND  DD.CUIIO=26844
 
   GROUP BY
    RR.NR_ROW       
    
    
   ORDER BY 
   RR.NR_ROW
   )
   )
