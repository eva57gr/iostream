/* Formatted on 3/2/2023 11:19:15 AM (QP5 v5.326) */
DECLARE -- ====================================================================
    CURSOR C IS
        SELECT D.UNIT_CODE,
               D.UNIT_CODE_VERS,
               D.NR_GOSP,
               D.NR_MAPS,
               D.SURNAME,
               D.NAME,
               D.PATRONIMIC,
               D.CUATM,
               D.ADDRESS_1,
               D.ADDRESS_2,
               D.ADDRESS_3,
               D.ADDRESS_4,
               D.ENVIRONMENT,
               D.CSID,
               D.EDIT_USER
          FROM USER_BANCU.REG_UNIT_GC3_2024  D
               LEFT JOIN CIS2.REG_UNIT_GC RN
                   ON     D.UNIT_CODE = RN.UNIT_CODE
                      AND D.UNIT_CODE_VERS = RN.UNIT_CODE_VERS
                      AND D.NR_GOSP = RN.NR_GOSP
                      AND D.NR_MAPS = RN.NR_MAPS
         WHERE RN.UNIT_CODE IS NOT NULL
         
         
         
         ;
BEGIN -- ======================================================================
    FOR CR IN C
    LOOP
        UPDATE CIS2.REG_UNIT_GC
           SET NAME = CR.NAME, ADDRESS_1 = CR.ADDRESS_1, CUATM = CR.CUATM
         WHERE     UNIT_CODE = CR.UNIT_CODE
               AND UNIT_CODE_VERS = CR.UNIT_CODE_VERS
               AND NR_GOSP = CR.NR_GOSP
               AND NR_MAPS = CR.NR_MAPS;
    END LOOP;
END; -- =======================================================================