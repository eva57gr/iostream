Sub ColorareTabelPeRânduri()
    Dim ws As Worksheet
    Dim lastRow As Long, lastCol As Long
    Dim i As Long, j As Long
    Dim cuiio As String
    Dim targetCell As Range
    
    ' Selectam foaia activa
    Set ws = ActiveSheet
    
    ' Gasim ultimul rând din coloana A ?i ultima coloana cu date
    lastRow = ws.Cells(ws.Rows.Count, 1).End(xlUp).Row
    lastCol = 7 ' Coloanele A-G (1-7)
    
    ' Parcurgem fiecare valoare din coloana A
    For i = 1 To lastRow
        cuiio = ws.Cells(i, 1).Value ' Substring-ul curent din coloana A
        
        ' Ignoram celulele goale din coloana A
        If Len(cuiio) > 0 Then
            ' Verificam toate celulele din tabel
            For j = 1 To lastRow
                If i <> j Then
                    If InStr(1, ws.Cells(j, 1).Value, cuiio, vbTextCompare) > 0 Then
                        ' Coloram rândul care con?ine substringul în verde
                        For col = 1 To lastCol
                            ws.Cells(i, col).Interior.Color = RGB(0, 255, 0) ' Verde
                        Next col
                        
                        ' Coloram rândul care con?ine stringul în galben
                        For col = 1 To lastCol
                            ws.Cells(j, col).Interior.Color = RGB(255, 255, 0) ' Galben
                        Next col
                    End If
                End If
            Next j
        End If
    Next i
    
    MsgBox "Colorarea rândurilor a fost finalizata!", vbInformation
End Sub

