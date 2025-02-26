SELECT *
FROM USER_BANCU.AGRO_24
WHERE IDNO IN (
    SELECT IDNO
    FROM USER_BANCU.AGRO_24
    GROUP BY IDNO
    HAVING COUNT(*) > 1
)

ORDER BY 
IDNO
------------------------------------------------------------------------------------