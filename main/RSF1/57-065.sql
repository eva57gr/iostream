SELECT
  'Nu este completata Anexa 2 „Situatia de profit si pierdere”'AS REZULTAT
FROM
  DUAL DL LEFT JOIN
  (
    SELECT
      D.CUIIO
    FROM
      CIS2.VW_DATA_ALL_FR_TEMP D
    WHERE
      (D.PERIOADA=:PERIOADA          ) AND
      (D.CUIIO=:CUIIO                ) AND
      (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
      (D.FORM_VERS=:FORM_VERS ) AND
      (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
      (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
      (D.CAPITOL=:CAPITOL           OR :CAPITOL = -1) AND
      :FORM = :FORM AND
       D.FORM IN (57)  AND
      D.CAPITOL IN(1092) 
  ) D ON(1=1)
WHERE
  D.CUIIO IS NULL