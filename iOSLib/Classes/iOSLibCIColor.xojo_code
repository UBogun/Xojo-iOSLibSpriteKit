#tag Class
Protected Class iOSLibCIColor
Inherits iOSLibObject
	#tag Method, Flags = &h1021
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(Red As Double, Green As Double, Blue as Double)
		  #if Target64Bit
		    Declare function colorWithRedGreenBlue lib UIKit selector "colorWithRed:green:blue:" (id as ptr, Red As Double, Green As Double, Blue as Double) as ptr
		  #elseif Target32Bit
		    Declare function colorWithRedGreenBlue lib UIKit selector "colorWithRed:green:blue:" (id as ptr, Red As single, Green As single, Blue as single) as ptr
		  #endif
		  super.Constructor (colorWithRedGreenBlue(ClassPtr, red, green, blue))
		  RetainClassObject
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(Red As Double, Green As Double, Blue as Double, Alpha as double)
		  #if Target64Bit
		    Declare function colorWithRedGreenBlueAlpha lib UIKit selector "colorWithRed:green:blue:alpha:" (id as ptr, Red As Double, Green As Double, Blue as Double, Alpha as Double) as ptr
		  #elseif Target32Bit
		    Declare function colorWithRedGreenBlueAlpha lib UIKit selector "colorWithRed:green:blue:alpha:" (id as ptr, Red As single, Green As single, Blue as single, Alpha as Single) as ptr
		  #endif
		  super.Constructor (colorWithRedGreenBlueAlpha(ClassPtr, red, green, blue, alpha))
		  RetainClassObject
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(aColor as iOSLibCGColor)
		  Declare function initWithCGColor lib UIKit selector "initWithColor:" (id as ptr, acolor as ptr) as ptr
		  super.Constructor (initWithCGColor(alloc(ClassPtr), aColor.CFTypeRef))
		  mHasownership = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(aColor as iOSLibColor)
		  Declare function initWithColor lib UIKit selector "initWithColor:" (id as ptr, acolor as ptr) as ptr
		  super.Constructor (initWithColor(alloc(ClassPtr), aColor.id))
		  mHasownership = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function MakefromPtr(aPtr as Ptr) As ioslibcicolor
		  return if (aptr = nil, nil, new iOSLibCIColor (aptr))
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if target32bit
			    declare function alpha lib uikit selector "alpha" (id as ptr) as single
			  #elseif target64bit
			    declare function alpha lib UIKit selector "alpha" (id as ptr) as double
			  #endif
			  return alpha (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if target32bit
			    declare sub setAlpha lib uikit selector "setAlpha:" (id as ptr, value as single)
			  #elseif target64bit
			    declare sub setAlpha lib uikit selector "setAlpha:" (id as ptr, value as double)
			  #endif
			  setalpha id, value
			  
			End Set
		#tag EndSetter
		Alpha As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if target32bit
			    declare function blue lib uikit selector "blue" (id as ptr) as single
			  #elseif target64bit
			    declare function blue lib UIKit selector "blue" (id as ptr) as double
			  #endif
			  return blue (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if target32bit
			    declare sub setBlue lib uikit selector "setBlue:" (id as ptr, value as single)
			  #elseif target64bit
			    declare sub setBlue lib uikit selector "setBlue:" (id as ptr, value as double)
			  #endif
			  setBlue id, value
			  
			End Set
		#tag EndSetter
		Blue As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  static mClassPtr as Ptr = NSClassFromString ("CIColor")
			  return mClassPtr
			End Get
		#tag EndGetter
		Protected Shared ClassPtr As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if target32bit
			    declare function green lib uikit selector "green" (id as ptr) as single
			  #elseif target64bit
			    declare function green lib UIKit selector "green" (id as ptr) as double
			  #endif
			  return green (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if target32bit
			    declare sub setGreen lib uikit selector "setGreen:" (id as ptr, value as single)
			  #elseif target64bit
			    declare sub setGreen lib uikit selector "setGreen:" (id as ptr, value as double)
			  #endif
			  setGreen id, value
			  
			End Set
		#tag EndSetter
		Green As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if target32bit
			    declare function red lib uikit selector "red" (id as ptr) as single
			  #elseif target64bit
			    declare function red lib UIKit selector "red" (id as ptr) as double
			  #endif
			  return red (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if target32bit
			    declare sub setRed lib uikit selector "setRed:" (id as ptr, value as single)
			  #elseif target64bit
			    declare sub setRed lib uikit selector "setRed:" (id as ptr, value as double)
			  #endif
			  setRed id, value
			  
			End Set
		#tag EndSetter
		Red As Double
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Alpha"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Blue"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DebugDescription"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Green"
			Group="Behavior"
			Type="Double"
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
			Name="Red"
			Group="Behavior"
			Type="Double"
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
