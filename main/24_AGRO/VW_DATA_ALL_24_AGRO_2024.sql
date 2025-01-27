
SELECT 
D.CUIIO,
R.DENUMIRE,
R.IDNO,
--D.CUIIO_VERS,
D.CUATM,
D.COL1
FROM

(
SELECT *
FROM (
    -- Partea 1: Rândurile care satisfac rela?ia substring-string
    SELECT 
        A.*, 
        1 AS SORT_ORDER
    FROM USER_BANCU.AGRO_24 A
    WHERE CUIIO IN (
        SELECT DISTINCT A.CUIIO
        FROM USER_BANCU.AGRO_24 A
        JOIN USER_BANCU.AGRO_24 B
        ON A.CUIIO <> B.CUIIO
        AND TO_CHAR(B.CUIIO) LIKE TO_CHAR(A.CUIIO) || '%'
        UNION
        SELECT DISTINCT B.CUIIO
        FROM USER_BANCU.AGRO_24 A
        JOIN USER_BANCU.AGRO_24 B
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
    FROM USER_BANCU.AGRO_24 A
    WHERE CUIIO NOT IN (
        SELECT DISTINCT A.CUIIO
        FROM USER_BANCU.AGRO_24 A
        JOIN USER_BANCU.AGRO_24 B
        ON A.CUIIO <> B.CUIIO
        AND TO_CHAR(B.CUIIO) LIKE TO_CHAR(A.CUIIO) || '%'
        UNION
        SELECT DISTINCT B.CUIIO
        FROM USER_BANCU.AGRO_24 A
        JOIN USER_BANCU.AGRO_24 B
        ON A.CUIIO <> B.CUIIO
        AND TO_CHAR(B.CUIIO) LIKE TO_CHAR(A.CUIIO) || '%'
    )
)
ORDER BY SORT_ORDER, 
         CASE WHEN SORT_ORDER = 1 THEN SUBSTR(CUIIO, 1, 10) END,
         CASE WHEN SORT_ORDER = 1 THEN LENGTH(CUIIO) END,
         CASE WHEN SORT_ORDER = 3 THEN CUIIO END DESC
         
         
         ) D INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS 
