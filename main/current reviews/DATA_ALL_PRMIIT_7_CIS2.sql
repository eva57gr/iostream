
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
         NULL                                                       AS auto_1__COL16,
         COUNT (DISTINCT CASE WHEN D.FORM = 7 THEN D.CUIIO END)     AS auto_1__COL17,
         NULL                                                       AS auto_1__COL18
         
         
         
    FROM (SELECT DISTINCT D.CUIIO,
                          D.CUIIO_VERS,
                          D.CUATM,
                          D.FORM
            FROM CIS2.VW_DATA_ALL D
                 INNER JOIN CIS2.VW_CL_CUATM C ON D.CUATM = C.CODUL
                 
           WHERE D.PERIOADA = :pPERIOADA AND D.FORM IN (7)) D
         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
GROUP BY C.CODUL, C.FULL_CODE