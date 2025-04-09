
DECLARE

  CURSOR C IS

SELECT 
    DF.PERIOADA,
    DF.FORM,
    DF.FORM_VERS,
    DF.ID_MDTABLE,
    DF.COD_CUATM,
    DF.NR_SECTIE,
    DF.NUME_SECTIE,
    DF.NR_SECTIE1,
    DF.NUME_SECTIE1,
    DF.NR_SECTIE2,
    DF.NUME_SECTIE2,
    DF.NR_ROW,
    DF.ORDINE,
    DF.DECIMAL_POS,
    DF.NUME_ROW,
    DF.COL1,
    DF.COL2,
    DF.COL3,
    DF.COL4,
    DF.COL5,
    DF.COL6,
    DF.COL7,
    DF.COL8,
    DF.COL9  
 
    
  

   
FROM 
(



SELECT 
  :pPERIOADA AS PERIOADA,
  :pFORM AS FORM,
  :pFORM_VERS AS FORM_VERS,
  :pID_MDTABLE AS ID_MDTABLE,
  :pCOD_CUATM AS COD_CUATM,
  
  '0' AS NR_SECTIE,
  '0' AS NUME_SECTIE,
  '0' AS NR_SECTIE1,
  '0' AS NUME_SECTIE1,
  '0' AS NR_SECTIE2,
  '0' AS NUME_SECTIE2,
  
 
                MR.RIND AS NR_ROW,
                MR.ORDINE AS ORDINE,
                '00000000000' AS DECIMAL_POS, 
                REPLACE(REPLACE(REPLACE(MR.DENUMIRE,'<br>'),'nbsp'),'&;') AS NUME_ROW,
                SUM(D.COL1)  AS COL1,
                SUM(D.COL2)  AS COL2,
                SUM(CIS2.NVAL(D.COL4)+ CIS2.NVAL(D.COL5) + CIS2.NVAL(D.COL6) )  AS COL3, 
                SUM(D.COL4)  AS COL4,
                SUM(D.COL5)  AS COL5,
                SUM(D.COL6)  AS COL6,
                SUM(D.COL7)  AS COL7,
                SUM(D.COL8)  AS COL8,
                SUM(D.COL9)  AS COL9
                
                      
                
               
                
               FROM CIS2.DATA_ALL D
                      
                       INNER JOIN CIS2.RENIM RR ON (RR.CUIIO = D.CUIIO AND RR.CUIIO_VERS = D.CUIIO_VERS)
                       INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = RR.CUATM
                       RIGHT JOIN (  
                       
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
         
                       ) MR ON (MR.ID_MD=D.ID_MD 
                       -----------------------------------------------------------
                       AND  (D.FORM=:pFORM) AND
                       (D.FORM_VERS=:pFORM_VERS) AND
                       (:pID_MDTABLE=:pID_MDTABLE) AND
                       (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND   
                       D.PERIOADA IN :pPERIOADA AND
                       D.FORM = 54 
                       
                        
                     )
                       -----------------------------------------------------------
                                            
                   WHERE 
                    1=1
                    AND MR.CAPITOL = 1076
                    AND MR.CAPITOL_VERS =  2007
                         
           
           
         GROUP BY
          MR.DENUMIRE,
          MR.RIND,
          MR.ORDINE
          
          ORDER BY 
          MR.ORDINE
          
          )  DF
  
  ;
  
  
  BEGIN

  FOR CR IN C
  
  LOOP
    INSERT INTO --  USER_BANCU.TABLE_OUT_TEST 
    
     CIS2.TABLE_OUT
    (
      PERIOADA,
      FORM,
      FORM_VERS,
      ID_MDTABLE,
      COD_CUATM,
      NR_SECTIE,
      NUME_SECTIE,
      NR_SECTIE1,
      NUME_SECTIE1,
      NR_SECTIE2,
      NUME_SECTIE2,
      NR_ROW,
      ORDINE,
      DECIMAL_POS,
      NUME_ROW,
       
      COL1, COL2, COL3,COL4,COL5,COL6,COL7,COL8,COL9
    )
    VALUES
    (
      CR.PERIOADA,
      CR.FORM,
      CR.FORM_VERS,
      CR.ID_MDTABLE,
      CR.COD_CUATM,
      CR.NR_SECTIE,
      CR.NUME_SECTIE,
      CR.NR_SECTIE1,
      CR.NUME_SECTIE1,
      CR.NR_SECTIE2,
      CR.NUME_SECTIE2,
      CR.NR_ROW,
      CR.ORDINE,
      CR.DECIMAL_POS,
      CR.NUME_ROW,
       
      CR.COL1, CR.COL2, CR.COL3,CR.COL4,CR.COL5,CR.COL6,CR.COL7,CR.COL8,
      CR.COL9
    );
  END LOOP;
END;