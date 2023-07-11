    SELECT
    CUIIO,
    LISTAGG(DEN_SHORT, ',') WITHIN GROUP (ORDER BY DEN_SHORT) AS DEN_SHORT
FROM

(SELECT DISTINCT
        D.CUIIO,
        MF.FORM,
        MF.DEN_SHORT
    FROM
        CIS2.VW_DATA_ALL D
      INNER JOIN CIS2.MD_FORM MF ON MF.FORM = D.FORM  
        
        AND 
        (CASE WHEN MF.FORM = 71 THEN 2011  ELSE D.FORM_VERS END  = MF.FORM_VERS)
    WHERE
        D.ANUL = :pANUL
        AND D.CUIIO IN (
             SELECT CUIIO 

    FROM USER_BANCU.LIST_OF_REPORTS
        )
        
        
        
        UNION 
        
         SELECT DISTINCT
        D.CUIIO,
        MF.FORM,
        MF.DEN_SHORT
    FROM
        CIS.VW_DATA_ALL D
        INNER JOIN CIS.MD_FORM MF ON MF.FORM = D.FORM AND MF.FORM_VERS = D.FORM_VERS
    WHERE
        D.ANUL = :pANUL
        AND D.CUIIO IN (
            SELECT CUIIO 

    FROM USER_BANCU.LIST_OF_REPORTS
        )
        
        UNION 
        
        SELECT DISTINCT
        D.CUIIO,
        MF.FORM,
        MF.DEN_SHORT
    FROM
        M53.VW_DATA_ALL D
        INNER JOIN M53.MD_FORM MF ON MF.FORM = D.FORM AND MF.FORM_VERS = D.FORM_VERS
    WHERE
        D.ANUL = :pANUL
        AND D.CUIIO IN (
            SELECT CUIIO 

    FROM USER_BANCU.LIST_OF_REPORTS
        )
        
        UNION 
        SELECT DISTINCT
        D.CUIIO,
        MF.FORM,
        MF.DEN_SHORT
    FROM
        CIS2.VW_DATA_ALL_FR D
        INNER JOIN CIS2.MD_FORM MF ON MF.FORM = D.FORM AND MF.FORM_VERS = D.FORM_VERS
    WHERE
        D.ANUL = :pANUL
        AND D.CUIIO IN (
            SELECT CUIIO 

    FROM USER_BANCU.LIST_OF_REPORTS )
        
        
        
        ORDER BY 
        
         CUIIO,
        
         DEN_SHORT
         )
         
         GROUP BY
    CUIIO
ORDER BY
    CUIIO