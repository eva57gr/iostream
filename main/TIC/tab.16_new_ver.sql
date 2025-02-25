SELECT 
L.CUIIO,
L.DENUMIRE,
L.CUATM,
L.NR_ROW,
L.ORDINE,
L.NUME_ROW,
L.PACHET,
SUM(L.COL1) AS COL1

FROM 


(
SELECT 
   R.CUIIO,
   MAX(R.DENUMIRE) DENUMIRE,
   R.CUATM,
   CD.NR_ROW AS NR_ROW,  
   CD.ORDINE AS ORDINE,
   CD.NUME_ROW AS NUME_ROW,
   D.PACHET,
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
      
 -- AND D.CUIIO = 41157664
     
 GROUP BY  CD.NR_ROW , D.PACHET,CD.NUME_ROW, CD.ORDINE, R.CUATM,R.CUIIO )L 
 
 
 
 GROUP BY
 L.CUIIO,
L.DENUMIRE,
L.CUATM,
L.NR_ROW,
L.ORDINE,
L.NUME_ROW,
L.PACHET


ORDER BY 
L.CUIIO,
L.NR_ROW