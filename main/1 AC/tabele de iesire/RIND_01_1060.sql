 SELECT
    '01' AS RIND,
    'Autorizatiile de construire eliberate pentru toate cladirile - total( r.02+r.06)' AS DENUMIRE,
    0 AS ORDINE,
    SUM(D.COL1) AS COL1,
    SUM(D.COL2) AS COL2
  FROM
    CIS2.VW_DATA_ALL D
  WHERE
    D.FORM = 15 AND
    D.CAPITOL = 1000 AND
    D.RIND IN('02', '06')
    AND D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA
    AND (CIS2.D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%')