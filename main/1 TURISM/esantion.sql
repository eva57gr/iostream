--Daca execut asa si  CUIIO = 40014331 
--returneaza 
--CUIIO	CUIIO_VERS
--40014331	1056

SELECT
            DISTINCT
            R.CUIIO,
            FC.CUIIO_VERS --INTO vCUIIO, vCUIIO_VERS
          FROM
            RENIM R
            INNER JOIN FORM_CUIIO FC ON (R.CUIIO=FC.CUIIO AND R.CUIIO_VERS=FC.CUIIO_VERS )
            INNER JOIN (
          SELECT
            DISTINCT
                R.CUIIO,
                MAX(R.CUIIO_VERS) AS CUIIO_VERS
              FROM
                RENIM R
                INNER JOIN FORM_CUIIO FC ON (R.CUIIO=FC.CUIIO AND R.CUIIO_VERS=FC.CUIIO_VERS AND 2=2)
              WHERE
                R.CUIIO_VERS <= :vPERIOADA AND
                FC.FORM IN (:vFORM)
              GROUP BY
                R.CUIIO
                
                ) D ON (R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS)
          WHERE
            FC.FORM IN (:vFORM) AND
            FC.STATUT <> '3' AND
            FC.CUIIO IN (:vCUIIO) 
            