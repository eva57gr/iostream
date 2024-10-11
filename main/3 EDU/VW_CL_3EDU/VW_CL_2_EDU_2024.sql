CREATE OR REPLACE FORCE VIEW USER_BANCU.VW_CL_SPEC_2EDU_24
(CODUL, DENUMIRE, GRUPA, FULL_CODE, ORDINE)
AS 
SELECT S.COD_SPEC CODUL,
            S.denumire DENUMIRE,
            S.GROUP_SPEC GRUPA,
            S.full_code FULL_CODE,
            s.ORDINE ORDINE
       FROM (SELECT TO_CHAR (REPLACE(S1.COD_SPEC, '.', ''),'00000000000000') AS COD_SPEC,
                    S1.denumire,
                    TO_CHAR (REPLACE(S1.GROUP_SPEC, '.', ''),'00000000000000') AS GROUP_SPEC,
                       TO_CHAR (REPLACE(S6.COD_SPEC, '.', ''),'00000000000000')
                    || ';'
                    || DECODE (S6.COD_SPEC,
                               S5.COD_SPEC, '',
                               TO_CHAR (REPLACE(S5.COD_SPEC, '.', ''),'00000000000000') || ';')
                    || DECODE (S5.COD_SPEC,
                               S4.COD_SPEC, '',
                               TO_CHAR (REPLACE(S4.COD_SPEC, '.', ''),'00000000000000') || ';')
                    || DECODE (S4.COD_SPEC,
                               S3.COD_SPEC, '',
                               TO_CHAR (REPLACE(S3.COD_SPEC, '.', ''),'00000000000000') || ';')
                    || DECODE (S3.COD_SPEC,
                               S2.COD_SPEC, '',
                               TO_CHAR (REPLACE(S2.COD_SPEC, '.', ''),'00000000000000') || ';')
                    || DECODE (S2.COD_SPEC,
                               S1.COD_SPEC, '',
                               TO_CHAR (REPLACE(S1.COD_SPEC, '.', ''),'00000000000000') || ';')
                       AS full_code,
                       s1.ORDINE
               FROM CL_SPEC_2EDU_24 S1
                    INNER JOIN CL_SPEC_2EDU_24 S2 ON (REPLACE(S1.GROUP_SPEC, '.', '') = REPLACE(S2.COD_SPEC, '.', ''))
                    INNER JOIN CL_SPEC_2EDU_24 S3 ON (REPLACE(S2.GROUP_SPEC, '.', '') = REPLACE(S3.COD_SPEC, '.', ''))
                    INNER JOIN CL_SPEC_2EDU_24 S4 ON (REPLACE(S3.GROUP_SPEC, '.', '') = REPLACE(S4.COD_SPEC, '.', ''))
                    INNER JOIN CL_SPEC_2EDU_24 S5 ON (REPLACE(S4.GROUP_SPEC, '.', '') = REPLACE(S5.COD_SPEC, '.', ''))
                    INNER JOIN CL_SPEC_2EDU_24 S6 ON (REPLACE(S5.GROUP_SPEC, '.', '') = REPLACE(S6.COD_SPEC, '.', ''))) S
   ORDER BY S.full_code;