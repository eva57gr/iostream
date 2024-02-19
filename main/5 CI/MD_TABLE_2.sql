SELECT 
               CM.CODUL,
               M.RIND AS NR_ROW,
               MAX(M.ORDINE) AS ORDINE

        FROM CIS.CL_CAEM2 CM  
               -- CROSS JOIN CIS.CL_CFP CP
                CROSS JOIN (
                
                ----------------------------------------------------------------------
                
                SELECT
                D.RIND,
                D.ORDINE

                FROM CIS.MD_RIND  D
                
                        inner JOIN (

        


                SELECT
                CAPITOL,
                MAX(CAPITOL_VERS) AS CAPITOL_VERS,
                RIND,
                
                MAX(RIND_VERS)  RIND_VERS
                    
                    FROM CIS.MD_RIND
                    
                    WHERE
                    
                    FORM = 1
                    AND CAPITOL IN (1,2)
        
                    AND CAPITOL_VERS <= :pPERIOADA
                    AND RIND_VERS <= :pPERIOADA          

                    GROUP BY
                    RIND,
                    CAPITOL
                    
                    
                    
                    
                    ) dd on D.capitol = DD.capitol AND D.capitol_VERS  = DD.capitol_VERS 
                           and D.RIND = DD.RIND AND D.RIND_VERS  = DD.RIND_VERS
                    
                    
                    where
                    
                    D.FORM IN (1) 
                    AND d.STATUT <> '3'
                    AND D.capitol in (1,2)
            
                ----------------------------------------------------------------------
                ) M
                 
        WHERE 
--                M.FORM IN (1) AND
--                M.CAPITOL IN (1,2) AND 
--              --  CP.CODUL IN ('00') AND
--                M.RIND NOT IN ('-','--','0111','1060','1061','1062','1063','1500','1510','1520','1530','2100','2200','2600') AND
--             --   M.RIND_VERS <=:pPERIOADA AND
--                M.CAPITOL_VERS = 1052 AND
--              
                CM.CODUL IN
(
              '00000','A0000','A0100','A0160','A0200','A0300','B0000','C0000','C1000','C1100','C1200','C1300',
              'C1400','C1500','C1600','C1700','C1800','C1900','C2000','C2100','C2200','C2300','C2400','C2500',
              'C2600','C2700','C2800','C2900','C3000','C3100','C3200','C3300','D0000','D3510','D3511','D3512',
              'D3513','D3514','D3520','D3521','D3522','D3523','D3530','E0000','E3600','E3700','E3810','E3820',
              'E3830','E3900','F0000','F4100','F4200','F4300','G0000','G4500','G4600','G4700','G4790','H0000',
              'H4900','H4950','H5000','H5100','H5200','H5300','I0000','I5500','I5600','J0000','J5800','J5900',
              'J6000','J6100','J6200','J6300','K0000','K6400','K6500','K6600','L0000','M0000','M6900','M7000',
              'M7100','M7120','M7200','M7300','M7400','M7490','M7500','N0000','N7700','N7800','N7900','N8000',
              'N8100','N8200','O0000','P0000','Q0000','Q8600','Q8700','Q8800','R0000','R9000','R9100','R9200',
              'R9300','S0000','S9400','S9510','S9520','S9600','B0800',

              'B0900','H4910','H4920','H4930','H4940','H5010','H5020','H5030','H5040','H5110','H5120','I5510',
              'I5520','I5530','I5590','I5610','I5620','I5630','M7112','R9320'
)
                            
        GROUP BY M.RIND, CM.CODUL
        
        
        