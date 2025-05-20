    SELECT
      F.FORMID,
      F.XML,
      F.STATUS,
      F.FORM_TYPE,
      F.DATA_REG,
      F.CUIIO,
      F.SEND_REQUEST,
      F.SEND_ATTEMPTS,
      F.PROCESSING_MESSAGE
    FROM
      F_XML_FORMS F
    WHERE
     -- F.STATUS IN (2)
--      AND FORM_TYPE IN ('9_agr','m3','asa-21','1-inf.rev','65-auto-22','5-ci-22','ei-78','anc_conj','29_agr','24_agr','munca2_22','14_agr','15_agr','6_nr',
--                        '5-con_22','16_agr','asa-22','1-inov')
--      AND 

 FORMID IN (24374011);