SELECT
    '02' AS RIND,
    'Autoriza?ii de construire eliberate pentru cladiri reziden?iale - total (r.03+r.04+r.05)' AS DENUMIRE,
    1 AS ORDINE,
    SUM(D.COL1) AS COL1,
    SUM(D.COL2) AS COL2
  FROM
    CIS2.VW_DATA_ALL D
  WHERE
    D.FORM = 15 AND
    D.CAPITOL = 1000 AND
    D.RIND IN('03', '04', '05')
    AND D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA
    AND (CIS2.D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%')