INSERT INTO CIS.RENIM 

(

    CUIIO,
    CUIIO_VERS,
    DENUMIRE,
    EDIT_USER,
    STATUT,
    CUATM,
    CFP,
    CFOJ,
    COCM,
    CAEM,
    BUGET,
    TIP,
    PROD,
    FOR_CUB,
    ETAPA_PROD,
    RENIM_PERS,
    CAEM2
    
)

SELECT

    CUIIO,
    1064 CUIIO_VERS,
    DENUMIRE,
    EDIT_USER,
    STATUT,
    CUATM,
    CFP,
    CFOJ,
    COCM,
    CAEM,
    BUGET,
    TIP,
    PROD,
    FOR_CUB,
    ETAPA_PROD,
    RENIM_PERS,
    CAEM2
    
    
   FROM  USER_BANCU.VW_MAX_RENIM_TRIM_CIS
               --      VW_MAX_RENIM_299_CIS  
   
   WHERE 
   
   CUIIO IN (
   
   SELECT 
   
   DISTINCT CUIIO 
   
   FROM 
   USER_BANCU.CUATM_CIS
   )
   
   AND CUIIO_VERS <> 1064;
   
   
   SELECT *
   FROM USER_BANCU.CFP_1064;
   
      
   DELETE
   FROM USER_BANCU.CFP_1064;