SELECT 
       D.CUIIO,
       R.DENUMIRE,
       R.CUATM,
       R.CAEM2,
       R.CFP,
       R.CFOJ,
       R.IDNO,
       MC.DEN_SHORT,
       MC.ORDINE,
       MR.RIND,
       REGEXP_REPLACE(
  REGEXP_REPLACE(MR.DENUMIRE, '<[^>]*>', ''), 
  '&[a-zA-Z]+;', ''
) AS RIND_DENUMIRE,
       SUM(D.COL1) AS COL1,
       SUM(D.COL2) AS COL2
FROM
      CIS2.VW_DATA_ALL D  
      INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS
      INNER JOIN CIS2.MD_CAPITOL MC ON MC.CAPITOL = D.CAPITOL AND MC.CAPITOL_VERS = D.CAPITOL_VERS
      INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD 
WHERE   
       D.PERIOADA IN (:pPERIOADA) AND
       D.FORM = 71 
    --    AND D.CUIIO IN  (227548,19347)
        AND D.FORM_VERS = 2011
        
      --  AND D.CAPITOL = 1195
GROUP BY 
       D.CUIIO,
       R.DENUMIRE,
       R.CUATM,
       R.CAEM2,
       R.CFP,
       R.CFOJ,
       R.IDNO,
       MC.DEN_SHORT,
       MC.ORDINE,
       MR.RIND,
       MR.DENUMIRE
       
       
      HAVING 
     D.CUIIO IN (
     SELECT 
       D.CUIIO
    FROM
      CIS2.VW_DATA_ALL D  
    WHERE   
       D.PERIOADA IN (:pPERIOADA) AND
       D.FORM = 71 
   
        AND D.FORM_VERS = 2011
        
        AND D.CAPITOL = 1195
GROUP BY 
       D.CUIIO
       
       
      HAVING 
      SUM(CASE WHEN D.CAPITOL = 1195 AND D.RIND IN '1' AND NVAL(D.COL1) = 1 THEN NVAL(D.COL1) ELSE 0 END) > 0    
       
     ) 
       
ORDER BY
       D.CUIIO,
       MC.ORDINE,
       MR.RIND;
