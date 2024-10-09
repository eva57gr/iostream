SELECT c.COD_SPEC,
            c.DENUMIREA,
            c.GRUPA_SPEC,
            c.ordine,
            c.full_code,
            c.num_code
       FROM (SELECT TO_CHAR(c1.COD_SPEC,'000000000') AS COD_SPEC,
                    c1.DENUMIREA,
                    TO_CHAR(c1.GRUPA_SPEC,'000000000') AS GRUPA_SPEC,
                    c1.ordine,
                       TO_CHAR (c6.COD_SPEC,'000000000')
                    || ';'
                    || DECODE (c6.COD_SPEC,
                               c5.COD_SPEC, '',
                               TO_CHAR (c5.COD_SPEC,'000000000') || ';')
                    || DECODE (c5.COD_SPEC,
                               c4.COD_SPEC, '',
                               TO_CHAR (c4.COD_SPEC,'000000000') || ';')
                    || DECODE (c4.COD_SPEC,
                               c3.COD_SPEC, '',
                               TO_CHAR (c3.COD_SPEC,'000000000') || ';')
                    || DECODE (c3.COD_SPEC,
                               c2.COD_SPEC, '',
                               TO_CHAR (c2.COD_SPEC,'000000000') || ';')
                    
                    || DECODE (c2.COD_SPEC,
                               c1.COD_SPEC, '',
                               TO_CHAR (c1.COD_SPEC,'000000000') || ';')
                       AS full_code,
                       
                    TO_NUMBER (SUBSTR (c1.COD_SPEC, 2, 5)) AS num_code
               FROM CL_SPEC_2EDU_24 c1
                    INNER JOIN CL_SPEC_2EDU_24 c2 ON (c1.GRUPA_SPEC = c2.COD_SPEC)
                    INNER JOIN CL_SPEC_2EDU_24 c3 ON (c2.GRUPA_SPEC = c3.COD_SPEC)
                    INNER JOIN CL_SPEC_2EDU_24 c4 ON (c3.GRUPA_SPEC = c4.COD_SPEC)
                    INNER JOIN CL_SPEC_2EDU_24 c5 ON (c4.GRUPA_SPEC = c5.COD_SPEC)
                    INNER JOIN CL_SPEC_2EDU_24 c6 ON (c5.GRUPA_SPEC = c6.COD_SPEC)
                    
                    
                    
                    ) c
   ORDER BY c.ordine, c.full_code