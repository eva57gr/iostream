--Katalog 4 Agro 2024 6699 
--Katalogul 29 Agro TRIM II a fost ajustat dupa  4 Agro 2024 6699 ca numar, CUATM, CFP,CFOJ,CAEM2, IDNO 


-----------------------------------------------------------------------
            SELECT
                   R.CUIIO,
                   R.CUIIO_VERS,
                   L.CUATM,
                   L.CFP,
                   L.CFOJ,
                   L.CAEM2,
                   L.IDNO

            FROM USER_BANCU.VW_4_AGRO_2013 L INNER  JOIN USER_BANCU.VW_29_AGRO_1061 R ON R.CUIIO = L.CUIIO 
            
            WHERE 
            R.CUIIO IS  NOT NULL 
            
                    