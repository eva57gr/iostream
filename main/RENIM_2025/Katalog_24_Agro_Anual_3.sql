Sub ColorareSubstring()
    Dim ws As Worksheet
    Dim lastRow As Long
    Dim i As Long, j As Long
    Dim cuiio As String
    Dim cell As Range, targetCell As Range
    
    ' Selectăm foaia activă
    Set ws = ActiveSheet
    
    ' Găsim ultimul rând din coloana A
    lastRow = ws.Cells(ws.Rows.Count, "A").End(xlUp).Row
    
    ' Parcurgem fiecare rând din coloana A
    For i = 1 To lastRow
        cuiio = ws.Cells(i, 1).Value ' Substring-ul curent
        
        ' Ignorăm celulele goale
        If Len(cuiio) > 0 Then
            ' Comparăm cu toate celelalte rânduri
            For j = 1 To lastRow
                If i <> j Then ' Evităm comparația cu sine
                    Set targetCell = ws.Cells(j, 1)
                    
                    ' Verificăm dacă cuiio este substring
                    If InStr(1, targetCell.Value, cuiio, vbTextCompare) > 0 Then
                        ' Colorăm substringul în verde
                        ws.Cells(i, 1).Interior.Color = RGB(0, 255, 0)
                        ' Colorăm stringul care conține substringul în galben
                        targetCell.Interior.Color = RGB(255, 255, 0)
                    End If
                End If
            Next j
        End If
    Next i
    
    MsgBox "Colorarea substringurilor a fost finalizată!", vbInformation
End Sub
