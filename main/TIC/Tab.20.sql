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
   NR_ROW||'~'||ROWNUM NR_ROW,  
   ROWNUM AS ORDINE,
  '000' AS DECIMAL_POS,
   NUME_ROW,
   CUIIO AS COL1,
   COL1 AS COL2,
   COL2 AS COL3
   
   FROM


(

SELECT
   R.CUIIO,
   MAX(R.DENUMIRE) DENUMIRE,
   CD.NR_ROW,  
   TO_NUMBER(CD.ORDINE) ORDINE,
   CD.NUME_ROW,
   CIS2.NVAL(SUM (CASE WHEN CD.NR_ROW LIKE '%'|| D.RIND||'%' AND D.CAPITOL IN (1186) AND D.PERIOADA IN (:pPERIOADA) AND D.FORM_VERS IN (:pFORM_VERS) THEN D.COL1 ELSE 0 END)) AS COL1,
   CIS2.NVAL(SUM (CASE WHEN CD.NR_ROW LIKE '%'|| D.RIND||'%' AND D.CAPITOL IN (1186) AND D.PERIOADA IN (:pPERIOADA-1) AND D.FORM_VERS IN (2000)  THEN D.COL1 ELSE 0 END)) AS COL2 
  

 FROM
      CIS2.VW_DATA_ALL D  
      INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
               
         CROSS JOIN 

(   SELECT 'site-urile web sau aplica?iile entita?ii (inclusiv extranet)' AS NUME_ROW, '611'      AS NR_ROW, '1' AS ORDINE FROM DUAL UNION
    SELECT 'site-urile web sau aplica?iile de pe pia?a comer?ului electronic ' AS NUME_ROW, '612' AS NR_ROW, '2' AS ORDINE FROM DUAL UNION
    SELECT 'Cifra de afaceri total, lei' AS NUME_ROW, '620' AS NR_ROW, '3' AS ORDINE FROM DUAL UNION 
    
    SELECT 'site-urile web sau aplica?iile entita?ii dvs (inclusiv extranet), lei'             AS NUME_ROW, '631' AS NR_ROW, '4' AS ORDINE FROM DUAL UNION 
    SELECT 'site-urile web sau aplica?iile de pe pia?a comer?ului electronic folosite, lei'    AS NUME_ROW, '632' AS NR_ROW, '5' AS ORDINE FROM DUAL UNION 
        
    SELECT 'total(=631+632)'             AS NUME_ROW, '633' AS NR_ROW, '6' AS ORDINE FROM DUAL UNION  
    
    SELECT 'vânzari catre consumatori finali, lei'             AS NUME_ROW, '641' AS NR_ROW, '7' AS ORDINE FROM DUAL UNION 
    SELECT 'vânzari catre entita?i (întreprinderi, autoritatile publice etc.), lei'    AS NUME_ROW, '642' AS NR_ROW, '8' AS ORDINE FROM DUAL UNION 
     
    SELECT 'total(=641+642)'             AS NUME_ROW, '643' AS NR_ROW, '9' AS ORDINE FROM DUAL UNION
    SELECT 'Vânzari web catre clien?ii situa?i în urmatoarele zone geografice: '    AS NUME_ROW, '650' AS NR_ROW, '10' AS ORDINE FROM DUAL UNION--FICTIV
    SELECT 'Republica Moldova'       AS NUME_ROW, '651' AS NR_ROW, '11' AS ORDINE FROM DUAL UNION
    SELECT '?ari ale U.E.(UE-27)** '  AS NUME_ROW, '652' AS NR_ROW, '12' AS ORDINE FROM DUAL UNION
    SELECT '?arile CSI '              AS NUME_ROW, '653' AS NR_ROW, '13' AS ORDINE FROM DUAL UNION
    SELECT 'restul lumii '           AS NUME_ROW, '654' AS NR_ROW, '14' AS ORDINE FROM DUAL UNION
    SELECT 'Vânzari de tip EDI '     AS NUME_ROW, '660' AS NR_ROW, '11' AS ORDINE FROM DUAL UNION
    SELECT 'Cifra de afaceri realizata din vânzarile de tip EDI de bunuri ?i servicii, lei'   AS NUME_ROW, '670' AS NR_ROW, '12' AS ORDINE FROM DUAL UNION
    SELECT 'Republica Moldova '     AS NUME_ROW, '681' AS NR_ROW, '13' AS ORDINE FROM DUAL UNION
    SELECT '?ari ale U.E.(UE-27)** ' AS NUME_ROW, '682' AS NR_ROW, '14' AS ORDINE FROM DUAL UNION
    SELECT '?arile CSI'              AS NUME_ROW, '683' AS NR_ROW, '15' AS ORDINE FROM DUAL UNION
    SELECT 'restul lumii'           AS NUME_ROW, '684' AS NR_ROW, '16' AS ORDINE FROM DUAL 
 ) 
     CD


WHERE  D.PERIOADA IN (:pPERIOADA, :pPERIOADA-1) AND
       D.FORM = :pFORM AND
       D.FORM_VERS IN (:pFORM_VERS,2000) AND 
       
      D.CAPITOL IN (1186) AND
      D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%'
       
     -- AND D.CUIIO = 15789743 
  
GROUP BY  CD.NR_ROW , CD.NUME_ROW, CD.ORDINE, R.CUIIO
--,R.DENUMIRE

ORDER BY 
R.CUIIO,
ORDINE

)


WHERE 
COL2 + COL1 > 0


   