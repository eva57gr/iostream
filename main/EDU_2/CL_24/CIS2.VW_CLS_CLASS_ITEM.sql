

--CREATE OR REPLACE FORCE VIEW CIS2.VW_CLS_CLASS_ITEM
--(CLASS_CODE, ITEM_CODE_VERS, ITEM_CODE, ITEM_PARENT, NAME, 
-- SHOW_ORDER, SYS_DATE, SYS_USER, A01, A02, 
-- A03, A04, A05, A06, A07, 
-- A08, A09, A10, A11, A12, 
-- A13, A14, A15, STATUS, ITEM_PATH)
--AS 
SELECT CI.CLASS_CODE,
            CI.ITEM_CODE_VERS,
            CI.ITEM_CODE,
            CI.ITEM_PARENT,
            CI.NAME,
            CI.SHOW_ORDER,
            CI.SYS_DATE,
            CI.SYS_USER,
            CI.A01,
            CI.A02,
            CI.A03,
            CI.A04,
            CI.A05,
            CI.A06,
            CI.A07,
            CI.A08,
            CI.A09,
            CI.A10,
            CI.A11,
            CI.A12,
            CI.A13,
            CI.A14,
            CI.A15,
            CI.STATUS,
            CI.ITEM_PATH
       FROM (  SELECT DISTINCT
                      CI1.CLASS_CODE,
                      CI1.ITEM_CODE_VERS,
                      CI1.ITEM_CODE,
                      CI1.ITEM_PARENT,
                      CI1.NAME,
                      CI1.SHOW_ORDER,
                      CI1.SYS_DATE,
                      CI1.SYS_USER,
                      CI1.A01,
                      CI1.A02,
                      CI1.A03,
                      CI1.A04,
                      CI1.A05,
                      CI1.A06,
                      CI1.A07,
                      CI1.A08,
                      CI1.A09,
                      CI1.A10,
                      CI1.A11,
                      CI1.A12,
                      CI1.A13,
                      CI1.A14,
                      CI1.A15,
                      CI1.STATUS,
                         TO_CHAR (CI6.ITEM_CODE)
                      || ';'
                      || DECODE (CI6.ITEM_CODE,
                                 CI5.ITEM_CODE, '',
                                 TO_CHAR (CI5.ITEM_CODE) || ';')
                      || DECODE (CI5.ITEM_CODE,
                                 CI4.ITEM_CODE, '',
                                 TO_CHAR (CI4.ITEM_CODE) || ';')
                      || DECODE (CI4.ITEM_CODE,
                                 CI3.ITEM_CODE, '',
                                 TO_CHAR (CI3.ITEM_CODE) || ';')
                      || DECODE (CI3.ITEM_CODE,
                                 CI2.ITEM_CODE, '',
                                 TO_CHAR (CI2.ITEM_CODE) || ';')
                      || DECODE (CI2.ITEM_CODE,
                                 CI1.ITEM_CODE, '',
                                 TO_CHAR (CI1.ITEM_CODE) || ';')
                         AS ITEM_PATH
                 FROM CLS_CLASS_ITEM CI1
                      INNER JOIN
                      CLS_CLASS_ITEM CI2
                         ON (    CI1.ITEM_PARENT = CI2.ITEM_CODE
                             AND CI1.CLASS_CODE = CI2.CLASS_CODE
                             -- Wasea add for contraventii constatate to get correct path
                             AND CI2.ITEM_CODE_VERS =--CI2.ITEM_CODE_VERS
                             (
                                                     SELECT DISTINCT
                                                     --  ITEM_CODE
                                                       MAX(ITEM_CODE_VERS)
                                                     FROM
                                                       CIS2.CLS_CLASS_ITEM
                                                     WHERE
                                                       CLASS_CODE IN (CI2.CLASS_CODE) 
                                                          AND     ITEM_CODE IN (CI2.ITEM_CODE)
                                                          AND ITEM_CODE_VERS <= CI1.ITEM_CODE_VERS
                                                     GROUP BY
                                                       ITEM_CODE
                                                    )
                            ----------------------------------------------------
                                                    )
                      INNER JOIN
                      CLS_CLASS_ITEM CI3
                         ON (    CI2.ITEM_PARENT = CI3.ITEM_CODE
                             AND CI2.CLASS_CODE = CI3.CLASS_CODE)
                      INNER JOIN
                      CLS_CLASS_ITEM CI4
                         ON (    CI3.ITEM_PARENT = CI4.ITEM_CODE
                             AND CI3.CLASS_CODE = CI4.CLASS_CODE)
                      INNER JOIN
                      CLS_CLASS_ITEM CI5
                         ON (    CI4.ITEM_PARENT = CI5.ITEM_CODE
                             AND CI4.CLASS_CODE = CI5.CLASS_CODE)
                      INNER JOIN
                      CLS_CLASS_ITEM CI6
                         ON (    CI5.ITEM_PARENT = CI6.ITEM_CODE
                             AND CI5.CLASS_CODE = CI6.CLASS_CODE)
             ORDER BY CI1.ITEM_CODE) CI
   --            LEFT JOIN CLS_CLASS_ITEM CIG ON (CI.ITEM_CODE = CIG.ITEM_PARENT)
   
   
   WHERE
   
   CI.CLASS_CODE = 'SPEC_2EDU'
   ORDER BY CI.SHOW_ORDER, CI.ITEM_PATH;


--GRANT SELECT ON CIS2.VW_CLS_CLASS_ITEM TO USER_BANCU;
