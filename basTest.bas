Attribute VB_Name = "basTest"
' basTest

Option Compare Database
Option Explicit

Private Sub TestAuftragHinzufuegen()
    Dim TestKlasse As clsAuftrag
    Set TestKlasse = New clsAuftrag
    
    TestKlasse.AddRecordset
    
    ' Clean up
    Set TestKlasse = Nothing
End Sub

Private Sub TestAngebotHinzufuegen()
    Dim TestKlasse As clsAngebot
    Set TestKlasse = New clsAngebot
    
    TestKlasse.AddRecordset
    
    ' Clean up
    Set TestKlasse = Nothing
End Sub

Private Sub TestRecordsetExists()
    Debug.Print "TestRecordsetExists: " _
        & basSupport.RecordsetExists("tblAuftrag", "AftrID", "345")
End Sub

Private Sub TestForEach()
    Dim astrTable(1) As String
    Dim varTableName As Variant
    
    astrTable(0) = "tblAngebot"
    astrTable(1) = "tblAuftrag"
    
    For Each varTableName In astrTable
        Debug.Print varTableName
    Next
End Sub

Private Sub TestForNext()
    Dim astrTable(1, 2) As String
    Dim lngi As Long
    Dim lngj As Long
    
    Dim bolTest As Boolean
    bolTest = True
    
    astrTable(0, 0) = "test 0, 0"
    astrTable(0, 1) = "test 0, 1"
    astrTable(0, 2) = "test 0, 2"
    astrTable(1, 0) = "test 1, 0"
    astrTable(1, 1) = "test 1, 1"
    astrTable(1, 2) = "test 1, 2"
    
    astrTable(0, 0) = "test 0, 0"
    astrTable(0, 1) = "test 0, 1"
    astrTable(0, 2) = "test 0, 2"
    astrTable(1, 0) = "test 1, 0"
    astrTable(1, 1) = CStr(bolTest)
    astrTable(1, 2) = "test 1, 2"
    
    For lngi = LBound(astrTable, 1) To UBound(astrTable, 1)
        For lngj = LBound(astrTable, 2) To UBound(astrTable, 2)
            Debug.Print astrTable(lngi, lngj)
        Next
    Next
    
    Debug.Print "CBool(astrTable(1, 1)): "; CBool(astrTable(1, 1))
End Sub

Private Sub TestRechnungHinzufuegen()
    Dim TestKlasse As clsRechnung
    Set TestKlasse = New clsRechnung
    
    TestKlasse.AddRecordset
    
    ' Clean up
    Set TestKlasse = Nothing
End Sub

Private Sub testLeistungserfassungsblattHinzufuegen()
    Dim TestKlasse As clsLeistungserfassungungsblatt
    Set TestKlasse = New clsLeistungserfassungungsblatt
    
    TestKlasse.AddRecordset
    
    ' Clean up
    Set TestKlasse = Nothing
End Sub

Private Sub testDatensatzLaden()
    Dim TestKlasse As clsAuftrag
    Set TestKlasse = New clsAuftrag
    
    TestKlasse.SelectRecordset "BCH25900", True
    
    Set TestKlasse = Nothing
End Sub

Private Sub TestCollection()
    Dim intInteger As Integer
    intInteger = 100
    
    Dim strString As String
    strString = "Hallo"
    
    Dim colTestCollection As Collection
    Set colTestCollection = New Collection
    
    With colTestCollection
        .Add intInteger
        .Add strString
    End With
    
    Dim intI As Integer
    For intI = 1 To 2
        Debug.Print "TestCollection: colTestCollection.Item(" & intI & ") = " & colTestCollection.Item(intI)
    Next
    
    Dim varEintrag As Variant
    For Each varEintrag In colTestCollection
        Debug.Print "TestCollection: colTestCollection.Item = " & varEintrag
    Next
    
    Debug.Print "TestCollection: colTestCollection.Item(1) =" & colTestCollection.Item(1)
    Debug.Print "TestCollection: colTestCollection.Item(2) =" & colTestCollection.Item(2)
    ' die Werte der Collection sind schreibgeschützt
    ' colTestCollection.Item(2) = "Welt"
    Debug.Print "TestCollection: colTestCollection.Item(2) =" & colTestCollection.Item(2)
End Sub

Private Sub TestArray()
    Dim intInteger As Integer
    intInteger = 100
    
    Dim strString As String
    strString = "Hallo"
    
    Dim varArray(1) As Variant
        
    varArray(0) = intInteger
    varArray(1) = strString
    
    Dim intI As Integer
    For intI = 0 To 1
        Debug.Print "TestCollection: varArray(" & intI & ") = " & varArray(intI)
    Next
    
    varArray(1) = "Welt"
    
    Debug.Print "TestCollection: varArray(1) = " & varArray(1)
    Debug.Print "TestCollection: strString = " & strString
    
    ' die Werte der Collection sind schreibgeschützt
    ' colTestCollection.Item(2) = "Welt"
End Sub

Private Sub TestFindItemArray()
    Dim varArray(1, 1) As Variant
    
    varArray(0, 0) = "nill"
    varArray(0, 1) = "one"
    varArray(1, 0) = 1
    varArray(1, 1) = 2
    
    Debug.Print "basTest.TestFindItemArray: " & basSupport.FindItemArray(varArray, "one", True)
End Sub

Private Sub TestFindItemArrayInProperty()
    Dim TestKlasse As clsAuftrag
    Set TestKlasse = New clsAuftrag
    
    TestKlasse.Verbatim = False
    TestKlasse.AftrID = "1"
    TestKlasse.Erstellt = #1/1/1900 11:59:59 PM#
    Debug.Print "basTest.TestFindItemArrayInProperty: TestKlasse.AftrID = " & TestKlasse.AftrID
    Debug.Print "basTest.TestFindItemArrayInProperty: TestKlasse.Erstellt = " & TestKlasse.Erstellt
End Sub
