#tag Class
Protected Class OSLibAVQueuePlayer
Inherits iOSLibAVPlayer
	#tag Method, Flags = &h0
		Sub AdvanceToNextItem()
		  Declare sub advanceToNextItem lib AVFoundation selector "advanceToNextItem:" (id as ptr)
		  advanceToNextItem id
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AppendItem(Item As iOSLibAVPlayerItem)
		  InsertItem (item, NIL)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CanAppendItem(Item As iOSLibAVPlayerItem) As Boolean
		  return CanInsertItem (item, NIL)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CanInsertItem(Item As iOSLibAVPlayerItem, AfterItem as iOSLibAVPlayerItem) As Boolean
		  Declare function canInsertItem lib AVFoundation selector "canInsertItem:afterItem:" (id as ptr, item as ptr, afterItem as Ptr) as boolean
		  return canInsertItem ( id, item.id, if (AfterItem = Nil, Nil, AfterItem.id))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1021
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(anArray as iOSLibArray)
		  declare function initWithItems lib AVFoundation selector "initWithItems:" (id as ptr, items as ptr) as ptr
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor(URLName as CFStringRef) -- From iOSLibAVPlayer
		  // Constructor(aURL as iOSLibURL) -- From iOSLibAVPlayer
		  // Constructor() -- From iOSLibObject
		  // Constructor(AnId as Ptr) -- From iOSLibObject
		  Super.Constructor (initWithItems(Alloc(classptr), anarray.id))
		  mHasOwnership = true
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(paramarray anArray() as iOSLibAVPlayerItem)
		  dim myarray as iOSLibMutableArray = iOSLibMutableArray.fromiOSLibObjects (anArray)
		  Constructor (myarray)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertItem(Item As iOSLibAVPlayerItem, AfterItem as iOSLibAVPlayerItem)
		  Declare sub insertItem lib AVFoundation selector "insertItem:afterItem:" (id as ptr, item as ptr, afterItem as Ptr)
		  insertItem id, item.id, if (AfterItem = Nil, Nil, AfterItem.id)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveAllItems()
		  Declare Sub removeAllItems lib AVFoundation selector "removeAllItems" (id as ptr) 
		  removeAllItems (id)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveItem(Item As iOSLibAVPlayerItem)
		  Declare sub removeItem lib AVFoundation selector "removeItem:" (id as ptr, item as ptr)
		  removeItem id, item.id
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  static mClassPtr as Ptr = NSClassFromString ("AVQueuePlayer")
			  return mClassPtr
			End Get
		#tag EndGetter
		Protected Shared ClassPtr As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function items lib AVFoundation selector "items" (id as ptr) as Ptr
			  return iOSLibArray.makefromPtr (items (id))
			End Get
		#tag EndGetter
		Items As iOSLibArray
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="actionAtItemEnd"
			Group="Behavior"
			Type="AVPlayerActionAtItemEnd"
			EditorType="Enum"
			#tag EnumValues
				"0 - Advance"
				"1 - Pause"
				"2 - None"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutomaticMediaSelection"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ClosedCaption"
			Group="Behavior"
			Type="Boolean"
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
			Name="Muted"
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
			Name="Rate"
			Group="Behavior"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Status"
			Group="Behavior"
			Type="AVPlayerStatus"
			EditorType="Enum"
			#tag EnumValues
				"0 - Unknown"
				"1 - ReadyToPlay"
				"2 - Failed"
			#tag EndEnumValues
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
			Name="Volume"
			Group="Behavior"
			Type="Single"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
