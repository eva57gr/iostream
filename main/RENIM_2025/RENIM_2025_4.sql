SELECT *
FROM USER_BANCU.RENIM_24_F
WHERE IDNO IN (
    SELECT IDNO
    FROM USER_BANCU.RENIM_24_F
    GROUP BY IDNO
    HAVING COUNT(*) > 1
)

ORDER BY 
IDNO
------------------------------------------------------------------------------------