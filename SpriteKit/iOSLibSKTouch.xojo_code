#tag Class
Protected Class iOSLibSKTouch
Inherits iOSLibTouch
	#tag Method, Flags = &h0
		Function LocationInNode(aNode as ioslibsknode) As NSPoint
		  #if Target64Bit
		    Declare Function locationInNode lib UIKit selector "locationInNode:" (id as ptr, view as ptr) as NSPoint
		    return locationInNode (id, anode.id)
		  #elseif Target32Bit
		    Declare Function locationInNode lib UIKit selector "locationInNode:" (id as ptr, view as ptr) as NSPoint32Bit
		    return locationInNode(id, anode.id).toNSPoint
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function MakefromPtr(aPtr as Ptr) As ioslibsktouch
		  return if (aptr = nil, nil, new iOSLibSKTouch(aptr))
		End Function
	#tag EndMethod


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
