SELECT    
           
           C.CODUL,
           COUNT(DISTINCT CASE WHEN C.CODUL = R.CAEM2 AND CC.FULL_CODE LIKE '%'||'1111111'||';%' THEN FC.CUIIO END ) AS COL1,
           NULL AS COL2,
           COUNT(DISTINCT CASE WHEN C.CODUL = R.CAEM2 AND CC.FULL_CODE LIKE '%'||'2222222'||';%' THEN FC.CUIIO END ) AS COL3,
           NULL AS COL4, 
           COUNT(DISTINCT CASE WHEN C.CODUL = R.CAEM2 AND CC.FULL_CODE LIKE '%'||'3333333'||';%' THEN FC.CUIIO END ) AS COL5,
           NULL AS COL6,
           COUNT(DISTINCT CASE WHEN C.CODUL = R.CAEM2 AND CC.FULL_CODE LIKE '%'||'0100000'||';%' THEN FC.CUIIO END ) AS COL7,
           NULL AS COL8,
            COUNT(DISTINCT CASE WHEN C.CODUL = R.CAEM2 AND CC.FULL_CODE LIKE '%'||'9600000'||';%' THEN FC.CUIIO END ) AS COL9,
            NULL AS COL10
           
           
           
          
           
           
      FROM (SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (:pFORM) AND FC.STATUT <> '3') FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
               INNER JOIN CIS2.VW_CL_CUATM CC ON CC.CODUL = R.CUATM
               
           
               
                    CROSS JOIN (
                    SELECT C.*
FROM CIS2.VW_CL_CAEM2 C
WHERE 
SUBSTR(C.CODUL, 1, 4) IN (
'B061',
'B081',
'C101',
'C102',
'C103',
'C104',
'C105',
'C106',
'C107',
'C108',
'C109',
'C110',
'C120',
'C131',
'C132',
'C133',
'C139',
'C141',
'C143',
'C151',
'C152',
'C161',
'C162',
'C172',
'C181',
'C192',
'C201',
'C202',
'C203',
'C204',
'C205',
'C206',
'C211',
'C212',
'C221',
'C222',
'C231',
'C233',
'C234',
'C235',
'C236',
'C237',
'C243',
'C244',
'C245',
'C251',
'C252',
'C256',
'C257',
'C259',
'C264',
'C265',
'C271',
'C273',
'C274',
'C281',
'C282',
'C283',
'C284',
'C289',
'C292',
'C293',
'C310',
'C321',
'C323',
'C324',
'C325',
'C329',
'C331',
'C332',
'D351',
'D352',
'D353',
'E360',
'E370',
'E381',
'E382',
'E383',
'G453',
'G461',
'G462',
'G463',
'G464',
'G465',
'G466',
'G467',
'G469',
'G474',
'G475',
'G477',
'G478',
'H492',
'H493',
'H494',
'H495',
'H504',
'H511',
'H512',
'H521',
'H522',
'H531',
'H532',
'J581',
'J582',
'J591',
'J601',
'J602',
'J611',
'J612',
'J613',
'J619',
'J620',
'J631',
'J639',
'K641',
'K649',
'K651',
'K661',
'K662',
'M711',
'M712',
'M721',
'M731',
'M732',
'M741'
)  
                    ) C 
                    
                           

GROUP BY 
C.CODUL



ORDER BY 
C.CODUL 