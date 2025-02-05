SELECT 
  L.CUIIO,
  L.CUIIO_VERS,
  L.FORM,
  L.FORM_VERS,
  L.STATUT,
  L.ID_SCHEMA, 
  
  R.CUIIO,
  R.CUIIO_VERS,
  R.DENUMIRE,
  R.CUATM,
  R.CFP,
  R.CFOJ,
  R.CAEM2,
  R.ID_SCHEMA
                FROM USER_EREPORTING.FORM_CUIIO_EXTRA L
                                            INNER JOIN USER_EREPORTING.RENIM_EXTRA R 
                                            
                                            ON R.CUIIO = L.CUIIO   AND R.CUIIO_VERS = L.CUIIO_VERS   
                                            
                                             INNER JOIN CIS2.RENIM  RR 
                                            
                                            ON RR.CUIIO = L.CUIIO   AND RR.CUIIO_VERS = L.CUIIO_VERS                                             
                
                WHERE 
                L.FORM = 136
                AND L.FORM_VERS = 2000