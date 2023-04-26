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
  NR_ROW||'~'||ROWNUM AS NR_ROW,
  ROWNUM AS ORDINE,
  '000' AS DECIMAL_POS,
   DENUMIRE||'-'||NUME_ROW AS NUME_ROW,
   CUIIO AS COL1, 
   COL1 AS COL2,
   COL2 AS COL3

   FROM
(
SELECT 
CUIIO,
MAX(DENUMIRE) DENUMIRE,
NR_ROW,  
ORDINE,
NUME_ROW,
SUM(COL1) AS COL1,
SUM(COL2) AS COL2

FROM
(
SELECT 
   R.CUIIO,
   R.DENUMIRE,
   CD.NR_ROW AS NR_ROW,  
   CD.ORDINE AS ORDINE,
   CD.NUME_ROW AS NUME_ROW,
   SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA)    AND CD.NR_ROW LIKE '%'||D.RIND||'%'  THEN D.COL1  ELSE NULL  END) AS COL1,
   NULL   AS COL2 

 FROM
      CIS2.VW_DATA_ALL D  
      INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
      
       CROSS JOIN 

(   

    SELECT 'Nr.entitai cu Acces la Internet (Numarul de calculatoare cu acces la Internet)'    AS NUME_ROW, '130'  AS NR_ROW, '6' AS ORDINE FROM DUAL UNION
    SELECT 'Nr.entitai cu Acces la Internet în scop profesional'                               AS NUME_ROW, '140'  AS NR_ROW, '7' AS ORDINE FROM DUAL UNION
    SELECT 'Numarul de persoane ocupate care au acces la Internet în scop profesional 
            (Numarul de angajati care utilizeaza, cu regularitate, Internetul în activitatea de serviciu) '         AS NUME_ROW, '141'  AS NR_ROW, '8' AS ORDINE FROM DUAL UNION 
    SELECT 'Nr.entitai cu Conexiune fixa la Internet: (Nr.compiutere conectate in Banda larga conexiune fixa)'      AS NUME_ROW, '150'  AS NR_ROW, '9' AS ORDINE FROM DUAL UNION 
    SELECT 'Mai mica de 30 Mbit/s'       AS NUME_ROW, '161'  AS NR_ROW, '10' AS ORDINE FROM DUAL  UNION
    
    SELECT ' Mai mare sau egala cu 30Mbit/s si mai mica de 100 Mbit/s '              AS NUME_ROW, '162' AS NR_ROW, '11' AS ORDINE FROM DUAL UNION
    SELECT ' Mai mare sau egala cu 100 Mbit/s si mai mica de 500 Mbit/s'             AS NUME_ROW, '163' AS NR_ROW, '12' AS ORDINE FROM DUAL UNION
    SELECT ' Mai mare sau egala cu 500 Mbit/s si mai mica de 1 Gbit/s '              AS NUME_ROW, '164' AS NR_ROW, '13' AS ORDINE FROM DUAL UNION
    SELECT ' Mai mare sau egala cu 1 Gbit/s '                                       AS NUME_ROW, '165' AS NR_ROW, '14' AS ORDINE FROM DUAL UNION
    SELECT 'Nr.entitai care utilizeaza de dispozitive portabile cu o conexiune mobila la Internet 
           (Nr.compiutere conectate in Banda larga conexiune mobila) '        AS NUME_ROW, '170' AS NR_ROW, '15' AS ORDINE FROM DUAL UNION
    SELECT ' Nr.entitai care au pus  la dispozitie a dispozitive portabile cu conectare la telefonie mobila în scopuri profesionale'            
                                                 AS NUME_ROW, '180' AS NR_ROW, '16' AS ORDINE FROM DUAL UNION
    SELECT ' Numarul persoanelor ocupate care utilizeaza dispozitive portabile cu conectarea la internet prin intermediul retelelor de telefonie mobila '           
                                                AS NUME_ROW, '181' AS NR_ROW, '17' AS ORDINE FROM DUAL UNION
    SELECT ' Website propriu (Existenta paginii web oficiale ) '           
                                               AS NUME_ROW, '210' AS NR_ROW, '18' AS ORDINE FROM DUAL 
    
 ) 
     CD


