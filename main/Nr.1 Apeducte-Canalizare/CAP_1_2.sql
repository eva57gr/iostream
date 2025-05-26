SELECT 
D.RIND,
SUM(D.COL9) AS COL9
 
 FROM CIS2.VW_DATA_ALL D  
  INNER JOIN CIS2.VW_CL_CUATM C ON (D.RIND=C.CODUL) 
WHERE  D.PERIOADA IN (:pPERIOADA) AND
       D.FORM = :pFORM AND
       D.FORM_VERS = :pFORM_VERS  AND  
      (:pID_MDTABLE=:pID_MDTABLE) AND
       D.FORM = 47 AND
       D.CAPITOL IN (1035) AND
       C.FULL_CODE LIKE '%'||:pCOD_CUATM||'%'
       
       AND D.RIND NOT IN ('0000000')
       
       GROUP BY
        D.RIND
        
        HAVING 
        
        NVAL(SUM(D.COL9)) > 0 
        
        
        AND 
        
        D.RIND LIKE '01%'