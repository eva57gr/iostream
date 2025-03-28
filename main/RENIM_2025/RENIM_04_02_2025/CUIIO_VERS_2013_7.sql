
UPDATE USER_BANCU.ADD_NEW_SU_M3_2024
SET 
    CUIIO = REPLACE(REPLACE(TRIM(CUIIO), CHR(9), ' '), '  ', ' '),
    CUIIO_VERS = REPLACE(REPLACE(TRIM(CUIIO_VERS), CHR(9), ' '), '  ', ' '),
    DENUMIRE = REPLACE(REPLACE(TRIM(DENUMIRE), CHR(9), ' '), '  ', ' '),
    CUATM = REPLACE(REPLACE(TRIM(CUATM), CHR(9), ' '), '  ', ' '),
    CFP = REPLACE(REPLACE(TRIM(CFP), CHR(9), ' '), '  ', ' '),
    CFOJ = REPLACE(REPLACE(TRIM(CFOJ), CHR(9), ' '), '  ', ' '),
    CAEM2 = REPLACE(REPLACE(TRIM(CAEM2), CHR(9), ' '), '  ', ' '),
    IDNO = REPLACE(REPLACE(TRIM(IDNO), CHR(9), ' '), '  ', ' ')
    ;
