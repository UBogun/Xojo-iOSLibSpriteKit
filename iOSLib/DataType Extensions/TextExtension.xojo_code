#tag Module
Protected Module TextExtension
	#tag Method, Flags = &h0
		Function fromCString(c as cstring) As cfstringref
		  return text.FromCString (c, StandardTextEncoding)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function fromCString(extends t as text, c as cstring) As cfstringref
		  return text.FromCString (c, StandardTextEncoding)
		  #pragma unused t
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function fromPtr(aPtr as Ptr) As cfstringref
		  if aptr <> NIL then
		    dim mb as new xojo.Core.MemoryBlock(aptr)
		    if mb.Size > 0 then
		      dim result as CString =  mb.CStringValue(0)
		      return TextExtension.FromCString (result)
		    end if
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function toColor(extends aColorString as Text) As Color
		  if aColorString.Length < 8 then return color.clear
		  dim value as text = aColorString.Left(2)
		  if value <> "&c" then return color.clear
		  value = aColorString.Mid (2,2)
		  dim red as integer = Integer.FromHex (value)
		  dim green as integer = integer.FromHex (aColorString.mid (4,2))
		  dim blue as integer = integer.FromHex (aColorString.mid (6,2))
		  dim alpha as integer = if (aColorString.Length >= 10, integer.FromHex (aColorString.mid (8,2)), 0)
		  return color.rgba (red, green, blue, alpha)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function toCommaList(extends t() as Text) As Text
		  if t.Ubound > -1 then
		    dim result as text = t(0)
		    if t.Ubound > 0 then
		      for q as UInteger = 1 to t.Ubound
		        result = result +", "+t(q)
		      next
		    end if
		    return result
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function toCString(extends t as text) As cstring
		  return t.ToCString (StandardTextEncoding)
		End Function
	#tag EndMethod


	#tag ViewBehavior
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
End Module
#tag EndModule
