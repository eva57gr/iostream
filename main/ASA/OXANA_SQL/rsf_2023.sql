CREATE OR REPLACE FORCE VIEW  VVW_KATALOG_RSF_23
(
CUIIO,
CAEM2,
NMP,
VZ

)

AS


            select
             CUIIO, 
             CAEM2,
             sum(NMP) as NMP,
             sum(VZ) as VZ
             from USER_BANCU.RSF_2023
             
             GROUP by 
             CUIIO,
             CAEM2