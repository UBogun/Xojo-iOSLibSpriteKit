#tag Class
Protected Class iOSLibSKTextureAtlas
Inherits ioslibobject
	#tag Method, Flags = &h21
		Private Shared Sub ClassCompletionBlock()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CompletionBlock()
		  if self <> nil then RaiseEvent TextureAtlasLoaded
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1021
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(atlasname as CFStringRef)
		  Declare function atlasNamed lib SpriteKit selector "atlasNamed:" (id as ptr, name as CFStringRef) as ptr
		  super.Constructor (atlasNamed (ClassPtr, atlasname))
		  RetainClassObject
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(AtlasDict as iOSLibDictionary)
		  Declare function atlasWithDictionary lib SpriteKit selector "atlasWithDictionary:" (id as ptr, dict as ptr) as ptr
		  super.Constructor (atlasWithDictionary (ClassPtr, AtlasDict.id))
		  RetainClassObject
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Preload()
		  Declare sub preload lib SpriteKit selector "preloadWithCompletionHandler:" (id as ptr, completion as ptr)
		  dim completion as new iosblock (AddressOf CompletionBlock)
		  preload id, completion.Handle
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub PreloadTextureAtlases(atlases as ioslibarray)
		  Declare sub preloadTextureAtlases lib SpriteKit selector "preloadTextureAtlases:withCompletionHandler:" (id as ptr, atlases as ptr, completion as ptr)
		  dim block as new iOSBlock (AddressOf ClassCompletionBlock)
		  preloadTextureAtlases ( classptr, atlases.id, block.Handle)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function textureNamed(TextureName as CFStringRef) As iOSLibSKTexture
		  Declare function TextureNamed lib SpriteKit selector "textureNamed:" (id as ptr, name as cfstringref) as ptr
		  return ioslibsktexture.MakeFromPtr (TextureNamed(id, TextureName))
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event TextureAtlasLoaded()
	#tag EndHook


	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  static mClassPtr as Ptr
			  if mClassPtr = nil then
			    if iOSLibSKView.SpriteKitEnabled then
			      mClassPtr  =  NSClassFromString ("SKTextureAtlas")
			    end if
			  end if
			  return mClassPtr
			End Get
		#tag EndGetter
		Protected Shared ClassPtr As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function textureNames lib SpriteKit selector "textureNames" (id as ptr) as Ptr
			  return iOSLibArray.MakeFromPtr (textureNames(id))
			End Get
		#tag EndGetter
		TextureNames As ioslibarray
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
