SELECT * FROM
            (
            SELECT
                DISTINCT
                D.CUIIO,
                D.CUIIO_VERS,
                D.FORM,
                    CASE WHEN D.RIND IN ('CAEM') THEN
                     DECODE(C.NR_COL,'3',D.COL3,'4',D.COL4,'5',D.COL5,'6',D.COL6,'7',D.COL7,'8',D.COL8,'9',D.COL9,'10',D.COL10,'11',D.COL11,'12',D.COL12)
                     WHEN C.NR_COL IN('1','2','3','4') THEN
                     DECODE(C.NR_COL,'1',0,'2',TO_NUMBER(SUBSTR(D.CAEM2,2,5)))
                END AS CAEM2,
                
                C.NR_COL AS COL
                         
            FROM 
                VW_DATA_ALL D    
                INNER JOIN VW_CL_CUATM VC ON (D.CUATM = VC.CODUL),
                (
                SELECT '1' AS NR_COL FROM DUAL UNION
                SELECT '2' AS NR_COL FROM DUAL UNION
                SELECT '3' AS NR_COL FROM DUAL UNION
                SELECT '4' AS NR_COL FROM DUAL UNION
                SELECT '5' AS NR_COL FROM DUAL UNION
                SELECT '6' AS NR_COL FROM DUAL UNION
                SELECT '7' AS NR_COL FROM DUAL UNION
                SELECT '8' AS NR_COL FROM DUAL UNION
                SELECT '9' AS NR_COL FROM DUAL UNION
                SELECT '10' AS NR_COL FROM DUAL UNION
                SELECT '11' AS NR_COL FROM DUAL UNION
                SELECT '12' AS NR_COL FROM DUAL 
                ) C

            WHERE
                VC.FULL_CODE LIKE '%'||:pCOD_CUATM||';%' AND 
                D.PERIOADA = :pPERIOADA AND
                D.CAPITOL IN (40) AND
                D.FORM IN (7) AND 
                 D.RIND IN ('CAEM','10','20','30','40','50','60','70','80','90','100','110','120','130','160') 
                 AND D.CUIIO=20195572

            ORDER BY 
                D.CUIIO
            ) R

        WHERE
        1=1
          AND   R.CAEM2 IS NOT NULL