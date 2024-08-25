SELECT 
      R1.CODUL,
      R1.NR_ROW,    
      SUM(D1.COL1) AS COL1,
      SUM(D1.COL2) AS COL2

    FROM
         VW_DATA_ALL_COEF D1
       -- CIS.VW_DATA_ALL  D1
     
        INNER JOIN CIS.VW_CL_CAEM2 V ON (D1.CAEM2 = V.CODUL)
        INNER JOIN
        (
        
      SELECT
DENUMIRE CODUL,
RIND  AS NR_ROW,
ORDINE
FROM CIS.MD_RIND_OUT

WHERE
ID_MDTABLE = 2310

group by 

DENUMIRE,
RIND,
ORDINE



HAVING 
DENUMIRE IN ('00000')




        ) R1 ON (V.FULL_CODE LIKE '%'||R1.CODUL||'%' AND D1.RIND = R1.NR_ROW)

        WHERE
            D1.FORM IN (1)           AND 
              
            D1.CAPITOL IN (1,2) AND
            D1.FORM_VERS = :pFORM_VERS  AND 
            D1.PERIOADA IN (:pPERIOADA) AND             
            --D1.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND 
            D1.CUIIO = 1129894 
                
        GROUP BY
            R1.CODUL,
            R1.NR_ROW
            
    