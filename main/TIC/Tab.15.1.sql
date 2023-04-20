--INSERT INTO CIS2.TABLE_OUT 
--(
--  PERIOADA,
--  FORM,
--  FORM_VERS,
--  ID_MDTABLE,
--  COD_CUATM,
--  NR_SECTIE,
--  NUME_SECTIE,
--  NR_SECTIE1,
--  NUME_SECTIE1,
--  NR_SECTIE2,
--  NUME_SECTIE2,
--  NR_ROW,
--  ORDINE,
--  DECIMAL_POS,
--  NUME_ROW,   
--  COL1, COL2
--)

  SELECT 
  :pPERIOADA AS PERIOADA,
  :pFORM AS FORM,
  :pFORM_VERS AS FORM_VERS,
  :pID_MDTABLE AS ID_MDTABLE,
  :pCOD_CUATM AS COD_CUATM,        

 
   R.CUIIO AS NR_SECTIE,
   R.CUIIO||' - '||R.DENUMIRE AS NUME_SECTIE,
  '0' AS NR_SECTIE1,
  '0' AS NUME_SECTIE1,
  '0' AS NR_SECTIE2,
  '0' AS NUME_SECTIE2,
   CD.NR_ROW AS NR_ROW,  
   CD.ORDINE AS ORDINE,
  '00' AS DECIMAL_POS,
   CD.NUME_ROW AS NUME_ROW,
   SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA)    AND CD.NR_ROW LIKE '%'||D.RIND||'%'  THEN D.COL1  ELSE NULL  END) AS COL1,
   NULL   AS COL2 

 FROM
      CIS2.VW_DATA_ALL D  
      INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
      
       CROSS JOIN 

(   SELECT 'Servere' AS NUME_ROW,                                                                           '110'  AS NR_ROW, '1' AS ORDINE FROM DUAL UNION
    SELECT 'Calculatoare personale (desktop, nettop)'                                          AS NUME_ROW, '111'  AS NR_ROW, '2' AS ORDINE FROM DUAL UNION
    SELECT 'Calculatoare portabile (laptop, notebook)'                                         AS NUME_ROW, '112'  AS NR_ROW, '3' AS ORDINE FROM DUAL UNION 
    SELECT 'Alte tipuri de echipamente (smartphone, tableta)'                                  AS NUME_ROW, '113'  AS NR_ROW, '4' AS ORDINE FROM DUAL UNION 
    SELECT 'Numarul de persoane ocupate care utilizeaza produse TIC în scop profesional'       AS NUME_ROW, '120'  AS NR_ROW, '5' AS ORDINE FROM DUAL 
 ) 
     CD


WHERE  D.PERIOADA IN (:pPERIOADA) AND
       D.FORM = :pFORM AND
       D.FORM_VERS IN (:pFORM_VERS )  AND  

       D.CAPITOL IN (1181) AND
       D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' 
      
     --  AND D.CUIIO=2245786
     
  

GROUP BY  CD.NR_ROW , CD.NUME_ROW, CD.ORDINE, R.CUIIO,R.DENUMIRE



ORDER BY
CD.ORDINE
