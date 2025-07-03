SELECT 
MAX(A.CAEM2) AS CAEM2,
    CASE 
        WHEN COUNT(B.COL3) = 0 THEN 'CAEM nu corespunde parametrilor solicitati'
    
    END AS REZULTAT
FROM
(
    SELECT 
        ROWNUM CNT_R,
        D.RIND,
        COUNT(D.RIND) AS CNT,
        TO_CHAR(NVAL(MAX(CASE WHEN D.CAPITOL IN (1127) AND D.RIND NOT IN ('400','-') THEN D.COL31 ELSE NULL END))) AS CAEM2
    FROM
        CIS2.VW_DATA_ALL_TEMP D  
        INNER JOIN (
            SELECT
                D.PERIOADA, 
                D.CUIIO,
                D.CUIIO_VERS,
                D.ID_MD,
                D.COL1
            FROM CIS2.DATA_ALL D
            WHERE
                (D.PERIOADA = :PERIOADA) AND 
                (D.CUIIO = :CUIIO) AND
                (D.CUIIO_VERS = :CUIIO_VERS OR :CUIIO_VERS = -1) AND
                (D.FORM = :FORM) AND
                (D.FORM_VERS = :FORM_VERS) AND
                D.ID_MD = 58735
        ) DD ON DD.PERIOADA = D.PERIOADA AND DD.CUIIO = D.CUIIO AND DD.CUIIO_VERS = D.CUIIO_VERS
    WHERE
        (D.PERIOADA = :PERIOADA) AND
        (D.CUIIO = :CUIIO) AND
        (D.CUIIO_VERS = :CUIIO_VERS OR :CUIIO_VERS = -1) AND
        (D.FORM = :FORM) AND
        (D.FORM_VERS = :FORM_VERS) AND
        (:CAPITOL = :CAPITOL OR :CAPITOL <> :CAPITOL) AND
        (:CAPITOL_VERS = :CAPITOL_VERS OR :CAPITOL_VERS <> :CAPITOL_VERS) AND
        (D.ID_MD = :ID_MD OR :ID_MD = -1) AND
        D.FORM = 64 AND
        D.CAPITOL IN (1127) AND
        D.RIND NOT IN ('400','-')
    GROUP BY
        D.RIND,
        ROWNUM
    HAVING
        MAX(DD.COL1) > 0
) A
LEFT JOIN (
    SELECT 
        SUBSTR(CODUL, 2, 4) AS COL3
    FROM CIS2.VW_CL_CAEM2
    WHERE 
        PRIM IN ('1') AND 
        (
            SUBSTR(CODUL, 2, 3) IN ('451', '454')
            OR 
            SUBSTR(CODUL, 2, 2) IN ('47')
            OR 
            SUBSTR(CODUL, 2, 4) IN ('4532','3514','3523') 
         

        )

) B ON B.COL3 = A.CAEM2


--
--GROUP BY
-- A.CAEM2 
HAVING 
COUNT(B.COL3) = 0

AND 
MAX(A.CAEM2)  IS NOT NULL
