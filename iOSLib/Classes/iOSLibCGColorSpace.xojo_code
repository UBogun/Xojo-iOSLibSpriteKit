#tag Class
Protected Class iOSLibCGColorSpace
Inherits iOSLibCFObject
	#tag ExternalMethod, Flags = &h1
		Protected Declare Function CGColorSpaceCopyName Lib CoreGraphics (aCFTypeRef as Ptr) As CFStringRef
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function CGColorSpaceCreateDeviceRGB Lib CoreGraphics () As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function CGColorSpaceCreateWithName Lib CoreGraphics (aName as cfstringref) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function CGColorSpaceGetBaseColorSpace Lib CoreGraphics (aCFTypeRef as Ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function CGColorSpaceGetColorTableCount Lib CoreGraphics (aCFTypeRef as Ptr) As UInteger
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function CGColorSpaceGetModel Lib CoreGraphics (aCFTypeRef as Ptr) As CGColorSpaceModel
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function CGColorSpaceGetNumberOfComponents Lib CoreGraphics (aCFTypeRef as Ptr) As UInteger
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function CGColorSpaceGetTypeID Lib CoreGraphics (aCFTypeRef as Ptr) As UInteger
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Sub CGColorSpaceRelease Lib CoreGraphics (aCFTypeRef as Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function CGColorSpaceRetain Lib CoreGraphics (aCFTypeRef as Ptr) As Ptr
	#tag EndExternalMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  Constructor (CGColorSpaceCreateDeviceRGB)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MakeFromPtr(aPTr as Ptr) As iOSLibCGColorSpace
		  return if (aptr <> NIL, new iOSLibCGColorSpace (aptr), NIL)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Release()
		  CGColorSpaceRelease mCFTypeRef
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Retain()
		  mCFTypeRef = CGColorSpaceRetain( mCFTypeRef )
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim myptr as ptr = CGColorSpaceGetBaseColorSpace (mcfTypeRef)
			  return if (myptr <> NIL, new iOSLibCGColorSpace (myptr), NIL)
			End Get
		#tag EndGetter
		BaseColorSpace As iOSLibCGColorSpace
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return CGColorSpaceGetModel (mcftypeRef)
			End Get
		#tag EndGetter
		ColorSpaceModel As CGColorSpaceModel
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return CGColorSpaceGetColorTableCount (mCFTypeRef)
			End Get
		#tag EndGetter
		ColorTableCount As UInteger
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return CGColorSpaceCopyName ( mCFTypeRef )
			End Get
		#tag EndGetter
		Name As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return CGColorSpaceGetNumberOfComponents (mcftypeRef)
			End Get
		#tag EndGetter
		NumberOfComponents As UInteger
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return CGColorSpaceGetTypeID (mCFTypeRef)
			End Get
		#tag EndGetter
		TypeID As UInteger
	#tag EndComputedProperty


	#tag Constant, Name = kCGColorSpaceSRGB, Type = Text, Dynamic = False, Default = \"CGColorSpaceSRGB", Scope = Public
	#tag EndConstant


	#tag Enum, Name = CGColorSpaceModel, Type = Int32, Flags = &h0
		Monochrome
		  RGB
		  CMYK
		  Lab
		  DeviceN
		  Indexed
		Pattern
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="CFTypeDescription"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColorSpaceModel"
			Group="Behavior"
			Type="CGColorSpaceModel"
			EditorType="Enum"
			#tag EnumValues
				"0 - Monochrome"
				"1 - RGB"
				"2 - CMYK"
				"3 - Lab"
				"4 - DeviceN"
				"5 - Indexed"
				"6 - Pattern"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
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
			Name="isNIL"
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
			Name="RetainCount"
			Group="Behavior"
			Type="Integer"
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
