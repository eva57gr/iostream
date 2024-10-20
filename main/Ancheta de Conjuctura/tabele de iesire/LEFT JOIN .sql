



SELECT 
L.CUIIO,
R.CUIIO
FROM USER_BANCU.DATA_ALL_RIND_10 L LEFT JOIN 
                            USER_BANCU.BS_RIND_10 R ON R.CUIIO = L.CUIIO
                            
                            WHERE
                            R.CUIIO IS NULL