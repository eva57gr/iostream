
    SELECT 

            CASE WHEN SUBSTR((A.COL1 ||'~'||ROWNUM),1,1) =  '0' THEN (NULL||'~'||ROWNUM)  ELSE (A.COL1||'~'||ROWNUM)  END   NR_ROW, 
          ROWNUM ORDINE,
          '1010' AS DECIMAL_POS,                     
          A.DENUMIRE NUME_ROW,
          A.COL2 AS COL1,
          A.COL3 AS COL2,
          A.COL4 AS COL3,
          A.COL5 AS COL4
       
        
          FROM   

          (  
          SELECT 
          
          CTT.CODUL,
          CTT.DENUMIRE,
          COUNT(DISTINCT CASE WHEN MR.CAPITOL IN (419) AND  MR.RIND IN ('TIP3') THEN  D.UNIT_CODE ELSE NULL END  ) AS COL1,
          
          ROUND((COUNT(DISTINCT CASE WHEN MR.CAPITOL IN (419) AND  MR.RIND IN ('TIP3') THEN  D.UNIT_CODE ELSE NULL END ) / 
          NOZERO((COUNT(DISTINCT CASE WHEN MR.CAPITOL IN (419) AND  MR.RIND IN ('TIP3') THEN  D.UNIT_CODE ELSE NULL END  )) + 
          COUNT(DISTINCT CASE WHEN MR.CAPITOL IN (419) AND  MR.RIND IN ('TIP2') THEN  D.UNIT_CODE ELSE NULL END  ))) * 100,1)  AS COL2,
          
          COUNT(DISTINCT CASE WHEN MR.CAPITOL IN (419) AND  MR.RIND IN ('TIP2') THEN  D.UNIT_CODE ELSE NULL END  ) AS COL3,
          
          ROUND((COUNT(DISTINCT CASE WHEN MR.CAPITOL IN (419) AND  MR.RIND IN ('TIP2') THEN  D.UNIT_CODE ELSE NULL END ) / 
          NOZERO((COUNT(DISTINCT CASE WHEN MR.CAPITOL IN (419) AND  MR.RIND IN ('TIP3') THEN  D.UNIT_CODE ELSE NULL END  )) + 
          COUNT(DISTINCT CASE WHEN MR.CAPITOL IN (419) AND  MR.RIND IN ('TIP2') THEN  D.UNIT_CODE ELSE NULL END  ))) * 100,1)  AS COL4,
          
        --  COUNT(DISTINCT CASE WHEN MR.CAPITOL IN (419) AND  MR.RIND IN ('TIP3') THEN  D.UNIT_CODE ELSE NULL END  ) + 
          COUNT(DISTINCT CASE WHEN MR.CAPITOL IN (419) AND  MR.RIND IN ('0') THEN  D.UNIT_CODE ELSE NULL END  ) AS COL5 
       
          
          
          
          
              
        FROM DATA_ALL_GC D 
                 
                 
                 
                 
                        INNER JOIN CIS2.MD_RIND MR  ON (MR.ID_MD =  D.ID_MD)
                        
                
                        
          
               INNER JOIN REG_UNIT_GC RN
                ON     D.UNIT_CODE = RN.UNIT_CODE
                AND D.UNIT_CODE_VERS = RN.UNIT_CODE_VERS
                AND D.NR_GOSP = RN.NR_GOSP
                AND D.NR_MAPS = RN.NR_MAPS
                
                INNER  JOIN VW_CL_CUATM CT ON RN.CUATM = CT.CODUL 
                INNER JOIN CIS2.VW_CL_CUATM CTT ON CT.FULL_CODE LIKE '%'||CTT.CODUL||';%'   
                    

            WHERE 
                        
               
                  -- (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND   
                     
                   (D.PERIOADA IN (:pPERIOADA))  AND   
                   
                   (D.FORM =:pFORM) AND
                   (D.FORM_VERS =:pFORM_VERS) AND 
                   (:pID_MDTABLE =:pID_MDTABLE) AND
                   (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
                   D.FORM IN (58)  AND
                   MR.CAPITOL IN (417,419)
                   
                
                   
                   
                   
                   
                   AND CTT.PRGS IN (2)
                   
       --            AND CTT.CODUL IN ('6700000')
                   
                   GROUP BY 
                  CTT.CODUL,
                  CTT.DENUMIRE, 
                  CTT.FULL_CODE
                  
                  ORDER BY 
                  CTT.FULL_CODE
                  
                  ) A 

  
  