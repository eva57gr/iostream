SELECT  D.*
            FROM CIS2.MD_RIND D  INNER JOIN (
            SELECT 
  RIND,
  MAX(RIND_VERS) RIND_VERS
FROM CIS2.MD_RIND
WHERE 
capitol=1076 AND capitol_vers=2007
GROUP BY 
RIND
            )DD ON DD.RIND = D.RIND AND DD.RIND_VERS = D.RIND_VERS
            WHERE 
            D.capitol=1076 AND D.capitol_vers=2007
            AND D.STATUT = '1'
            AND D.RIND NOT IN ('-')
            ORDER BY 
            D.ORDINE