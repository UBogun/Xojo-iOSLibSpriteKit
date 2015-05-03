#tag Class
Protected Class iOSLIbDelegate
Inherits iOSLibObject
	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if mDelegateClassDict = NIL then mDelegateClassDict = new Dictionary
			  return mDelegateClassDict
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDelegateClassDict = value
			End Set
		#tag EndSetter
		Shared DelegateClassDict As Dictionary
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared mDelegateClassDict As Dictionary
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="DebugDescription"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasOwnership"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsNIL"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="mHasOwnership"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
