SELECT D.CUIIO, 
    ROUND ((CIS2.NVAL(SUM(CASE WHEN D.FORM||'.'||D.CAPITOL||'.'||D.RIND IN ('7.40.160')  THEN D.COL1 ELSE 0 END)))/  
    CIS2.NOZERO( SUM(CASE WHEN D.FORM||'.'||D.CAPITOL||'.'||D.RIND IN ('7.40.10')  THEN D.COL1 ELSE 0 END)),3) AS COL1
  
 FROM
  CIS.VW_DATA_ALL D  
WHERE   
      (
      
      D.PERIOADA IN (
                    
                    SELECT
                      P.PERIOADA
                    FROM
                      CIS.VW_MD_PERIOADA P                     
                    WHERE
                      P.TRIMESTR + 4 IN (:PERIOADA) 
                      AND P.TIP_PERIOADA IN (4)
                      
                      
      )) AND                  
  (D.CUIIO=:CUIIO               OR :CUIIO = -1) AND  
   FORM IN (7) AND
   CAPITOL IN (40)
  
 GROUP BY D.CUIIO