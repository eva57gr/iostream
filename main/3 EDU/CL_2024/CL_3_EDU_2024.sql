DROP VIEW CIS2.VW_CL_SPEC_3EDU;

CREATE OR REPLACE FORCE VIEW CIS2.VW_CL_SPEC_3EDU
(CODUL, DENUMIRE, GRUPA, FULL_CODE)
AS 
SELECT S.COD_SPEC,
            S.denumire,
            S.GROUP_SPEC,
            S.full_code
       FROM (SELECT TO_CHAR (S1.COD_SPEC,'0000000') AS COD_SPEC,
                    S1.denumire,
                    TO_CHAR (S1.GROUP_SPEC,'0000000') AS GROUP_SPEC,
                       TO_CHAR (S6.COD_SPEC,'0000000')
                    || ';'
                    || DECODE (S6.COD_SPEC,
                               S5.COD_SPEC, '',
                               TO_CHAR (S5.COD_SPEC,'0000000') || ';')
                    || DECODE (S5.COD_SPEC,
                               S4.COD_SPEC, '',
                               TO_CHAR (S4.COD_SPEC,'0000000') || ';')
                    || DECODE (S4.COD_SPEC,
                               S3.COD_SPEC, '',
                               TO_CHAR (S3.COD_SPEC,'0000000') || ';')
                    || DECODE (S3.COD_SPEC,
                               S2.COD_SPEC, '',
                               TO_CHAR (S2.COD_SPEC,'0000000') || ';')
                    || DECODE (S2.COD_SPEC,
                               S1.COD_SPEC, '',
                               TO_CHAR (S1.COD_SPEC,'0000000') || ';')
                       AS full_code
               FROM CL_SPEC_3EDU S1
                    INNER JOIN CL_SPEC_3EDU S2 ON (S1.GROUP_SPEC = S2.COD_SPEC)
                    INNER JOIN CL_SPEC_3EDU S3 ON (S2.GROUP_SPEC = S3.COD_SPEC)
                    INNER JOIN CL_SPEC_3EDU S4 ON (S3.GROUP_SPEC = S4.COD_SPEC)
                    INNER JOIN CL_SPEC_3EDU S5 ON (S4.GROUP_SPEC = S5.COD_SPEC)
                    INNER JOIN CL_SPEC_3EDU S6 ON (S5.GROUP_SPEC = S6.COD_SPEC)) S
   ORDER BY S.full_code;


GRANT SELECT ON CIS2.VW_CL_SPEC_3EDU TO USER_BANCU;
