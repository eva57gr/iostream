  SELECT 
         D.ANUL,
         D.CUIIO,
         R.DENUMIRE,
         D.CUATM,
         D.CAEM2,
         D.FORM,
         D.CAPITOL_DEN,
         D.RIND,
         REPLACE(REPLACE(MR.DENUMIRE,'<b>',''),'</b>','') RIND_DEN,
         ROUND(SUM(D.COL1),1) AS COL1,
         ROUND(SUM(D.COL2),1) AS COL2,
         ROUND(SUM(D.COL3),1) AS COL3,
         ROUND(SUM(D.COL4),1) AS COL4,
         ROUND(SUM(D.COL5),1) AS COL5,
         ROUND(SUM(D.COL6),1) AS COL6,
         ROUND(SUM(D.COL7),1) AS COL7,
         ROUND(SUM(D.COL8),1) AS COL8,
         ROUND(SUM(D.COL9),1) AS COL9,
         ROUND(SUM(D.COL10),1) AS COL10
            
            
            FROM CIS.VW_DATA_ALL D
            
            
                            INNER JOIN CIS.RENIM R ON 
                            R.CUIIO = D.CUIIO AND 
                            R.CUIIO_VERS = D.CUIIO_VERS  
                            INNER JOIN CIS.MD_RIND MR ON MR.ID_MD = D.ID_MD
            
            WHERE 
            D.PERIOADA IN (:pPERIOADA)
            AND D.FORM IN (:pFORM)
            
            
            
            GROUP BY 
         D.ANUL,
         D.CUIIO,
         R.DENUMIRE,
         D.CUATM,
         D.CAEM2,
         D.FORM,
         D.CAPITOL_DEN,
         D.RIND,
         MR.DENUMIRE
         
         
         ORDER BY 
         D.CUIIO,
         D.RIND