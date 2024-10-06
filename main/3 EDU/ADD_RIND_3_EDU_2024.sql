SELECT D.*

FROM CIS2.VW_DATA_ALL D
WHERE
D.PERIOADA IN (:pPERIOADA)
AND D.FORM IN (:pFORM)
AND D.capitol = 1058

---------------------------------------------------
----------------------------------------------------------------
