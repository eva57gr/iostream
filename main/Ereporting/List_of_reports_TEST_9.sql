SELECT
    CUIIO,
    LISTAGG(FORM, ',') WITHIN GROUP (ORDER BY FORM) AS DEN_FORM,
    LISTAGG(DEN_SHORT, ',') WITHIN GROUP (ORDER BY DEN_SHORT) AS DEN_SHORT
FROM
    (
    SELECT DISTINCT
        D.CUIIO,
        MF.FORM,
        MF.DEN_SHORT
    FROM
        CIS2.VW_DATA_ALL D
        INNER JOIN CIS2.MD_FORM MF ON MF.FORM = D.FORM AND MF.FORM_VERS = D.FORM_VERS
    WHERE
        D.ANUL = :pANUL
        AND D.CUIIO IN (
            41349476,
            41000696,
            40866092,
            40220770,
            41169047,
            40774533,
            41419515,
            40065952,
            20283170,
            41290889,
            41101569,
            41286379,
            40669115,
            37787130
        )
    )
GROUP BY
    CUIIO
    
    
    UNION ALL 
    SELECT
    CUIIO,
    LISTAGG(FORM, ',') WITHIN GROUP (ORDER BY FORM) AS DEN_FORM,
    LISTAGG(DEN_SHORT, ',') WITHIN GROUP (ORDER BY DEN_SHORT) AS DEN_SHORT
FROM
    (
    SELECT DISTINCT
        D.CUIIO,
        MF.FORM,
        MF.DEN_SHORT
    FROM
        CIS.VW_DATA_ALL D
        INNER JOIN CIS.MD_FORM MF ON MF.FORM = D.FORM AND MF.FORM_VERS = D.FORM_VERS
    WHERE
        D.ANUL = :pANUL
        AND D.CUIIO IN (
            41349476,
            41000696,
            40866092,
            40220770,
            41169047,
            40774533,
            41419515,
            40065952,
            20283170,
            41290889,
            41101569,
            41286379,
            40669115,
            37787130
        )
    )
GROUP BY
    CUIIO
    
    
    UNION  ALL 
    
    SELECT
    CUIIO,
    LISTAGG(FORM, ',') WITHIN GROUP (ORDER BY FORM) AS DEN_FORM,
    LISTAGG(DEN_SHORT, ',') WITHIN GROUP (ORDER BY DEN_SHORT) AS DEN_SHORT
FROM
    (
    SELECT DISTINCT
        D.CUIIO,
        MF.FORM,
        MF.DEN_SHORT
    FROM
        M53.VW_DATA_ALL D
        INNER JOIN M53.MD_FORM MF ON MF.FORM = D.FORM AND MF.FORM_VERS = D.FORM_VERS
    WHERE
        D.ANUL = 2022
        AND D.CUIIO IN (
            SELECT CUIIO 

    FROM USER_BANCU.LIST_OF_REPORTS
        )
    )
GROUP BY
    CUIIO
ORDER BY
    CUIIO

