#tag Class
Protected Class iOSLibSKPhysicsJointSpring
Inherits iOSLibSKPhysicsJoint
	#tag Method, Flags = &h1000
		Sub Constructor(BodyA As iOSLibSKPhysicsBody, BodyB as iOSLibSKPhysicsBody, AnchorA as NSPoint, AnchorB as NSPoint)
		  #if Target64Bit
		    declare function jointWithBodyA lib SpriteKit selector "jointWithBodyA:bodyB:anchorA:anchorB:" _
		    (id as ptr, bodyA as ptr, bodyB as ptr, anchorA as nspoint, anchorB as nspoint) as ptr
		    super.Constructor (jointWithBodyA(ClassPtr, bodyA.id, Bodyb.id, AnchorA, anchorB))
		  #elseif Target32Bit
		    declare function jointWithBodyA lib SpriteKit selector "jointWithBodyA:bodyB:anchorA:anchorB:" _
		    (id as ptr, bodyA as ptr, bodyB as ptr, anchorA as NSPoint32Bit, anchorB as NSPoint32Bit) as ptr
		    super.Constructor (jointWithBodyA(ClassPtr, bodyA.id, Bodyb.id, AnchorA.toNSPoint32, AnchorB.toNSPoint32))
		  #endif
		  RetainClassObject
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  static mClassPtr as Ptr
			  if mClassPtr = nil then
			    if iOSLibSKView.SpriteKitEnabled then
			      mClassPtr  =  NSClassFromString ("SKPhysicsJointSpring")
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
			  #if Target64Bit
			    declare function damping lib SpriteKit selector "damping" (id as ptr) as Double
			  #elseif Target32Bit
			    declare function damping lib SpriteKit selector "damping" (id as ptr) as single
			  #endif
			  return damping (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if Target64Bit
			    declare Sub setDamping lib SpriteKit selector "setDamping:" (id as ptr, value as Double)
			  #elseif Target32Bit
			    declare Sub setDamping lib SpriteKit selector "setDamping:" (id as ptr, value as Single)
			  #endif
			  setDamping (id, value)
			  
			End Set
		#tag EndSetter
		Damping As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target64Bit
			    declare function frequency lib SpriteKit selector "frequency" (id as ptr) as Double
			  #elseif Target32Bit
			    declare function frequency lib SpriteKit selector "frequency" (id as ptr) as single
			  #endif
			  return frequency (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if Target64Bit
			    declare Sub setFrequency lib SpriteKit selector "setFrequency:" (id as ptr, value as Double)
			  #elseif Target32Bit
			    declare Sub setFrequency lib SpriteKit selector "setFrequency:" (id as ptr, value as Single)
			  #endif
			  setFrequency (id, value)
			  
			End Set
		#tag EndSetter
		Frequency As Double
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Damping"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DebugDescription"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Frequency"
			Group="Behavior"
			Type="Double"
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
