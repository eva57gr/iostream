SELECT 
                 ID_MDTABLE,
                 RINDOUT_VERS ITEM_CODE_VERS,
                 RINDOUT ITEM_CODE,
                 DENUMIRE ITEM_PATH,
                 STATUT,
                 ORDINE,
                 DATA_REG,
                 RIND NAME
            FROM CIS2.MD_RIND_OUT 
            
            WHERE
            ID_MDTABLE = 13039