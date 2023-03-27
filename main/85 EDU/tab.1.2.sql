SELECT 
--D.CUIIO,
                 MR.RIND,
--                 MR.RIND_VERS,
--                 MR.DENUMIRE,
--                 SUM(D.COL1)  AS COL1,
--                 SUM(D.COL2)  AS COL2,
--                 SUM(D.COL3)  AS COL3,
                   SUM(D.COL4)  AS COL4
--                 SUM(D.COL5)  AS COL5,
--                 SUM(D.COL6)  AS COL6,
--                 SUM(D.COL7)  AS COL7,
--                 SUM(D.COL8)  AS COL8,
--                 SUM(D.COL9)  AS COL9,
--                 SUM(D.COL10) AS COL10 
--            
            
              FROM CIS2.DATA_ALL  D
                  
                            
                  INNER JOIN CIS2.RENIM R ON (R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS)
                  INNER JOIN CIS2.VW_CL_CUATM C ON (R.CUATM = C.CODUL)
                  
                  INNER JOIN CIS2.MD_RIND MR ON (MR.ID_MD = D.ID_MD)  
                  
                  
                                                                 
                  
              
    WHERE
    (D.PERIOADA =:pPERIOADA) AND    
    (D.FORM =:pFORM) AND 
    (D.FORM_VERS =:pFORM_VERS) AND
    (:pID_MDTABLE=:pID_MDTABLE) AND 
    (C.FULL_CODE LIKE '%' ||:pCOD_CUATM||';%') AND
    MR.FORM = 17  AND 
    MR.CAPITOL IN (1001)  
    AND  ASCII(MR.RIND) <> 45   
     
    
   AND MR.CAPITOL IN (1001)  AND  MR.RIND IN ('010')           
               
                 
   GROUP BY 
   MR.RIND
 --  D.CUIIO
   
   
   HAVING
   SUM(D.COL4) IS NOT NULL
--   MR.RIND_VERS,
--   MR.DENUMIRE 