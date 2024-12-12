INSERT INTO CIS2.RENIM (
  CUIIO,
    CUIIO_VERS,
    DENUMIRE,
    EDIT_USER,
    STATUT,
    CUATM,
    CFP,
    CFOJ,
    COCM,
    CAEM,
    BUGET,
    TIP,
    PROD,
    FOR_CUB,
    GENMUZEE,
    TIPMUZEE,
    TIP_LOCAL,
    TIP_INST,
    CAEM2,
    N85_NTL,
    N85_NTIIP,
    N85_NDIIP,
    N85_NPDS,
    N85_NRIIP,
    N85_NSIIP,
    GENMUZEE2,
    NFI,
    NTII,
    NPDS,
    ORGANE,
    TIP_INV,
    RENIM_PERS,
    ORGANE_COND,
    GEN_INSTITUTIE,
    IDNO
)


SELECT 
    CUIIO,
    1062 CUIIO_VERS,
    DENUMIRE,
    EDIT_USER,
    STATUT,
    CUATM,
    CFP,
    CFOJ,
    COCM,
    CAEM,
    BUGET,
    TIP,
    PROD,
    FOR_CUB,
    GENMUZEE,
    TIPMUZEE,
    TIP_LOCAL,
    TIP_INST,
    CAEM2,
    N85_NTL,
    N85_NTIIP,
    N85_NDIIP,
    N85_NPDS,
    N85_NRIIP,
    N85_NSIIP,
    GENMUZEE2,
    NFI,
    NTII,
    NPDS,
    ORGANE,
    TIP_INV,
    RENIM_PERS,
    ORGANE_COND,
    GEN_INSTITUTIE,
    IDNO
                FROM --USER_BANCU.VW_MAX_RENIM_299_CIS
                USER_BANCU.VW_MAX_RENIM_TRIM_CIS2
                
            --   USER_BANCU.VW_MAX_RENIM_CIS2
                    WHERE 
                    
       
                    
                    
            CUIIO IN (
SELECT 
L.CUIIO 
FROM
(
SELECT 
CUIIO
FROM USER_BANCU.IDNO

UNION ALL 

SELECT 
TO_NUMBER(SUBSTR(CUIIO, 1, LENGTH(CUIIO) - 2)) AS CUIIO
FROM USER_BANCU.IDNO


ORDER BY
CUIIO) L LEFT JOIN (

      SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (45) AND CUIIO_VERS <= 1063
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (45) AND FC.STATUT <> '3' 

) R ON R.CUIIO = L.CUIIO 

WHERE 
R.CUIIO IS NULL 

    )


               
                    
                    
                   AND CUIIO_VERS <>   1062