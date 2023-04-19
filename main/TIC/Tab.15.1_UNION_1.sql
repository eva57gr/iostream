SELECT 
   R.CUIIO,
   R.DENUMIRE,
   CD.NR_ROW AS NR_ROW,  
   CD.ORDINE AS ORDINE,
   CD.NUME_ROW AS NUME_ROW,
   NULL   AS COL1, 
   SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA-1)    AND CD.NR_ROW LIKE '%'||D.RIND||'%'  THEN D.COL1  ELSE NULL  END) AS COL2
  

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


WHERE  D.PERIOADA IN (:pPERIOADA-1) AND
       D.FORM = :pFORM AND
       D.FORM_VERS IN (2000 )  AND  

       D.CAPITOL IN (1181) AND
       D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' 
      
       AND D.CUIIO=2245786
     
 GROUP BY  CD.NR_ROW , CD.NUME_ROW, CD.ORDINE, R.CUIIO,R.DENUMIRE



ORDER BY
CD.ORDINE
