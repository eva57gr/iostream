SELECT DISTINCT
 DECODE(CC.NR_COLUMN, '1', 'COL1 ', '2', 'COL2 ', '3', 'COL3 ', '4', 'COL4 ', '5', 'COL5 ', '6', 'COL6', '7', 'COL7', '8', 'COL8', '9', 'COL9', '10', 'COL10', '11', 'COL11', '12', 'COL12')||': '||
 
 ROUND(
   CIS2.NVAL(SUM(CASE WHEN D.RIND IN('50') THEN 
      DECODE(CC.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6,'7', COL7, '8', COL8, '9', COL9,'10', COL10,'11', COL11,'12', COL12) ELSE 0 END))*1000/

  CIS2.NOZERO(
  CIS2.NVAL(SUM(CASE WHEN D.RIND IN('30') THEN 
       DECODE(CC.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6,'7', COL7, '8', COL8, '9', COL9,'10', COL10,'11', COL11,'12', COL12)ELSE 0 END))+
       
       
   CIS2.NVAL(SUM(CASE WHEN D.RIND IN('40') THEN 
       DECODE(CC.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6,'7', COL7, '8', COL8, '9', COL9,'10', COL10,'11', COL11,'12', COL12)ELSE 0 END))
       ),2)
 
  ||' nu apartine intervalului [450-570] - (p/u informa?ie: R.70 = ' ||  CIS2.NVAL(SUM(CASE WHEN D.RIND IN('70') THEN 
       DECODE(CC.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6,'7', COL7, '8', COL8, '9', COL9,'10', COL10,'11', COL11,'12', COL12)ELSE 0 END))|| ', R.71 = ' || 
        CIS2.NVAL(SUM(CASE WHEN D.RIND IN('71') THEN 
       DECODE(CC.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6,'7', COL7, '8', COL8, '9', COL9,'10', COL10,'11', COL11,'12', COL12)ELSE 0 END))||' ) '
  
 AS REZULTAT

FROM
  CIS2.VW_DATA_ALL D,             
       (                                                                        
       SELECT '1' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '2' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '3' AS NR_COLUMN FROM DUAL UNION
       SELECT '4' AS NR_COLUMN FROM DUAL UNION  
       SELECT '5' AS NR_COLUMN FROM DUAL UNION  
       SELECT '6' AS NR_COLUMN FROM DUAL union
       SELECT '7' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '8' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '9' AS NR_COLUMN FROM DUAL UNION
       SELECT '10' AS NR_COLUMN FROM DUAL UNION  
       SELECT '11' AS NR_COLUMN FROM DUAL UNION      
       SELECT '12' AS NR_COLUMN FROM DUAL                                            
       ) CC                                      
WHERE
  (D.PERIOADA=:PERIOADA)  AND
  (D.CUIIO=:CUIIO               OR :CUIIO = -1)     AND
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1)AND
  (D.FORM = :FORM )       AND 
  (D.FORM_VERS=:FORM_VERS       OR :FORM_VERS = -1) AND
  (D.CAPITOL=:CAPITOL           OR :CAPITOL = -1)   AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1)     AND 
  
   D.CAPITOL=27 AND
   D.FORM IN (76) AND
   D.RIND IN ('50','30','40','70','71')
  
GROUP BY
  CC.NR_COLUMN
HAVING
ROUND(
   CIS2.NVAL(SUM(CASE WHEN D.RIND IN('50') THEN 
      DECODE(CC.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6,'7', COL7, '8', COL8, '9', COL9,'10', COL10,'11', COL11,'12', COL12) ELSE 0 END))*1000/

  CIS2.NOZERO(
  CIS2.NVAL(SUM(CASE WHEN D.RIND IN('30') THEN 
       DECODE(CC.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6,'7', COL7, '8', COL8, '9', COL9,'10', COL10,'11', COL11,'12', COL12)ELSE 0 END))+
   CIS2.NVAL(SUM(CASE WHEN D.RIND IN('40') THEN 
       DECODE(CC.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6,'7', COL7, '8', COL8, '9', COL9,'10', COL10,'11', COL11,'12', COL12)ELSE 0 END))
       ),2) > 570
   
   OR
   
   ROUND(
   CIS2.NVAL(SUM(CASE WHEN D.RIND IN('50') THEN 
      DECODE(CC.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6,'7', COL7, '8', COL8, '9', COL9,'10', COL10,'11', COL11,'12', COL12) ELSE 0 END))*1000/

  CIS2.NOZERO(
  CIS2.NVAL(SUM(CASE WHEN D.RIND IN('30') THEN 
       DECODE(CC.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6,'7', COL7, '8', COL8, '9', COL9,'10', COL10,'11', COL11,'12', COL12)ELSE 0 END))+
   CIS2.NVAL(SUM(CASE WHEN D.RIND IN('40') THEN 
       DECODE(CC.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6,'7', COL7, '8', COL8, '9', COL9,'10', COL10,'11', COL11,'12', COL12)ELSE 0 END))
       ),2) < 450