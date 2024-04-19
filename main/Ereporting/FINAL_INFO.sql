SELECT
        L.ID_SCHEMA,
        L.PERIOADA,
        L.FORM,
        L.FORM_VERS,
        L.DENUMIRE,
        L.CNT BNS,
        D.CNT CTIF,
        L.CNT - D.CNT AS ONLY_BNS





         FROM   CIS_CIS2_BNS L LEFT JOIN CIS_CIS2_CTIF D ON L.FORM = D.FORM
         
         
                    AND L.FORM_VERS = D.FORM_VERS AND  L.ID_SCHEMA =  D.ID_SCHEMA AND L.PERIOADA = D.PERIOADA