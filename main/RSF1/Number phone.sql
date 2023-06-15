SELECT 
       DISTINCT 
       F.DEN_SHORT,
       D.CUIIO,
       R.IDNO,
       R.DENUMIRE,
       D.CUATM,
       C.DENUMIRE DENUMIRE_CUATM,
       D.CAEM2 CAEM2_RENIM,
       MAX (CASE WHEN D.CAPITOL IN (1091) AND D.RIND IN ('CAEM')  THEN D.COL1 ELSE NULL END ) AS CAEM2,
       MAX (CASE WHEN D.CAPITOL IN (1091) AND D.RIND IN ('8')  THEN D.COL1 ELSE NULL END ) AS NR_TELEFOM,
       MAX (CASE WHEN D.CAPITOL IN (1091) AND D.RIND IN ('9')  THEN D.COL2 ELSE NULL END ) AS NR_TELEFOM_NR2,
       MAX (CASE WHEN D.CAPITOL IN (1091) AND D.RIND IN ('9')  THEN D.COL1 ELSE NULL END ) AS ADMIN_CONTABIL
       
            FROM CIS2.VW_DATA_ALL_FR D
                            INNER JOIN RENIM R ON R.CUIIO = D.CUIIO AND
                             
                                                  R.CUIIO_VERS = D.CUIIO_VERS
                                                  
                                                  INNER JOIN CIS2.VW_CL_CUATM   C ON C.CODUL = D.CUATM
                                                  INNER JOIN CIS2.MD_FORM F ON F.FORM = D.FORM AND F.FORM_VERS = D.FORM_VERS 
                                                  
                                                   
                
            WHERE 
            D.FORM IN (57)
            AND D.PERIOADA  IN (:pPERIOADA) AND 
            D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' 
            
            
           --
           -- AND D.CUIIO = 40029901
            
            GROUP BY 
       F.DEN_SHORT,
       D.CUIIO,
       R.IDNO,
       R.DENUMIRE,
       D.CUATM,
       C.DENUMIRE, 
       D.CAEM2
            
          
            
            
            UNION 
            
            SELECT 
       DISTINCT 
       F.DEN_SHORT,
       D.CUIIO,
       R.IDNO,
       R.DENUMIRE,
       D.CUATM,
       C.DENUMIRE DENUMIRE_CUATM,
      D.CAEM2 CAEM2_RENIM,
       MAX (CASE WHEN D.CAPITOL IN (1119) AND D.RIND IN ('CAEM')  THEN D.COL1 ELSE NULL END ) AS CAEM2,
       MAX (CASE WHEN D.CAPITOL IN (1119) AND D.RIND IN ('8')  THEN D.COL1 ELSE NULL END ) AS NR_TELEFOM,
       MAX (CASE WHEN D.CAPITOL IN (1119) AND D.RIND IN ('9')  THEN D.COL2 ELSE NULL END ) AS NR_TELEFOM_NR2,
       MAX (CASE WHEN D.CAPITOL IN (1119) AND D.RIND IN ('9')  THEN D.COL1 ELSE NULL END ) AS ADMIN_CONTABIL
       
            FROM CIS2.VW_DATA_ALL_FR D
                            INNER JOIN RENIM R ON R.CUIIO = D.CUIIO AND
                             
                                                  R.CUIIO_VERS = D.CUIIO_VERS
                                                  
                                                  INNER JOIN CIS2.VW_CL_CUATM   C ON C.CODUL = D.CUATM
                                                  INNER JOIN CIS2.MD_FORM F ON F.FORM = D.FORM AND F.FORM_VERS = D.FORM_VERS 
                                                  
                                                   
                
            WHERE 
            D.FORM IN (63)
            AND D.PERIOADA  IN (:pPERIOADA) AND 
            D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' 
            
            
           --
           -- AND D.CUIIO = 40029901
            
            GROUP BY 
       F.DEN_SHORT,
       D.CUIIO,
       R.IDNO,
       R.DENUMIRE,
       D.CUATM,
       C.DENUMIRE, 
       D.CAEM2
            
            ORDER BY 
            DEN_SHORT,
            CUATM