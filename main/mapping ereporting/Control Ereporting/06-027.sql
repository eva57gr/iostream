SELECT DISTINCT   
                DECODE(CC.NR_COLUMN, '1', 'COL.1', '2', 'COL.2') ||', Rind.'|| D.RIND||': '||
                
                NVAL(SUM(CASE WHEN DD.PERIOADA= :PERIOADA   AND DD.NUM IN (2,3,4) THEN  DECODE(CC.NR_COLUMN, '1', NVAL(DD.COL1), '2', NVAL(DD.COL2)) ELSE 0 END))
                
                ||' < '||
                
               NVAL(SUM(CASE WHEN D.PERIOADA= :PERIOADA-1   AND D.NUM IN (1,2,3) THEN  DECODE(CC.NR_COLUMN, '1', NVAL(D.COL1), '2', NVAL(D.COL2)) ELSE 0 END))
                 
                
                
                 AS  REZULTAT
                
                FROM 
                
                  CIS2.VW_DATA_ALL D
                     INNER JOIN USER_EREPORTING.VW_DATA_ALL_FOR_VALIDATE DD ON (D.CUIIO=DD.CUIIO AND DD.ID_SCHEMA IN (2) AND D.FORM=DD.FORM 
                     AND D.RIND=DD.RIND AND D.RIND_VERS = DD.RIND_VERS
                     
 AND D.CAPITOL=DD.CAPITOL),
                
                                   (                                                                        
       SELECT '1' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '2' AS NR_COLUMN FROM DUAL  
                            
       ) CC                                      

                
                WHERE
            
               (D.PERIOADA IN(:PERIOADA-1) AND
                DD.PERIOADA IN (:PERIOADA))AND 
               (D.CUIIO           = :CUIIO          OR :CUIIO= -1)        AND 
               (:CUIIO_VERS      = :CUIIO_VERS     OR :CUIIO_VERS = -1)  AND 
               (D.FORM            = :FORM           OR :FORM = -1)        AND 
               (:FORM_VERS       = :FORM_VERS      OR :FORM_VERS = -1)   AND 
               (D.CAPITOL         = :CAPITOL        OR :CAPITOL = -1  )   AND 
               (:CAPITOL_VERS    = :CAPITOL_VERS   OR :CAPITOL_VERS = -1) 
               
               AND D.FORM = 6 
               AND D.CAPITOL = 316 AND 
               D.RIND NOT IN ('001','999')
               AND  DD.ID_SCHEMA IN (2)
                
               GROUP BY
               CC.NR_COLUMN, 
               D.CUIIO,
               D.RIND
               


--               HAVING 
--               
--               NVAL(SUM(CASE WHEN DD.PERIOADA= :PERIOADA   AND DD.NUM IN (2,3,4) THEN  DECODE(CC.NR_COLUMN, '1', NVAL(DD.COL1), '2', NVAL(DD.COL2)) ELSE 0 END))  
--               <
--               NVAL(SUM(CASE WHEN D.PERIOADA= :PERIOADA-1   AND D.NUM IN (1,2,3) THEN  DECODE(CC.NR_COLUMN, '1', NVAL(D.COL1), '2', NVAL(D.COL2)) ELSE 0 END))
--               
               
               
               