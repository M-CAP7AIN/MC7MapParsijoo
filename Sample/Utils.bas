B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=StaticCode
Version=8.8
@EndOfDesignText@
'Code module
'Subs in this code module will be accessible from all modules.
Sub Process_Globals
	'These global variables will be declared once when the application starts.
	'These variables can be accessed from all modules.
	Public OPT As MC7MapParsijooOptions
End Sub


Sub ParsWKT(MC7MapParsijoo As MC7MapParsijoo , wktstring As String)

	Dim wkt As String = wktstring
	Dim wkt1 As String = wkt.Replace("LINESTRING ","").Replace("(","").Replace(")","")
	Dim arr1() As String = Regex.Split(", " , wkt1)

	Dim PolyLine As MC7MapParsijooPolyLine
	PolyLine.Initialize(MC7MapParsijoo)
	For i=0 To arr1.Length-1
		Dim arr2() As String = Regex.Split(" ", arr1(i))
		Log(arr2(0).Trim)
		Log(arr2(1).Trim)

		PolyLine.addPoint2(arr2(1) , arr2(0)).setWidth(5dip).setColor(Colors.Red)
		
	Next
	MC7MapParsijoo.addPolyLine(PolyLine)

	MC7MapParsijoo.animateToPosition("35.74946287535577" , "51.3862788431399")
	MC7MapParsijoo.Zoom = OPT.ZL_City_3
End Sub
