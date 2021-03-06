#tag Class
Protected Class iOSLibSKConstraint
Inherits iOSLibObject
	#tag Method, Flags = &h1021
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Distance(Node As iOSLibSKNode, Distance As iOSLibSKRange) As iOSLibSKConstraint
		  Declare function distancetoNode lib SpriteKit selector "distance:toNode:" (id as ptr, distance as ptr, node as ptr) as ptr
		  dim result as  new iOSLibSKConstraint  (distancetoNode(ClassPtr, distance.id, node.id))
		  result.RetainClassObject
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Distance(aPoint As NSPoint, Node as ioslibsknode, Distance As iOSLibSKRange) As iOSLibSKConstraint
		  dim result as   iOSLibSKConstraint
		  #if Target64Bit
		    Declare function distanceToPointinNode lib SpriteKit selector "distance:ToPoint:inNode:" (id as ptr, distance as ptr,  aPoint as NSPoint, node as ptr) as ptr
		    result =  new iOSLibSKConstraint  (distanceToPointinNode(ClassPtr, Distance.id, aPoint, node.id))
		  #elseif Target32Bit
		    Declare function distanceToPointinNode lib SpriteKit selector "distance:ToPoint:inNode:" (id as ptr, distance as ptr,  aPoint as NSPoint32Bit, node as ptr) as ptr
		    result =  new iOSLibSKConstraint  (distanceToPointinNode(ClassPtr, Distance.id, aPoint.toNSPoint32, node.id))
		  #endif
		  result.RetainClassObject
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Distance(aPoint As NSPoint, Distance As iOSLibSKRange) As iOSLibSKConstraint
		  dim result as   iOSLibSKConstraint
		  #if Target64Bit
		    Declare function distanceToPoint lib SpriteKit selector "distance:ToPoint:" (id as ptr, distance as ptr,  aPoint as NSPoint) as ptr
		    result =  new iOSLibSKConstraint  (distanceToPoint(ClassPtr, Distance.id, aPoint))
		  #elseif Target32Bit
		    Declare function distanceToPoint lib SpriteKit selector "distance:ToPoint:" (id as ptr, distance as ptr,  aPoint as NSPoint32Bit) as ptr
		    result =  new iOSLibSKConstraint  (distanceToPoint(ClassPtr, Distance.id, aPoint.toNSPoint32))
		  #endif
		  result.RetainClassObject
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function OrientToNode(Node As iOSLibSKNode) As iOSLibSKConstraint
		  return OrientToNode (node, iOSLibSKRange.WithConstantValue(0))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function OrientToNode(Node As iOSLibSKNode, OffsetRadians As iOSLibSKRange) As iOSLibSKConstraint
		  Declare function orientToNode lib SpriteKit selector "orientToNode:offset:" (id as ptr, node as ptr, offset as ptr) as ptr
		  dim result as  new iOSLibSKConstraint  (orientToNode(ClassPtr, node.id, OffsetRadians.id))
		  result.RetainClassObject
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function OrientToPoint(aPoint As NSPoint) As iOSLibSKConstraint
		  return OrientToPoint (aPoint, iOSLibSKRange.WithConstantValue(0))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function OrientToPoint(aPoint As NSPoint, Node as iosLibSKNode) As iOSLibSKConstraint
		  return OrientToPoint (aPoint, Node, iOSLibSKRange.WithConstantValue(0))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function OrientToPoint(aPoint As NSPoint, Node as iosLibSKNode, OffsetRadians As iOSLibSKRange) As iOSLibSKConstraint
		  dim result as   iOSLibSKConstraint
		  #if Target64Bit
		    Declare function orientToPointinNode lib SpriteKit selector "orientToPoint:inNode:offset:" (id as ptr, aPoint as NSPoint, node as ptr, offset as ptr) as ptr
		    result =  new iOSLibSKConstraint  (orientToPointinNode(ClassPtr, aPoint, node.id, OffsetRadians.id))
		  #elseif Target32Bit
		    Declare function orientToPointinNode lib SpriteKit selector "orientToPoint:inNode:offset:" (id as ptr, aPoint as NSPoint32Bit, node as ptr, offset as ptr) as ptr
		    result =  new iOSLibSKConstraint  (orientToPointinNode(ClassPtr, aPoint.toNSPoint32, node.id, OffsetRadians.id))
		  #endif
		  result.RetainClassObject
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function OrientToPoint(aPoint As NSPoint, OffsetRadians As iOSLibSKRange) As iOSLibSKConstraint
		  dim result as   iOSLibSKConstraint
		  #if Target64Bit
		    Declare function orientToPoint lib SpriteKit selector "orientToPoint:offset:" (id as ptr, aPoint as NSPoint, offset as ptr) as ptr
		    result =  new iOSLibSKConstraint  (orientToPoint(ClassPtr, aPoint, OffsetRadians.id))
		  #elseif Target32Bit
		    Declare function orientToPoint lib SpriteKit selector "orientToPoint:offset:" (id as ptr, aPoint as NSPoint32Bit, offset as ptr) as ptr
		    result =  new iOSLibSKConstraint  (orientToPoint(ClassPtr, aPoint.toNSPoint32, OffsetRadians.id))
		  #endif
		  result.RetainClassObject
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Position(XRange As iOSLibSKRange, YRange As iOSLibSKRange) As iOSLibSKConstraint
		  Declare function positionXY lib SpriteKit selector "positionX:Y:" (id as ptr, postionx as ptr, positiony as ptr) as ptr
		  dim result as  new iOSLibSKConstraint  (positionXY(ClassPtr, xRange.id, YRange.id))
		  result.RetainClassObject
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function PositionX(XRange As iOSLibSKRange) As iOSLibSKConstraint
		  Declare function positionX lib SpriteKit selector "positionX:" (id as ptr, postion as ptr) as ptr
		  dim result as  new iOSLibSKConstraint  (positionX(ClassPtr, XRange.id))
		  result.RetainClassObject
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function PositionY(YRange As iOSLibSKRange) As iOSLibSKConstraint
		  Declare function positionY lib SpriteKit selector "positionY:" (id as ptr, postion as ptr) as ptr
		  dim result as  new iOSLibSKConstraint  (positionY(ClassPtr, YRange.id))
		  result.RetainClassObject
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ZRotation(ZRange As iOSLibSKRange) As iOSLibSKConstraint
		  Declare function zRotation lib SpriteKit selector "zRotation:" (id as ptr, postion as ptr) as ptr
		  dim result as  new iOSLibSKConstraint  (zRotation(ClassPtr, ZRange.id))
		  result.RetainClassObject
		  return result
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  static mClassPtr as Ptr
			  if mClassPtr = nil then
			    if iOSLibSKView.SpriteKitEnabled then
			      mClassPtr  =  NSClassFromString ("SKConstraint")
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
			  Declare function enabled lib SpriteKit selector "enabled" (id as ptr) as Boolean
			  return enabled (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare sub setEnabled lib SpriteKit selector "setEnabled:" (id as ptr, value as Boolean)
			  setenabled id, value
			End Set
		#tag EndSetter
		Enabled As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function referenceNode lib SpriteKit selector "referenceNode" (id as ptr) as ptr
			  return iOSLibSKNode.MakeFromPtr (referenceNode(id))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setReferenceNode lib SpriteKit selector "setReferenceNode:" (id as ptr, value as ptr)
			  setReferenceNode id, value.id
			End Set
		#tag EndSetter
		ReferenceNode As iOSLibSKNode
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="DebugDescription"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Group="Behavior"
			Type="Boolean"
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
