CREATE OR REPLACE FORCE VIEW USER_BANCU.CIS_CIS2_BNS
(

        ID_SCHEMA,
        PERIOADA,
        FORM,
        FORM_VERS,
        DENUMIRE,
        CNT
 )
AS 

   SELECT
       '2' ID_SCHEMA,
        PERIOADA,
        FORM,
        FORM_VERS,
        DEN_SHORT DENUMIRE,
        COUNT (DISTINCT CUIIO) AS CNT
            
         
        FROM 

        (
                SELECT 
                DISTINCT D.CUIIO,
              --  D.ID_SCHEMA,
                D.PERIOADA,
                D.FORM,
                D.FORM_VERS,
                M.DENUMIRE,
                M.DEN_SHORT
                
                
                        FROM CIS2.VW_DATA_ALL D
                                            INNER JOIN CIS2.MD_FORM M ON M.FORM = D.FORM AND M.FORM_VERS = D.FORM_VERS 
                        
                      
                        
                        
                        
                        WHERE 
--                        D.ID_SCHEMA = 2
--                        AND 
                        
                        D.PERIOADA  IN  (1060,2012)
                        
                       
                      
                        )
                        
                        
                        GROUP BY
--                            ID_SCHEMA, 
                            PERIOADA,
                            FORM,
                            FORM_VERS,
                            DENUMIRE,
                            DEN_SHORT   
                            
                            
                            UNION 
                            
                               SELECT
        '1' ID_SCHEMA,
        PERIOADA,
        FORM,
        FORM_VERS,
        DEN_SHORT DENUMIRE,
        COUNT (DISTINCT CUIIO) AS CNT
            
         
        FROM 

        (
                SELECT 
                DISTINCT D.CUIIO,
               -- D.ID_SCHEMA,
                D.PERIOADA,
                D.FORM,
                D.FORM_VERS,
                M.DENUMIRE,
                M.DEN_SHORT
                
                
                        FROM CIS.VW_DATA_ALL D
                                            INNER JOIN CIS.MD_FORM M ON M.FORM = D.FORM AND M.FORM_VERS = D.FORM_VERS 
                        
                      
                        
                        
                        
                        WHERE 
--                        D.ID_SCHEMA = 1
--                        AND 
                        
                        D.PERIOADA  IN  (1060,2012,468,469,470)
                        
                       
                      
                        )
                        
                        
                        GROUP BY
                         --   ID_SCHEMA, 
                            PERIOADA,
                            FORM,
                            FORM_VERS,
                            DENUMIRE,
                            DEN_SHORT   
                            
                            
                            ORDER BY
                             ID_SCHEMA,
                            FORM,
                            FORM_VERS,
                            DENUMIRE            
                         
                        
                            
                         
                        