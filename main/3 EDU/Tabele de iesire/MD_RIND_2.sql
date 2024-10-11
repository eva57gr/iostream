SELECT D.CUIIO,
       D.CAPITOL,
       D.RIND,
       SUM(D.COL1) AS COL1
  FROM CIS2.VW_DATA_ALL D
 WHERE     D.FORM IN (:pFORM)
       AND D.PERIOADA IN (:pPERIOADA)
       AND D.CAPITOL = 1049
       AND D.CAPITOL_VERS = 2013
       -- Check if the second and third characters of RIND are both '0'
       AND SUBSTR(D.RIND, 2, 2) = '00'
      -- AND D.RIND LIKE '%8122.2'
GROUP BY 
       D.CUIIO, 
       D.CAPITOL, 
       D.RIND;
