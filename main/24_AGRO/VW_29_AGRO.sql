
SELECT 
D.CUIIO,
--R.CUIIO_VERS,
R.DENUMIRE,
R.CUATM,
R.IDNO,
D.COL1
FROM

(
SELECT *
FROM (
    -- Partea 1: Rândurile care satisfac rela?ia substring-string
    SELECT 
        A.*, 
        1 AS SORT_ORDER
    FROM USER_BANCU.AGRO_29 A
    WHERE CUIIO IN (
        SELECT DISTINCT A.CUIIO
        FROM USER_BANCU.AGRO_29 A
        JOIN USER_BANCU.AGRO_29 B
        ON A.CUIIO <> B.CUIIO
        AND TO_CHAR(B.CUIIO) LIKE TO_CHAR(A.CUIIO) || '%'
        UNION
        SELECT DISTINCT B.CUIIO
        FROM USER_BANCU.AGRO_29 A
        JOIN USER_BANCU.AGRO_29 B
        ON A.CUIIO <> B.CUIIO
        AND TO_CHAR(B.CUIIO) LIKE TO_CHAR(A.CUIIO) || '%'
    )
    
    UNION ALL
    
    -- Rând gol pentru separare
    SELECT 
        NULL AS CUIIO, NULL AS CUIIO_VERS,  NULL AS CUATM,
        NULL AS COL1, 

        
 2 AS SORT_ORDER
    FROM DUAL
    
    UNION ALL
    
    -- Partea 2: Celelalte rânduri, care nu apar în partea 1, sortate descrescator
    SELECT 
        A.*, 
        3 AS SORT_ORDER
    FROM USER_BANCU.AGRO_29 A
    WHERE CUIIO NOT IN (
        SELECT DISTINCT A.CUIIO
        FROM USER_BANCU.AGRO_29 A
        JOIN USER_BANCU.AGRO_29 B
        ON A.CUIIO <> B.CUIIO
        AND TO_CHAR(B.CUIIO) LIKE TO_CHAR(A.CUIIO) || '%'
        UNION
        SELECT DISTINCT B.CUIIO
        FROM USER_BANCU.AGRO_29 A
        JOIN USER_BANCU.AGRO_29 B
        ON A.CUIIO <> B.CUIIO
        AND TO_CHAR(B.CUIIO) LIKE TO_CHAR(A.CUIIO) || '%'
    )
)
ORDER BY SORT_ORDER, 
         CASE WHEN SORT_ORDER = 1 THEN SUBSTR(CUIIO, 1, 10) END,
         CASE WHEN SORT_ORDER = 1 THEN LENGTH(CUIIO) END,
         CASE WHEN SORT_ORDER = 3 THEN CUIIO END DESC
         
         
         ) D 
         
         INNER JOIN (
         SELECT     
     R.CUIIO,
     R. CUIIO_VERS,
     R.DENUMIRE,
     R.CUATM,
     R.IDNO
           
      FROM (
      
  SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                         
              
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA_LUNA
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (:pFORM) 
             AND FC.STATUT <> '3'
--             AND FC.FORM_VERS IN (:pFORM_VERS)           
             
             
             ) FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
               
              
         ) R ON R.CUIIO = D.CUIIO --AND R.CUIIO_VERS = D.CUIIO_VERS 
