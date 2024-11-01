
--INSERT INTO CIS2.MD_RIND_OUT (
--
--        ID_MDTABLE,
--        RINDOUT_VERS,
--        RINDOUT,
--        DENUMIRE,
--        STATUT,
--        ORDINE,
--        DATA_REG,
--        RIND
--        
--)


        SELECT 
        13915 ID_MDTABLE,
        2013  RINDOUT_VERS,
        TRIM(CODUL) RINDOUT,
        DENUMIRE DENUMIRE,
        '1'    STATUT,
        ORDINE,
        SYSDATE DATA_REG,
        FULL_CODE RIND
        
         
        FROM USER_BANCU.VW_CL_SPEC_2EDU_24
        
        
--        WHERE
--        CODUL IN (000000000732110)
        
    --    ORDINE IN (192,193)
        ORDER BY 
        ORDINE