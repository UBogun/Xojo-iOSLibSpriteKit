#tag Class
Protected Class iOSLibCIVector
Inherits iOSLibObject
	#tag Method, Flags = &h1021
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(X as Double)
		  #if Target64Bit
		    declare function vectorWithX lib CoreImage selector "vectorWithX:" (id as ptr, value as double) as ptr
		  #elseif Target32Bit
		    declare function vectorWithX lib CoreImage selector "vectorWithX:" (id as ptr, value as single) as ptr
		  #endif
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From iOSLibObject
		  // Constructor(AnId as Ptr) -- From iOSLibObject
		  Super.Constructor (VectorWithX (ClassPtr, X))
		  RetainClassObject
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(X as Double, Y As Double)
		  #if Target64Bit
		    declare function vectorWithXY lib CoreImage selector "vectorWithX:Y:" (id as ptr, x as double, y as double) as ptr
		  #elseif Target32Bit
		    declare function vectorWithXY lib CoreImage selector "vectorWithX:Y:" (id as ptr, x as single, y as single) as ptr
		  #endif
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From iOSLibObject
		  // Constructor(AnId as Ptr) -- From iOSLibObject
		  Super.Constructor (VectorWithXY (ClassPtr, X, Y))
		  RetainClassObject
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(X as Double, Y As Double, Z As Double)
		  #if Target64Bit
		    declare function vectorWithXYZ lib CoreImage selector "vectorWithX:Y:Z:" (id as ptr, x as double, y as double, z as double) as ptr
		  #elseif Target32Bit
		    declare function vectorWithXYZ lib CoreImage selector "vectorWithX:YZ::" (id as ptr, x as single, y as single, z as single) as ptr
		  #endif
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From iOSLibObject
		  // Constructor(AnId as Ptr) -- From iOSLibObject
		  Super.Constructor (VectorWithXYZ (ClassPtr, X, Y, Z))
		  RetainClassObject
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(X as Double, Y As Double, Z As Double, W As Double)
		  #if Target64Bit
		    declare function vectorWithXYZW lib CoreImage selector "vectorWithX:Y:Z:W:" (id as ptr, x as double, y as double, z as double, W As Double) as ptr
		  #elseif Target32Bit
		    declare function vectorWithXYZW lib CoreImage selector "vectorWithX:Y:Z:W:" (id as ptr, x as single, y as single, z as single, W as single) as ptr
		  #endif
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From iOSLibObject
		  // Constructor(AnId as Ptr) -- From iOSLibObject
		  Super.Constructor (VectorWithXYZW (ClassPtr, X, Y, Z, W))
		  RetainClassObject
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function MakefromPtr(aPtr as Ptr) As iOSLibCIVector
		  return if (aptr = nil, Nil, new iOSLibCIVector (aptr))
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  static mClassPtr as Ptr = NSClassFromString ("CIVector")
			  return mClassPtr
			End Get
		#tag EndGetter
		Protected Shared ClassPtr As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return getCount
			End Get
		#tag EndGetter
		Count As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function stringRepresentation lib CoreImage selector "stringRepresentation" (id as ptr) as CFStringRef
			  return stringRepresentation (id)
			End Get
		#tag EndGetter
		StringRepresentation As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target64Bit
			    declare function W lib CoreImage selector "W" (id as ptr) as double
			  #elseif Target32Bit
			    Declare function W lib CoreImage selector "W" (id as ptr) as single
			  #endif
			  return W (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if Target64Bit
			    declare sub setW lib CoreImage selector "setW:" (id as ptr, value as double)
			  #elseif Target32Bit
			    Declare Sub setW lib CoreImage selector "setW:" (id as ptr, value as single)
			  #endif
			  setW id, value
			End Set
		#tag EndSetter
		W As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target64Bit
			    declare function X lib CoreImage selector "X" (id as ptr) as double
			  #elseif Target32Bit
			    Declare function X lib CoreImage selector "X" (id as ptr) as single
			  #endif
			  return X (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if Target64Bit
			    declare sub setX lib CoreImage selector "setX:" (id as ptr, value as double)
			  #elseif Target32Bit
			    Declare Sub setX lib CoreImage selector "setX:" (id as ptr, value as single)
			  #endif
			  setX id, value
			End Set
		#tag EndSetter
		X As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target64Bit
			    declare function Y lib CoreImage selector "Y" (id as ptr) as double
			  #elseif Target32Bit
			    Declare function Y lib CoreImage selector "Y" (id as ptr) as single
			  #endif
			  return Y (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if Target64Bit
			    declare sub setY lib CoreImage selector "setY:" (id as ptr, value as double)
			  #elseif Target32Bit
			    Declare Sub setY lib CoreImage selector "setY:" (id as ptr, value as single)
			  #endif
			  setY id, value
			End Set
		#tag EndSetter
		Y As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target64Bit
			    declare function Z lib CoreImage selector "Z" (id as ptr) as double
			  #elseif Target32Bit
			    Declare function Z lib CoreImage selector "Z" (id as ptr) as single
			  #endif
			  return Z (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if Target64Bit
			    declare sub setZ lib CoreImage selector "setZ:" (id as ptr, value as double)
			  #elseif Target32Bit
			    Declare Sub setZ lib CoreImage selector "setZ:" (id as ptr, value as single)
			  #endif
			  setZ id, value
			End Set
		#tag EndSetter
		Z As Double
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Count"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
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
			Name="StringRepresentation"
			Group="Behavior"
			Type="Text"
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
		#tag ViewProperty
			Name="W"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="X"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Y"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Z"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
