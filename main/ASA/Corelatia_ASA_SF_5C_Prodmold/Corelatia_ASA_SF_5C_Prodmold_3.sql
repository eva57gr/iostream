



  SELECT 
          L.CUIIO, -- 15481 - 15481 
          L.CUIIO_VERS,
          L.IDNO,
          L.FULL_CODE  
  FROM VW_KATALOG_ASA_2023 L LEFT JOIN VVW_KATALOG_ASA_2023 R ON R.CUIIO = L.CUIIO
                    AND R.CUIIO_VERS  = L.CUIIO_VERS  
                    
--                    WHERE
--                    R.CUIIO IS NULL
--                    