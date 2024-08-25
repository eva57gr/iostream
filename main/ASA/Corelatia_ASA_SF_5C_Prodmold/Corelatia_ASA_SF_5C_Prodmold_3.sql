



  SELECT 
    L.CUIIO, -- 15481 - 15481 
    L.CUIIO_VERS,
    L.IDNO,
    L.CUATM,
    L.FULL_CODE, 
    L.CAEM2,
    R.caem_calc,
    R.CAP_SR_1,
    R.CAP_SR_2,
    R.CAP_SR_3,
    R.CAP_SR_4,
    R.CAP_SR_5,
    R.CAP_SR_6,
    R.CAP_SR_7,
    R.RIND_400_COL2,
    R.RIND_150_COL1,
    R.RIND_160,
    R.RIND_200,
    R.RIND_210,
    R.RIND_220,
    R.RIND_240,
    R.RIND_260,
    R.RIND_270,
    R.RIND_280,
    R.RIND_290,
    R.RIND_296,
    R.RIND_320_COL1

          
           
  FROM VW_KATALOG_ASA_2023 L LEFT JOIN VVW_KATALOG_ASA_2023 R ON R.CUIIO = L.CUIIO
                    AND R.CUIIO_VERS  = L.CUIIO_VERS  
                    
--                    WHERE
--                    R.CUIIO IS NULL
--                    


order by 
L.CAEM2