#tag Class
Protected Class iOSLibAttributedString
Inherits ioslibobject
	#tag Method, Flags = &h0
		Function AttributesAtIndex(index as UInteger) As iOSLibDictionary
		  declare function attributesAtIndex lib UIKit selector "attributesAtIndex:effectiveRange:" (id as ptr,  rangeptr as ptr) as Ptr
		  dim result as ptr = attributesAtIndex(id, nil)
		  return iOSLibDictionary.MakeFromPtr (result)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1021
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(astring as CFStringRef)
		  declare function initWithString lib UIKit selector "initWithString:" (id as ptr, astring as CFStringRef) as ptr
		  super.Constructor (initWithString (alloc(classptr), astring))
		  mHasOwnership = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(astring as cfstringref, Fontname as CFStringRef)
		  declare function initWithStringattributes lib UIKit selector "initWithString:attributes:" (id as ptr, astring as CFStringRef, attDict as ptr) as ptr
		  dim AttDict as new iOSLibMutableDictionary (1)
		  dim offset as double = 0.3
		  AttDict.SetObjectForKey (StringAttributes.Value(BasellneOffset), new iOSLibNumber (offset))
		  super.Constructor (initWithStringattributes (alloc(classptr), astring, AttDict.id))
		  mHasOwnership = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(astring as iOSLibAttributedString)
		  declare function initWithAttributedString lib UIKit selector "initWithAttributedString:" (id as ptr, astring as Ptr) as ptr
		  super.Constructor (initWithAttributedString (alloc(classptr), astring.id))
		  mHasOwnership = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Draw(aPoint as NSPoint)
		  #if Target64Bit
		    declare Sub drawAtPoint lib UIKit selector "drawAtPoint:" (id as ptr, value as NSPoint)
		    drawAtPoint (id, aPoint)
		  #elseif Target32Bit
		    declare Sub drawAtPoint lib UIKit selector "drawAtPoint:" (id as ptr, value as NSPoint32Bit)
		    drawAtPoint (id, aPoint.tonspoint32)
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Draw(ARect as NSRect)
		  // iOSLibCGContext.UIGraphicsBeginImageContext (arect.Size_)
		  #if Target64Bit
		    declare Sub drawInRect lib UIKit selector "drawInRect:" (id as ptr, value as NSRect)
		    drawInRect (id, aRect)
		  #elseif Target32Bit
		    declare Sub drawInRect lib UIKit selector "drawInRect:" (id as ptr, value as NSRect32Bit)
		    drawInRect (id, aRect.toNSRect32)
		  #endif
		  // iOSLibCGContext.UIGraphicsEndImageContext
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Draw(ARect as NSRect, options as iOSLibStringDrawingOptions, byref context as iOSLibStringDrawingContext)
		  #if Target64Bit
		    declare Sub drawWithRect lib UIKit selector "drawWithRect:options:context:" (id as ptr, value as NSRect, options as integer, context as ptr)
		    drawWithRect (id, aRect, options.id, context.id)
		  #elseif Target32Bit
		    declare Sub drawWithRect lib UIKit selector "drawWithRect:options:context:" (id as ptr, value as NSRect32Bit, options as integer, context as ptr)
		    drawWithRect (id, aRect.toNSRect32, options.Id, context.id)
		  #endif
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  static mClassPtr as Ptr = NSClassFromString ("NSAttributedString")
			  return mClassPtr
			End Get
		#tag EndGetter
		Protected Shared ClassPtr As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function length lib UIKit selector "length" (id as ptr) as UInteger
			  return length (id)
			End Get
		#tag EndGetter
		Length As UInteger
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return getSize
			End Get
		#tag EndGetter
		Size_ As NSSize
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  static mStringAttributes as Dictionary
			  if mStringAttributes = nil then
			    mStringAttributes = new Dictionary
			    mStringAttributes.Value (FontName) = SystemConstantName ("NSFontAttributeName", UIKitPath)
			    mStringAttributes.value (BasellneOffset) = SystemConstantName ("NSBaselineOffsetAttributeName", UIKitPath)
			  end if
			  return mStringAttributes
			End Get
		#tag EndGetter
		Shared StringAttributes As Dictionary
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function string_ lib UIKit selector "string" (id as ptr) as CFStringRef
			  return string_ (id)
			End Get
		#tag EndGetter
		toText As Text
	#tag EndComputedProperty


	#tag Constant, Name = BasellneOffset, Type = Text, Dynamic = False, Default = \"BaselineOffset", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FontName, Type = Text, Dynamic = False, Default = \"Font", Scope = Public
	#tag EndConstant


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
		#tag ViewProperty
			Name="toText"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
