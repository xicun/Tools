Private Sub Application_ItemSend(ByVal Item As Object, Cancel As Boolean)
    Dim strAddress As String
    Dim strAttach As String

    If Item.MessageClass Like "IPM.TaskRequest*" Then
        Set Item = Item.GetAssociatedTask(False)
    End If
    
    For Each objRecip In Item.Recipients
        strAddress = strAddress & vbTab & objRecip.Name & vbCr
    Next
    
    strAttach = vbCr & IIf(Item.Attachments.Count = 0, "��", "��") & "����" & vbCr
    
    If strAddress <> "" Then
        MSGText = "���⣺��" & Item.Subject & "��" & vbCr & strAttach & vbCr & "�����˵�ַ��" & vbCr & strAddress
        If MsgBox(MSGText, vbYesNo + vbDefaultButton2 + vbQuestion, "����ȷ��") = vbNo Then
            Cancel = True
        End If
    End If
End Sub
