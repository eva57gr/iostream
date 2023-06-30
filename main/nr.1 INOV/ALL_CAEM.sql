SELECT    
        
           CC.CODUL,
       
           
           COUNT(DISTINCT CASE WHEN C.CODUL = R.CAEM2 AND CCU.FULL_CODE LIKE '%'||'0000000'||';%' THEN FC.CUIIO END ) AS COL1,
           NULL AS COL2,
           NULL AS COL3,
           NULL AS COL4,
           NULL AS COL5,
           NULL AS COL6,
           NULL AS COL7,
           NULL AS COL8,
           NULL AS COL9,
           NULL AS COL10,
           
           COUNT(DISTINCT CASE WHEN C.CODUL = R.CAEM2 AND CCU.FULL_CODE LIKE '%'||'1111111'||';%' THEN FC.CUIIO END ) AS COL11,
           NULL AS COL12,
           NULL AS COL13,
           NULL AS COL14,
           NULL AS COL15,
           NULL AS COL16,
           NULL AS COL17,
           NULL AS COL18,
           NULL AS COL19,
           NULL AS COL20,
           
                COUNT(DISTINCT CASE WHEN C.CODUL = R.CAEM2 AND CCU.FULL_CODE LIKE '%'||'2222222'||';%' THEN FC.CUIIO END ) AS COL21,
           NULL AS COL22,
           NULL AS COL23,
           NULL AS COL24,
           NULL AS COL25,
           NULL AS COL26,
           NULL AS COL27,
           NULL AS COL28,
           NULL AS COL29,
           NULL AS COL30,
           
           
           COUNT(DISTINCT CASE WHEN C.CODUL = R.CAEM2 AND CCU.FULL_CODE LIKE '%'||'3333333'||';%' THEN FC.CUIIO END ) AS COL31,
           NULL AS COL32,
           NULL AS COL33,
           NULL AS COL34,
           NULL AS COL35,
           NULL AS COL36,
           NULL AS COL37,
           NULL AS COL38,
           NULL AS COL39,
           NULL AS COL40,
           
            COUNT(DISTINCT CASE WHEN C.CODUL = R.CAEM2 AND CCU.FULL_CODE LIKE '%'||'0100000'||';%' THEN FC.CUIIO END ) AS COL41,
           NULL AS COL42,
           NULL AS COL43,
           NULL AS COL44,
           NULL AS COL45,
           NULL AS COL46,
           NULL AS COL47,
           NULL AS COL48,
           NULL AS COL49,
           NULL AS COL50,
           
           
            COUNT(DISTINCT CASE WHEN C.CODUL = R.CAEM2 AND CCU.FULL_CODE LIKE '%'||'9600000'||';%' THEN FC.CUIIO END ) AS COL51,
           NULL AS COL52,
           NULL AS COL53,
           NULL AS COL54,
           NULL AS COL55,
           NULL AS COL56,
           NULL AS COL57,
           NULL AS COL58,
           NULL AS COL59,
           NULL AS COL60
           

           
           
          
           
           
      FROM (SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (:pFORM) AND FC.STATUT <> '3') FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
               INNER JOIN CIS2.VW_CL_CUATM CCU ON CCU.CODUL = R.CUATM
               
           
              INNER JOIN CIS2.VW_CL_CAEM2 C ON C.CODUL = R.CAEM2
  INNER JOIN CIS2.VW_CL_CAEM2 CC ON C.FULL_CODE LIKE '%'||CC.CODUL||'%'

GROUP BY 
CC.CODUL