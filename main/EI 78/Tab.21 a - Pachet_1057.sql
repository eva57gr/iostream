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
    DF.NR_ROW NR_ROW,
    DF.ORDINE,
    DF.DECIMAL_POS,
    DF.NUME_ROW,
    DF.COL1,
    DF.COL2,
    DF.COL3,
    DF.COL4
   
    
  

   
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
   A.CUATM||'~'||ROWNUM/0.123 AS NR_ROW,
   ROWNUM AS ORDINE,
  '0000' AS DECIMAL_POS,
   A.NUME_ROW,
   A.CUIIO AS COL1,
   A.PACHET AS COL2,
   COL1 AS COL3,
   COL2 AS COL4

 
FROM   
(
SELECT 
    A.CUATM,
    A.NUME_ROW,
    A.CUIIO,
    A.PACHET,
    A.COL1,
    B.COL1 AS COL2
    

FROM 

(
SELECT                                                                    

   R.CUATM, 
   R.DENUMIRE||' CAEM: '||R.CAEM2||')' AS NUME_ROW,
   R.CUIIO,
   D.PACHET,
   SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA)   THEN MR.RIND ELSE NULL END) AS COL1
     



  FROM
  CIS2.VW_DATA_ALL  D
  
             INNER JOIN CIS2.RENIM R ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS)
             INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD 

  WHERE      
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  (D.FORM=:pFORM) AND
  (D.FORM_VERS=:pFORM_VERS) AND
  (:pID_MDTABLE=:pID_MDTABLE) AND
  (D.PERIOADA IN (:pPERIOADA)) AND
   D.FORM IN (44) AND 
   D.CAPITOL IN (1,14) AND
   D.RIND NOT IN ('CM','CD','DIH') 
   
   
 GROUP BY
  R.DENUMIRE,
  R.CUIIO,
  D.PACHET,
  R.CUATM,
  R.CAEM2
  ) A LEFT JOIN (
  
  
  SELECT                                                                    

   R.CUATM NR_ROW, 
   R.DENUMIRE||' CAEM: '||R.CAEM2||')' AS NUME_ROW,
   R.CUIIO,
   SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA-1)   THEN MR.RIND ELSE NULL END) AS COL1
     



  FROM
  CIS2.VW_DATA_ALL  D
  
             INNER JOIN CIS2.RENIM R ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS)
             INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD 

  WHERE      
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  (D.FORM=:pFORM) AND
  (D.FORM_VERS=:pFORM_VERS) AND
  (:pID_MDTABLE=:pID_MDTABLE) AND
  (D.PERIOADA IN (:pPERIOADA-1)) AND
   D.FORM IN (44) AND 
   D.CAPITOL IN (1) AND
   D.RIND NOT IN ('CM','CD','DIH') 
   
   
 GROUP BY
  R.DENUMIRE,
  R.CUIIO,
  R.CUATM,
  R.CAEM2
  
  )  B ON (B.CUIIO = A.CUIIO)
 
 
 
 ORDER BY 
 A.CUIIO
 
 ) A
  
  
   
   ) DF

;
   
    BEGIN

  FOR CR IN C
  
  LOOP
    INSERT INTO  -- USER_BANCU.TABLE_OUT_TEST 
    
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
       
      COL1, COL2, COL3, COL4
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
       
      CR.COL1, CR.COL2, CR.COL3, CR.COL4
    );
  END LOOP;
END;
  
  
   
   
  