



            SELECT 
                  D.ANUL, 
                  D.CUIIO,
                  R.DENUMIRE,
                  D.CAEM2,
                  D.CAEM,
                  D.CAPITOL_DEN,
                  D.RIND,
                  D.CUATM, 
                  C.DENUMIRE,
                  SUM(D.COL1) AS COL1,
                  SUM(D.COL2) AS COL2,
                  SUM(D.COL3) AS COL3,
                  SUM(D.COL4) AS COL4,
                  SUM(D.COL5) AS COL5,
                  SUM(D.COL6) AS COL6,
                  SUM(D.COL7) AS COL7,
                  SUM(D.COL8) AS COL8,
                  SUM(D.COL9) AS COL9,
                  SUM(D.COL10) AS COL10
            
                FROM CIS.VW_DATA_ALL D  
                        INNER JOIN CIS.VW_CL_CUATM C ON C.CODUL = D.CUATM 
                        INNER JOIN RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS  = D.CUIIO_VERS  
                
                WHERE 
                
                D.FORM = 10
                AND D.PERIOADA = 2010  
                
                  GROUP BY
                  D.ANUL, 
                  D.CUIIO,
                  R.DENUMIRE,
                  D.CAEM2,
                  D.CAEM,
                  D.CAPITOL_DEN,
                  D.RIND,
                  D.CUATM, 
                  C.DENUMIRE

ORDER BY 
CUIIO,
RIND