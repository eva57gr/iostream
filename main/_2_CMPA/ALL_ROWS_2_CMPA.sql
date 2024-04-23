SELECT 
         CASE WHEN TO_CHAR(D.PERIOADA) = '1060'  THEN 'TRM I 2024'  
              WHEN TO_CHAR(D.PERIOADA) = '1057'  THEN 'TRM II 2023' 
              WHEN TO_CHAR(D.PERIOADA) = '1058'  THEN 'TRM III 2023'
              WHEN TO_CHAR(D.PERIOADA) = '1059'  THEN 'TRM IV 2023'
              WHEN TO_CHAR(D.PERIOADA) = '1056'  THEN 'TRM I  2023'  
         ELSE  TO_CHAR(D.PERIOADA) END TRIMESTRU,
         D.UNIT_CODE,
         D.CUATM,
         CASE 
         
              WHEN D.CAPITOL = 416 THEN 'Cap I'
              WHEN D.CAPITOL = 417 THEN 'Cap II'
              WHEN D.CAPITOL = 418 THEN 'Informativ'
              
              WHEN D.CAPITOL = 419 THEN 'Cap SR'
         END 
          AS CAPITOL,
         D.RIND,   
         SUM(D.COL1) AS COL1,
         SUM(D.COL2) AS COL2,
         SUM(D.COL3) AS COL3,
         SUM(D.COL4) AS COL4,
         SUM(D.COL5) AS COL5,
         SUM(D.COL6) AS COL6,
         SUM(D.COL7) AS COL7,
         SUM(D.COL8) AS COL8,
         SUM(D.COL9) AS COL9,
         SUM(D.COL10) AS COL10,
         SUM(D.COL11) AS COL11,
         SUM(D.COL12) AS COL12,
         SUM(D.COL13) AS COL13,
         SUM(D.COL14) AS COL14,
         SUM(D.COL15) AS COL15,
         SUM(D.COL16) AS COL16,
         SUM(D.COL17) AS COL17,
         SUM(D.COL18) AS COL18,
         SUM(D.COL19) AS COL19
       
        
        
FROM
  CIS2.VW_DATA_ALL_GC  D
  
  ----
  -----
WHERE
  (D.PERIOADA IN (1056,1057,1058,1059,1060))  AND   
 -- (D.PERIOADA IN (1055))  AND   
--  (D.FORM =:pFORM) AND
--  (D.FORM_VERS =:pFORM_VERS) AND 
--  (:pID_MDTABLE =:pID_MDTABLE) AND 
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (58) 
  
 AND
  D.CAPITOL IN (416,419,417,418)
  

  
  GROUP BY 
   D.PERIOADA,
   D.UNIT_CODE,
   D.CUATM,
   D.CAPITOL,
   D.RIND  
  
    ORDER BY 
     D.CUATM,
   D.UNIT_CODE,
   D.CAPITOL,
   D.RIND