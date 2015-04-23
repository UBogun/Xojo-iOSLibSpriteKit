#tag IOSView
Begin iosView InfoView
   BackButtonTitle =   "Return"
   Compatibility   =   ""
   Left            =   0
   NavigationBarVisible=   False
   TabTitle        =   ""
   Title           =   ""
   Top             =   0
   Begin iOSImageView ImageView1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   ImageView1, 7, , 0, False, +1.00, 1, 1, 76, 
      AutoLayout      =   ImageView1, 8, , 0, False, +1.00, 1, 1, 59, 
      AutoLayout      =   ImageView1, 3, TopLayoutGuide, 4, False, +1.00, 1, 1, *kStdControlGapV, 
      AutoLayout      =   ImageView1, 2, <Parent>, 2, False, +1.00, 1, 1, -*kStdGapCtlToViewH, 
      ContentMode     =   "1"
      Height          =   59.0
      Image           =   "547002367"
      Left            =   224
      LockedInPosition=   False
      Scope           =   0
      Top             =   28
      Visible         =   True
      Width           =   76.0
   End
   Begin iostextarea TextArea1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   TextArea1, 1, <Parent>, 1, False, +1.00, 1, 1, *kStdGapCtlToViewH, 
      AutoLayout      =   TextArea1, 3, ImageView1, 4, False, +1.00, 2, 1, *kStdControlGapV, 
      AutoLayout      =   TextArea1, 2, ImageView1, 2, False, +1.00, 1, 1, 0, 
      AutoLayout      =   TextArea1, 4, BottomLayoutGuide, 3, False, +1.00, 2, 1, 0, 
      Editable        =   False
      Height          =   385.0
      KeyboardType    =   "0"
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      Text            =   ""
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   95
      Visible         =   True
      Width           =   280.0
   End
   Begin iOSButton Button1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Button1, 7, , 0, False, +1.00, 1, 1, 79, 
      AutoLayout      =   Button1, 8, , 0, False, +1.00, 1, 1, 30, 
      AutoLayout      =   Button1, 4, TextArea1, 3, False, +1.00, 1, 1, -*kStdControlGapV, 
      AutoLayout      =   Button1, 1, TextArea1, 1, False, +1.00, 1, 1, 0, 
      Caption         =   "<  Return"
      Enabled         =   True
      Height          =   30.0
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   ""
      TextSize        =   0
      Top             =   57
      Visible         =   True
      Width           =   79.0
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Event
		Sub Close()
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor(prompt as text)
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  TextArea1.text = prompt
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events ImageView1
	#tag Event
		Sub Open()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TextArea1
	#tag Event
		Sub Open()
		  
		  me.ScrollEnabled = true
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Button1
	#tag Event
		Sub Action()
		  self.Dismiss (true)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="BackButtonTitle"
		Group="Behavior"
		Type="Text"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Index"
		Visible=true
		Group="ID"
		InitialValue="-2147483648"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="NavigationBarVisible"
		Group="Behavior"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabTitle"
		Group="Behavior"
		Type="Text"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Group="Behavior"
		Type="Text"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
