      SELECT


     TTT.SHOW_ORDER  AS ORDINE,  
     '1111' AS DECIMAL_POS,
     TTT.NAME NUME_ROW, 
     COUNT (DISTINCT CASE WHEN  MC.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','-')  AND CIS2.NVAL(D.COL4) > 0  THEN D.CUIIO  END)   AS COL1 
     
     

     
     
     
     
     
     FROM DATA_ALL D
          INNER JOIN RENIM RN ON D.CUIIO = RN.CUIIO AND D.CUIIO_VERS = RN.CUIIO_VERS
          INNER  JOIN VW_CL_CUATM CT ON RN.CUATM = CT.CODUL
          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
          INNER  JOIN MD_CAPITOL MC ON MR.CAPITOL = MC.CAPITOL AND MR.CAPITOL_VERS = MC.CAPITOL_VERS
          
  

         
       INNER JOIN VW_CLS_CLASS_ITEM TT ON (TT.CLASS_CODE IN ('TARI_ISO')   AND   (TT.ITEM_CODE=D.COL33))
          
          
        INNER JOIN VW_CLS_CLASS_ITEM TTT ON (TTT.CLASS_CODE IN ('TARI_ISO') AND TT.ITEM_PATH LIKE '%'||TTT.ITEM_CODE||';%')
        -------------------------------------------------------------------------------

        ------------------------------------------------------------------------------   
WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
 -- (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)  AND
  MC.CAPITOL IN (405)  
  
 -- AND D.CUIIO = 15787827
  GROUP BY
  TTT.ITEM_CODE,
  TTT.SHOW_ORDER,
  TTT.NAME
  
  
  ORDER BY
TTT.SHOW_ORDER

  
  