WHERE  D.PERIOADA IN (:pPERIOADA) AND
       D.FORM = :pFORM AND
       D.FORM_VERS IN (:pFORM_VERS )  AND  

       D.CAPITOL IN (1181,1182) AND
       D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' 
      
     --   AND D.CUIIO = 1000545
     
 GROUP BY  CD.NR_ROW , CD.NUME_ROW, CD.ORDINE, R.CUIIO,R.DENUMIRE



UNION 

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

(   
    SELECT 'Nr.entitai cu Acces la Internet (Numarul de calculatoare cu acces la Internet)'    AS NUME_ROW, '130'  AS NR_ROW, '6' AS ORDINE FROM DUAL UNION
    SELECT 'Nr.entitai cu Acces la Internet în scop profesional'                               AS NUME_ROW, '140'  AS NR_ROW, '7' AS ORDINE FROM DUAL UNION
    SELECT 'Numarul de persoane ocupate care au acces la Internet în scop profesional 
            (Numarul de angajati care utilizeaza, cu regularitate, Internetul în activitatea de serviciu) '         AS NUME_ROW, '141'  AS NR_ROW, '8' AS ORDINE FROM DUAL UNION 
    SELECT 'Nr.entitai cu Conexiune fixa la Internet: (Nr.compiutere conectate in Banda larga conexiune fixa)'      AS NUME_ROW, '150'  AS NR_ROW, '9' AS ORDINE FROM DUAL UNION 
    SELECT 'Mai mica de 30 Mbit/s'       AS NUME_ROW, '161'  AS NR_ROW, '10' AS ORDINE FROM DUAL  UNION
    
    SELECT ' Mai mare sau egala cu 30Mbit/s si mai mica de 100 Mbit/s '              AS NUME_ROW, '162' AS NR_ROW, '11' AS ORDINE FROM DUAL UNION
    SELECT ' Mai mare sau egala cu 100 Mbit/s si mai mica de 500 Mbit/s'             AS NUME_ROW, '163' AS NR_ROW, '12' AS ORDINE FROM DUAL UNION
    SELECT ' Mai mare sau egala cu 500 Mbit/s si mai mica de 1 Gbit/s '              AS NUME_ROW, '164' AS NR_ROW, '13' AS ORDINE FROM DUAL UNION
    SELECT ' Mai mare sau egala cu 1 Gbit/s '                                       AS NUME_ROW, '165' AS NR_ROW, '14' AS ORDINE FROM DUAL UNION
    SELECT 'Nr.entitai care utilizeaza de dispozitive portabile cu o conexiune mobila la Internet 
           (Nr.compiutere conectate in Banda larga conexiune mobila) '        AS NUME_ROW, '170' AS NR_ROW, '15' AS ORDINE FROM DUAL UNION
    SELECT ' Nr.entitai care au pus  la dispozitie a dispozitive portabile cu conectare la telefonie mobila în scopuri profesionale'            
                                                 AS NUME_ROW, '180' AS NR_ROW, '16' AS ORDINE FROM DUAL UNION
    SELECT ' Numarul persoanelor ocupate care utilizeaza dispozitive portabile cu conectarea la internet prin intermediul retelelor de telefonie mobila '           
                                                AS NUME_ROW, '181' AS NR_ROW, '17' AS ORDINE FROM DUAL UNION
    SELECT ' Website propriu (Existenta paginii web oficiale ) '           
                                               AS NUME_ROW, '210' AS NR_ROW, '18' AS ORDINE FROM DUAL 
    
    
 ) 
     CD


WHERE  D.PERIOADA IN (:pPERIOADA-1) AND
       D.FORM = :pFORM AND
       D.FORM_VERS IN (2000 )  AND  

       D.CAPITOL IN (1181) AND
       D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' 
      
     --  AND D.CUIIO = 1000545
     
 GROUP BY  CD.NR_ROW , CD.NUME_ROW, CD.ORDINE, R.CUIIO,R.DENUMIRE



ORDER BY
CUIIO,
ORDINE

)


GROUP BY 
CUIIO,
--DENUMIRE,
NR_ROW,
ORDINE,
NUME_ROW

ORDER BY
CUIIO, 
ORDINE
)
