


SELECT 
  :pPERIOADA AS PERIOADA,
  :pFORM AS FORM,
  :pFORM_VERS AS FORM_VERS,
  :pID_MDTABLE AS ID_MDTABLE,
  :pCOD_CUATM AS COD_CUATM,
  
    R.NR_ROW AS NR_SECTIE,
   R.NUME_ROW AS NUME_SECTIE,
  '0' AS NR_SECTIE1,
  '0' AS NUME_SECTIE1,
  '0' AS NR_SECTIE2,
  '0' AS NUME_SECTIE2,
  
 
                MR.RIND AS NR_ROW,
                MR.ORDINE AS ORDINE,
                '00000000000' AS DECIMAL_POS, 
                REPLACE(REPLACE(REPLACE(MR.DENUMIRE,'<br>'),'nbsp'),'&;') AS NUME_ROW,
                SUM(CASE WHEN  CC.FULL_CODE LIKE '%'||R.CS_CUATM||'%'  THEN D.COL1 END )  AS COL1,
                SUM(CASE WHEN  CC.FULL_CODE LIKE '%'||R.CS_CUATM||'%'  THEN D.COL2 END)  AS COL2,
                SUM(CASE WHEN  CC.FULL_CODE LIKE '%'||R.CS_CUATM||'%'  THEN CIS2.NVAL(D.COL4)+ CIS2.NVAL(D.COL5) + CIS2.NVAL(D.COL6) END)  AS COL3, 
                SUM(CASE WHEN  CC.FULL_CODE LIKE '%'||R.CS_CUATM||'%'  THEN D.COL4 END)  AS COL4,
                SUM(CASE WHEN  CC.FULL_CODE LIKE '%'||R.CS_CUATM||'%'  THEN D.COL5 END)  AS COL5,
                SUM(CASE WHEN  CC.FULL_CODE LIKE '%'||R.CS_CUATM||'%'  THEN D.COL6 END )  AS COL6,
                SUM(CASE WHEN  CC.FULL_CODE LIKE '%'||R.CS_CUATM||'%'  THEN D.COL7 END)  AS COL7,
                SUM(CASE WHEN  CC.FULL_CODE LIKE '%'||R.CS_CUATM||'%'  THEN D.COL8 END )  AS COL8,
                SUM(CASE WHEN  CC.FULL_CODE LIKE '%'||R.CS_CUATM||'%'  THEN D.COL9 END )  AS COL9
                
                      
                
               
                
               FROM CIS2.VW_DATA_ALL D
                      
                       INNER JOIN CIS2.RENIM RR ON (RR.CUIIO = D.CUIIO AND RR.CUIIO_VERS = D.CUIIO_VERS)
                       INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = RR.CUATM
                       RIGHT JOIN (  
                       
                       SELECT  D.*
            FROM CIS2.MD_RIND D  INNER JOIN (
            SELECT 
  RIND,
  MAX(RIND_VERS) RIND_VERS
FROM CIS2.MD_RIND
WHERE 
capitol=1076 AND capitol_vers=2007
GROUP BY 
RIND
            )DD ON DD.RIND = D.RIND AND DD.RIND_VERS = D.RIND_VERS
            WHERE 
            D.capitol=1076 AND D.capitol_vers=2007
            AND D.STATUT = '1'
            AND D.RIND NOT IN ('-')
         
                       ) MR ON (MR.ID_MD=D.ID_MD 
                       -----------------------------------------------------------
                       AND  (D.FORM=:pFORM) AND
                       (D.FORM_VERS=:pFORM_VERS) AND
                       (:pID_MDTABLE=:pID_MDTABLE) AND
                       (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND   
                       D.PERIOADA IN :pPERIOADA AND
                       D.FORM = 54 
                       
                        
                     )
                       -----------------------------------------------------------
                         INNER JOIN CIS2.VW_CL_CUATM CC ON (D.CUATM=CC.CODUL)
INNER JOIN CIS2.RENIM RE ON (D.CUIIO=RE.CUIIO AND D.CUIIO_VERS=RE.CUIIO_VERS) 
    CROSS JOIN 
  (
    SELECT
      DECODE(CS.CODUL, 
      '0000000','01',
      '0100000','02','1111111','03','0300000','04',
      '1400000','05','3400000','06','3600000','07','4100000','08','4300000','09',
      '4500000','10','4800000','11','6200000','12','7100000','13','7400000','14',
      '7800000','15','2222222','16','1000000','17','2500000','18','3100000','19',
      '3800000','20','5300000','21','5500000','22','6000000','23','6400000','24',
      '6700000','25','8000000','26','8300000','27','8900000','28','9200000','29',
      '3333333','30','1200000','31','1700000','32','2100000','33','2700000','34',
      '2900000','35','5700000','36','8500000','37','8700000','38','9600000','39'
      )
      AS NR_ROW,
      CS.DENUMIRE AS NUME_ROW,
      CS.CODUL AS CS_CUATM
    FROM
      CIS2.VW_CL_CUATM CS
    WHERE
      CS.CODUL 
      IN(
         '0000000',
         '0100000','1111111','0300000','1400000','3400000','3600000','4100000','4300000','4500000',
         '4800000','6200000','7100000','7400000','7800000','2222222','1000000','2500000','3100000','3800000',
         '5300000','5500000','6000000','6400000','6700000','8000000','8300000','8900000','9200000','3333333',
         '1200000','1700000','2100000','2700000','2900000','5700000','8500000','8700000','9600000')
  ) R                    
                   WHERE 
                    1=1
                    AND MR.CAPITOL = 1076
                    
                         
           
           
         GROUP BY
       R.NR_ROW,
  R.NUME_ROW,
  MR.RIND,
  MR.DENUMIRE,
  MR.ORDINE
          
          ORDER BY 
          MR.ORDINE
          
        