#tag Class
Protected Class iOSLibSKTexture
Inherits ioslibobject
	#tag Method, Flags = &h21
		Private Shared Sub ClassCompletionBlock()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CompletionBlock()
		  if self <> nil then RaiseEvent TextureLoaded
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1021
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(imagename as CFStringRef)
		  Declare function textureWithImageNamed lib SpriteKit selector "textureWithImageNamed:" (id as ptr, name as CFStringRef) as ptr
		  super.Constructor (textureWithImageNamed (ClassPtr, imagename))
		  RetainClassObject
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(anImage as iOSLibImage)
		  Declare function textureWithImage lib SpriteKit selector "textureWithImage:" (id as ptr, name as ptr) as ptr
		  super.Constructor (textureWithImage (ClassPtr, animage.id))
		  RetainClassObject
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function MakefromPtr(aPtr as Ptr) As ioslibsktexture
		  return if (aptr = nil, nil, new iOSLibSKTexture(aptr))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Preload()
		  Declare sub preload lib SpriteKit selector "preloadWithCompletionHandler:" (id as ptr, completion as ptr)
		  dim completion as new iosblock (AddressOf CompletionBlock)
		  preload id, completion.Handle
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub PreloadTextures(textures as ioslibarray)
		  Declare sub preloadtextures lib SpriteKit selector "preloadTextures:withCompletionHandler:" (id as ptr, textures as ptr, completion as ptr)
		  dim block as new iOSBlock (AddressOf ClassCompletionBlock)
		  preloadtextures ( classptr, textures.id, block.Handle)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function TextureArray(paramarray Images() as Text) As iOSLibMutableArray
		  dim count as uinteger = Images.Ubound
		  dim myarray as new iOSLibMutableArray (count + 1)
		  for q as uinteger = 0 to count
		    myarray.Addobject new iOSLibSKTexture(images(q))
		  next
		  return myarray
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event TextureLoaded()
	#tag EndHook


	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  static mClassPtr as Ptr
			  if mClassPtr = nil then
			    if iOSLibSKView.SpriteKitEnabled then
			      mClassPtr  =  NSClassFromString ("SKTexture")
			    end if
			  end if
			  return mClassPtr
			End Get
		#tag EndGetter
		Protected Shared ClassPtr As Ptr
	#tag EndComputedProperty


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
