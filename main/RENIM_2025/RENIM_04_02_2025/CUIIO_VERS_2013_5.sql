--Create SQL code to delete duplicates in Oracle by column CUIIO - which is number
SELECT *
FROM USER_BANCU.VINZARI_21
WHERE CUIIO IN (
    SELECT CUIIO
    FROM USER_BANCU.VINZARI_21
    GROUP BY CUIIO
    HAVING COUNT(*) > 1
)

ORDER BY 
CUIIO;


DELETE FROM USER_BANCU.ADD_NEW_SU_M3_2024
WHERE ROWID NOT IN (
    SELECT MIN(ROWID)
    FROM USER_BANCU.ADD_NEW_SU_M3_2024
    GROUP BY CUIIO
);

-----------------------------------------------------------