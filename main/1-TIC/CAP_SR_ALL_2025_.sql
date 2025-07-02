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
       MR.DENUMIRE RIND_DENUMIRE, -- pentru aceasta coloana de exclus toate tagurile html - SQL Oracle
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
      AND D.CUIIO = 227548
     
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


ORDER BY
D.CUIIO,
--MC.DEN_SHORT,
MC.ORDINE,
MR.RIND
