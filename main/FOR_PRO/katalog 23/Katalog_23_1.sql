INSERT INTO USER_BANCU.FOR_PRO_2 
(

        CUIIO,
        CUIIO_VERS,
        DENUMIRE,
        CUATM,
        CFP,
        CFOJ,
        CAEM2,
        TIP,
        BUGET

)
 
 
 
 SELECT 
 
        L.CUIIO,
        L.CUIIO_VERS,
        L.DENUMIRE,
        L.CUATM,
        L.CFP,
        L.CFOJ,
        L.CAEM2,
        CASE 
        WHEN L.TIP = 'Exhaustiv' THEN 1
        WHEN L.TIP = 'Esantion' THEN 3
                END   TIP ,
        L.BUGET
        FROM  USER_BANCU.FOR_PRO L