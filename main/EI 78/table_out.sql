SELECT 
  DISTINCT 
  D.COD_CUATM,
--  D.PERIOADA,
--  D.ID_MDTABLE,
  T.DEN_SHORT,
  MAX(D.DATA_CREATE) DATA_CREATE 
    
  


FROM CIS2.TABLE_OUT D  
                INNER JOIN CIS2.MD_TABLES T ON T.ID_MDTABLE = D.ID_MDTABLE  

WHERE




D.ID_MDTABLE  IN (
12695,
12627,
12685,
12215,
12693,
12096,
12686


)
AND D.PERIOADA = 1055

 AND D.DATA_CREATE > TO_DATE('03/24/2023 04:55:12', 'MM/DD/YYYY HH24:MI:SS')


GROUP BY
  D.COD_CUATM,

  T.DEN_SHORT

ORDER BY 
DATA_CREATE DESC,
D.COD_CUATM



--Buna ziua. Tabelele au fost modificate. Acum se afiseaza pachetul din perioada curenta daca este pachet, daca nu este nu se afiseaza. Tabelele au fost create. 