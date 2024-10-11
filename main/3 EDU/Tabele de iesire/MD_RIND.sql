--This is sql Oracle
--in column Rind If the second character is 0 and the third character is zero
  SELECT D.CUIIO,
         D.CAPITOL,
         D.RIND,
         SUM (D.COL1)     AS COL1
    FROM CIS2.VW_DATA_ALL D
   WHERE     FORM IN ( :pFORM)
         AND D.PERIOADA IN ( :pPERIOADA)
         AND D.capitol = 1049
         AND D.CAPITOL_VERS = 2013
        
         AND D.RIND LIKE '%8122.2'
GROUP BY 
D.CUIIO, 
D.CAPITOL, 
D.RIND