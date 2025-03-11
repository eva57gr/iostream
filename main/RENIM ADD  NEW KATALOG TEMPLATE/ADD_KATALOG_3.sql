--This is SQL Oracle
--I need to find duplicates on this column L.CUIIO 
 SELECT 
 
        L.CUIIO,
        L.CUIIO_VERS,
        L.DENUMIRE,
        L.CUATM,
        L.CFP,
        L.CFOJ,
        L.CAEM2,
        L.IDNO
        FROM  USER_BANCU.AGRO_36 L
        
--        ORDER BY
--        L.CUIIO
--        
        
                     --  LEFT JOIN CIS.VW_CL_CUATM C ON C.CODUL =  L.CUATM
--                        
                        LEFT JOIN CIS2.VW_CL_CAEM2 C ON C.CODUL =  L.CAEM2
--                        
--                     --   LEFT JOIN CIS.VW_CL_CFP C ON C.CODUL =  L.CFP 
                        WHERE 
                        
                        C.CODUL IS    NULL 



                

;