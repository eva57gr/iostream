SELECT D.PERIOADA,
         
          D.CUIIO,
          D.CUIIO_VERS,
          D.FILIAL,
          D.CUATM,
        
          D.FORM,
          D.FORM_VERS,
          D.FORM_DEN,
          D.CAPITOL,
          D.CAPITOL_VERS,
          D.CAPITOL_DEN,
          D.TAB,
          D.ID_MD,
          D.RIND,
          D.RIND_VERS,
          D.ID_USER,
          D.USER_NAME,
          D.DATA_REG,
          EXTND (D.COL1,  --what is he doing  EXTND - This is SQL Oracle 
                 D.CM,
                 D.CD,
                 D.ID_MD,
                 1)
             AS COL1, 
          
          D.NUM_PERS,
          D.CM,
          D.CD
     FROM VW_DATA_ALL_CALC D
     
     
     WHERE 
     D.CUIIO = 38647046
     AND D.PERIOADA = 2012
     AND D.FORM = 64
     AND D.RIND IN('120')