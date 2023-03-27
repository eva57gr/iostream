
 
    SELECT 
            
:pPERIOADA AS PERIOADA,
:pFORM AS FORM,
:pFORM_VERS AS FORM_VERS,
:pID_MDTABLE AS ID_MDTABLE,
:pCOD_CUATM AS COD_CUATM,
'0' AS NR_SECTIE,
'0' AS NUME_SECTIE,
'0' AS NR_SECTIE1,
'0' AS NUME_SECTIE1,
'0' AS NR_SECTIE2,
'0' AS NUME_SECTIE2,
 A.RIND AS NR_ROW,
 A.RIND AS ORDINE,
'0000000000' AS DECIMAL_POS, 
 A.DENUMIRE AS NUME_ROW,
              B.COL1,  
              B.COL2,
              B.COL3,
              B.COL4,
              B.COL5,
              B.COL6,
              B.COL7,
              B.COL8,
              B.COL9,
              B.COL10
              
              FROM 
              
              (
                  SELECT 
                            R.RIND          RIND,
                            R.RIND_VERS     RIND_VERS,
                            R.DENUMIRE      DENUMIRE
                               
                            FROM CIS2.MD_RIND R
                            
                            INNER JOIN (                  
                            SELECT 
                            R.RIND,
                            MAX(R.RIND_VERS) AS RIND_VERS
                            
                            FROM CIS2.MD_RIND R 
                            
                            WHERE 
                            R.RIND_VERS <=:pPERIOADA
                            AND  (R.FORM =:pFORM) AND 
                            (R.FORM_VERS =:pFORM_VERS) AND
                            (:pID_MDTABLE=:pID_MDTABLE) AND 
                             R.FORM = 17  AND 
                             R.CAPITOL IN (1001) AND 
                             ASCII(R.RIND) <> 45   
                            
                            
                            GROUP BY 
                            R.RIND
                            
                            
                             
                            
                             ) RR   ON (    RR.RIND      = R.RIND
                                       AND  RR.RIND_VERS = R.RIND_VERS)
                                       
                                       
                            WHERE
                            
                           (R.FORM =:pFORM) AND 
                           (R.FORM_VERS =:pFORM_VERS) AND
                           (:pID_MDTABLE=:pID_MDTABLE) AND 
                           R.FORM = 17  AND 
                           R.CAPITOL IN (1001) AND 
                           ASCII(R.RIND) <> 45  
                                             
                           
                           
                           GROUP BY
                           R.RIND,
                           R.RIND_VERS,
                           R.DENUMIRE
                           
                             
                           
                           
                           ) A LEFT JOIN (
                           
                           SELECT 
                 MR.RIND,
                 MR.RIND_VERS,
                 MR.DENUMIRE,
                 SUM(D.COL1)  AS COL1,
                 SUM(D.COL2)  AS COL2,
                 SUM(D.COL3)  AS COL3,
                 SUM(D.COL4)  AS COL4,
                 SUM(D.COL5)  AS COL5,
                 SUM(D.COL6)  AS COL6,
                 SUM(D.COL7)  AS COL7,
                 SUM(D.COL8)  AS COL8,
                 SUM(D.COL9)  AS COL9,
                 SUM(D.COL10) AS COL10 
            
            
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
               
               
                 
   GROUP BY 
   MR.RIND,
   MR.RIND_VERS,
   MR.DENUMIRE 
                           
                           ) B ON A.RIND = B.RIND AND A.RIND_VERS = B.RIND_VERS 
  