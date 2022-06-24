
  SELECT C.CODUL,
         C.FULL_CODE,
         NULL                                                       AS COL1,
         NULL                                                       AS COL2,
         NULL                                                       AS COL3,
         NULL                                                       AS COL4,
         NULL                                                       AS COL5,
         NULL                                                       AS COL6,
         NULL                                                       AS COL7,
         NULL                                                       AS COL8,
         NULL                                                       AS COL9,
         NULL                                                       AS COL10,
         NULL                                                       AS COL11,
         NULL                                                       AS COL12,
         NULL                                                       AS COL13,
         NULL                                                       AS COL14,
         NULL                                                       AS COL15,
         NULL AS COL16,
         NULL AS COL17,
         NULL AS COL18,
         NULL                                                       AS CIS_5_CI__COL19,
         COUNT (DISTINCT CASE WHEN D.FORM = 1 THEN D.CUIIO END)     AS CIS_5_CI__COL20,
         NULL                                                       AS CIS_5_CI__COL21
         
         
         
    FROM (SELECT DISTINCT D.CUIIO,
                          D.CUIIO_VERS,
                          D.CUATM,
                          D.FORM
            FROM CIS.VW_DATA_ALL D
                 INNER JOIN CIS.VW_CL_CUATM C ON D.CUATM = C.CODUL
                 
           WHERE D.PERIOADA = :pPERIOADA_TRIM AND D.FORM IN (1)
             
           ) D
         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
GROUP BY C.CODUL, C.FULL_CODE