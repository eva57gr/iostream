SELECT 
    D.CUIIO,
    D.CUIIO_VERS,
    D.RIND  RIND,

CASE 
  WHEN TO_CHAR(SUBSTR(D.RIND, 2)) LIKE '0%' THEN LTRIM(TO_CHAR(SUBSTR(D.RIND, 2)), '0')
  ELSE TO_CHAR(SUBSTR(D.RIND, 2))
END AS RIND_MOD,

    D.ID_MD,
    D.RIND_VERS,
    MR.ORDINE
    
  
FROM 
  CIS2.VW_DATA_ALL D  
  
                INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD 
  
WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND
  D.FORM IN (49)                 AND 
  D.CAPITOL IN (1049) AND     
    
  (
  
  D.RIND NOT IN 
       
       (
       
        SELECT 
        CODUL
        
        FROM CIS2.CL_TARI_CS
        
       )
        
     AND 
     
     D.RIND NOT IN ('010','020','030','035','040','050','060','070')
     
       )   
       
       
       
       ORDER BY 
       MR.ORDINE