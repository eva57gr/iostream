SELECT 
D.RIND ||
' Nu este  completata Col3. COLB = ' ||MAX( CASE WHEN D.CAPITOL IN (1127)  THEN D.COL31  ELSE NULL END) 
 
  AS REZULTAT
  
  FROM

 CIS2.VW_DATA_ALL D  
 
WHERE
  (D.PERIOADA=:PERIOADA          ) AND
  (D.CUIIO=:CUIIO                ) AND
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM = :FORM               ) AND
  (D.FORM_VERS=:FORM_VERS ) AND
  (D.CAPITOL=:CAPITOL           OR :CAPITOL = -1) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
  D.CAPITOL IN (1127) AND D.RIND NOT IN ('400')
  AND D.FORM = 64
GROUP BY 
D.COL31,
D.RIND
HAVING
CIS2.NVAL(SUM( CASE WHEN D.CAPITOL IN (1127)  THEN D.COL5  ELSE NULL END)) = 0

AND 
D.COL31  IN  (
       SELECT 

            SUBSTR(CODUL,2,4) AS COL3
                
                FROM  CIS2.VW_CL_CAEM2
                
                WHERE 
                PRIM IN ('1')
                
                AND 
                (
                SUBSTR(CODUL,2,2)  IN ('47','56')
                OR 
                SUBSTR(CODUL,2,3) IN ('451','453','454','462','463','464','465','466','467','468','469')
                 OR 
                SUBSTR(CODUL,2,4) IN ('3514','3523','3530')
                )
                
                

)


