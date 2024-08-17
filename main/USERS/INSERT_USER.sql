--INSERT INTO    CIS2.SYS_USER_ACCES
--    (
--  ID_USER,
--  CUATM,
--  FORM,
--  FORM_VERS,
--  ISADMIN,
--  ACCES_TYPE,
--  CAPITOL_ACCES,
--  DATA_REG
--  )


--ID_USER IN  (
--
--80,
--1621
--
--)


SELECT
  1621 ID_USER,
  L.CUATM,
  L.FORM,
  L.FORM_VERS,
  L.ISADMIN,
  L.ACCES_TYPE,
  L.CAPITOL_ACCES,
  SYSDATE DATA_REG

FROM

(
  SELECT
  ID_USER,
  CUATM,
  FORM,
  FORM_VERS,
  ISADMIN,
  ACCES_TYPE,
  CAPITOL_ACCES,
  DATA_REG

     FROM CIS2.SYS_USER_ACCES


        WHERE

        ID_USER IN (80)
---------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------ss
-------------------------------------------------------------------------------------------


        ) L  LEFT JOIN  (

        SELECT
  ID_USER,
  CUATM,
  FORM,
  FORM_VERS,
  ISADMIN,
  ACCES_TYPE,
  CAPITOL_ACCES,
  DATA_REG

     FROM CIS2.SYS_USER_ACCES


        WHERE

        ID_USER IN (1621)

        ) R ON R.FORM = L.FORM


        WHERE

        R.FORM IS NULL


GROUP BY
  L.CUATM,
  L.FORM,
  L.FORM_VERS,
  L.ISADMIN,
  L.ACCES_TYPE,
  L.CAPITOL_ACCES,
  ROWNUM

--      HAVING
--
--      ROWNUM <=10