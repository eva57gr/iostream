SELECT
    D.CUIIO,
    LISTAGG(D.FORM, ',') WITHIN GROUP (ORDER BY RN) AS DEN_SHORT
FROM
    (
    SELECT
        D.CUIIO,
        D.FORM,
        ROW_NUMBER() OVER (PARTITION BY D.CUIIO ORDER BY D.FORM) AS RN
    FROM
        CIS2.VW_DATA_ALL D
    WHERE
        D.ANUL = 2022
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
    ) D
GROUP BY
    D.CUIIO
ORDER BY
    D.CUIIO;
