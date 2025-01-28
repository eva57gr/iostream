--INSERT INTO RENIM 
--(
--
--
--CUIIO,
--    CUIIO_VERS,
--    DENUMIRE,
--    EDIT_USER,
--    STATUT,
--    CUATM,
--    CFP,
--    CFOJ,
--    CAEM,
--    COCM,
--    LANG,
--    SPEC,
--    TIP_INV,
--    TIP_INV_DEG,
--    TIP_LOCAL,
--    CUATM4,
--    CFP1,
--    AP_BUGET,
--    CAEM2
--)
-- 
SELECT 
    
    CUIIO,
   313  CUIIO_VERS,
    DENUMIRE,
    EDIT_USER,
    STATUT,
    CUATM,
    CFP,
    CFOJ,
    CAEM,
    COCM,
    LANG,
    SPEC,
    TIP_INV,
    TIP_INV_DEG,
    TIP_LOCAL,
    CUATM4,
    CFP1,
    AP_BUGET,
    CAEM2


            FROM 
            --M53.RENIM
            USER_BANCU.VW_MAX_RENIM_M53
            
            WHERE 
            
            CUIIO IN (
3400119.116,
38902125,
4712708.31,
37368953,
4492388,
5694711,
59115336,
7015944,
4494559,
4494660,
3866473,
5694001,
5694001.1,
3598512,
4498675,
4499189,
4500580,
3399132,
37397400,
38675153

)

 AND CUIIO_VERS =  313