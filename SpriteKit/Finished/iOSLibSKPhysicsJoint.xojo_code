#tag Class
Protected Class iOSLibSKPhysicsJoint
Inherits iOSLibObject
	#tag Method, Flags = &h1021
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function bodyA  lib SpriteKit selector "bodyA" (id as ptr) as ptr
			  return iOSLibSKPhysicsBody.MakeFromPtr (bodyA(id))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setBodyA  lib SpriteKit selector "setBodyA:" (id as ptr, value as ptr)
			  setBodyA id, value.id
			End Set
		#tag EndSetter
		BodyA As iOSLibSKPhysicsBody
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function bodyB  lib SpriteKit selector "bodyB" (id as ptr) as ptr
			  return iOSLibSKPhysicsBody.MakeFromPtr (bodyB(id))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setBodyB  lib SpriteKit selector "setBodyB:" (id as ptr, value as ptr)
			  setBodyB id, value.id
			End Set
		#tag EndSetter
		BodyB As iOSLibSKPhysicsBody
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target64Bit
			    declare Function reactionForce lib SpriteKit selector "reactionForce" (id as ptr) as CGVector
			    return reactionForce (id)
			  #elseif Target32Bit
			    declare Function reactionForce lib SpriteKit selector "reactionForce" (id as ptr) as CGVector32Bit
			    return reactionForce(id).toCGVector
			  #endif
			  
			End Get
		#tag EndGetter
		ReactionForce As CGVector
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target64Bit
			    declare function reactionTorque lib SpriteKit selector "reactionTorque" (id as ptr) as Double
			  #elseif Target32Bit
			    declare function reactionTorque lib SpriteKit selector "reactionTorque" (id as ptr) as Single
			  #endif
			  return reactionTorque (id)
			  
			End Get
		#tag EndGetter
		ReactionTorque As Double
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
			Name="ReactionTorque"
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
