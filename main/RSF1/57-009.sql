SELECT
  'Anexele nu are date' AS REZULTAT
FROM
  DUAL DL LEFT JOIN
  (
    SELECT
      D.CUIIO
    FROM
      CIS2.VW_DATA_ALL_FR D
    WHERE
      (D.PERIOADA=:PERIOADA         ) AND
      (D.CUIIO=:CUIIO                ) AND
      (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
      (D.FORM_VERS=:FORM_VERS ) AND
      (:CAPITOL_VERS=:CAPITOL_VERS  OR :CAPITOL_VERS <>:CAPITOL_VERS) AND
      (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
      (:CAPITOL=:CAPITOL            OR :CAPITOL <>  :CAPITOL ) AND
      :FORM = :FORM AND
       D.FORM IN (57)  AND
      D.CAPITOL IN(1090,1092,1093,1093)
      
      UNION 
       SELECT
      D.CUIIO
    FROM
      CIS2.VW_DATA_ALL_FR D
    WHERE
      (D.PERIOADA=:PERIOADA         ) AND
      (D.CUIIO=:CUIIO                ) AND
      (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
      (D.FORM_VERS=:FORM_VERS ) AND
      (:CAPITOL_VERS=:CAPITOL_VERS  OR :CAPITOL_VERS <>:CAPITOL_VERS) AND
      (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
      (:CAPITOL=:CAPITOL            OR :CAPITOL <>  :CAPITOL ) AND
      :FORM = :FORM AND
       D.FORM IN (57)  AND
      D.CAPITOL IN(1091)
      AND D.RIND IN ('4')
      
      
  ) D ON(1=1)
WHERE
  D.CUIIO IS NULL