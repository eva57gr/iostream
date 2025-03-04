--INSERT INTO  CIS2.SYS_USER_ACCES
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
  1638 ID_USER,
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
        
   --     AND FORM IN (61,58,62,54,73,43,30,36,26,27,45,39)
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

        ID_USER IN (1638)

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

      HAVING

      ROWNUM <=10