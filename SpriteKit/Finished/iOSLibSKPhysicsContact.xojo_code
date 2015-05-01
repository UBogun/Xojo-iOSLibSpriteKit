#tag Class
Protected Class iOSLibSKPhysicsContact
Inherits iOSLibObject
	#tag Method, Flags = &h1021
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare Function bodyA lib SpriteKit selector "bodyA" (id as ptr) as Ptr
			  return iOSLibSKPhysicsBody.MakeFromPtr (bodya(id))
			  
			End Get
		#tag EndGetter
		BodyA As iOSLibSKPhysicsBody
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare Function bodyB lib SpriteKit selector "bodyB" (id as ptr) as Ptr
			  return iOSLibSKPhysicsBody.MakeFromPtr (bodyB(id))
			  
			End Get
		#tag EndGetter
		BodyB As iOSLibSKPhysicsBody
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target64Bit
			    declare function collisionImpulse lib SpriteKit selector "collisionImpulse" (id as ptr) as double
			  #elseif Target32Bit
			    declare function collisionImpulse lib SpriteKit selector "collisionImpulse" (id as ptr) as single
			  #endif
			  
			  return collisionImpulse(id)
			  
			End Get
		#tag EndGetter
		CollisionImpulse As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target64Bit
			    declare function contactNormal lib SpriteKit selector "contactNormal" (id as ptr) as CGVector
			    return contactNormal (id)
			  #elseif Target32Bit
			    declare function contactNormal lib SpriteKit selector "contactNormal" (id as ptr) as CGVector32Bit
			    return contactNormal(id).toCGVector
			  #endif
			  
			End Get
		#tag EndGetter
		ContactNormal As CGVector
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target64Bit
			    declare function contactPoint lib SpriteKit selector "contactPoint" (id as ptr) as NSPoint
			    return contactPoint (id)
			  #elseif Target32Bit
			    declare function contactPoint lib SpriteKit selector "contactPoint" (id as ptr) as NSPoint32Bit
			    return contactPoint(id).toNSPoint
			  #endif
			  
			End Get
		#tag EndGetter
		ContactPoint As NSPoint
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="CollisionImpulse"
			Group="Behavior"
			Type="Double"
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
