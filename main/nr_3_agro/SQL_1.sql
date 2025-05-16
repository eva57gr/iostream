                  SELECT D.ANUL,
                         D.CUIIO,
                         R.IDNO,
                         R.DENUMIRE,
                         R.CUATM,
                         R.CFP,
                         R.CFOJ,
                         D.PACHET,
                         MC.DEN_SHORT,
                         MR.RIND,
                         MR.DENUMIRE RIND_DEN,
                         TRIM(MAX(D.COL1))  AS COD_CUIIO,
                         TRIM(MAX(D.COL32)) AS DENUMIREA_AE,
                         TRIM(SUM(D.COL3)) AS COL1,
                         TRIM(SUM(D.COL4)) AS COL2,
                         TRIM(SUM(D.COL5)) AS COL3,
                         TRIM(SUM(D.COL6)) AS COL4,
                         TRIM(SUM(D.COL7)) AS COL5
                         
                         
                         
                
                
                           FROM CIS2.VW_DATA_ALL D 
                           
                                                    INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS    
                                                    INNER JOIN CIS2.MD_CAPITOL MC ON MC.CAPITOL = D.CAPITOL AND MC.CAPITOL_VERS = D.CAPITOL_VERS
                                                    INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD  
                           
                           WHERE 
                           
                           D.FORM IN (73)
                           AND D.ANUL IN (2025)
                           
                     --     AND D.CUIIO =  4499212
                           
                          GROUP BY 
                         D.ANUL,
                         D.CUIIO,
                         R.IDNO,
                         R.DENUMIRE,
                         R.CUATM,
                         D.PACHET,
                         R.CFP,
                         R.CFOJ,
                         MC.DEN_SHORT,
                         MR.RIND,
                         MR.DENUMIRE,
                         MR.ORDINE
                         
                         ORDER BY
                          D.ANUL,
                         D.CUIIO,
                         MC.DEN_SHORT,
                         MR.ORDINE
                         