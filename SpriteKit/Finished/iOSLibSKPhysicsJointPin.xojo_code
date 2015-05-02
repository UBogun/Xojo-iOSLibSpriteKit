#tag Class
Protected Class iOSLibSKPhysicsJointPin
Inherits iOSLibSKPhysicsJoint
	#tag Method, Flags = &h1000
		Sub Constructor(BodyA As iOSLibSKPhysicsBody, BodyB as iOSLibSKPhysicsBody, Anchor as NSPoint)
		  #if Target64Bit
		    declare function jointWithBodyA lib SpriteKit selector "jointWithBodyA:bodyB:anchor:" (id as ptr, bodyA as ptr, bodyB as ptr, anchor as nspoint) as ptr
		    super.Constructor (jointWithBodyA(ClassPtr, bodyA.id, Bodyb.id, Anchor))
		  #elseif Target32Bit
		    declare function jointWithBodyA lib SpriteKit selector "jointWithBodyA:bodyB:anchor:" (id as ptr, bodyA as ptr, bodyB as ptr, anchor as NSPoint32Bit) as ptr
		    super.Constructor (jointWithBodyA(ClassPtr, bodyA.id, Bodyb.id, Anchor.toNSPoint32))
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
			      mClassPtr  =  NSClassFromString ("SKPhysicsJointPin")
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
			  Declare Function shouldEnableLimits lib SpriteKit selector "shouldEnableLimits" (id as ptr) as Boolean
			  return shouldEnableLimits (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub setShouldEnableLimits lib SpriteKit selector "setShouldEnableLimits:" (id as ptr, value as Boolean)
			  setShouldEnableLimits id, value
			End Set
		#tag EndSetter
		EnableLimits As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target64Bit
			    declare function frictionTorque lib SpriteKit selector "frictionTorque" (id as ptr) as Double
			  #elseif Target32Bit
			    declare function frictionTorque lib SpriteKit selector "frictionTorque" (id as ptr) as single
			  #endif
			  return frictionTorque (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if Target64Bit
			    declare Sub setFrictionTorque lib SpriteKit selector "setFrictionTorque:" (id as ptr, value as Double)
			  #elseif Target32Bit
			    declare Sub setFrictionTorque lib SpriteKit selector "setFrictionTorque" (id as ptr, value as Single)
			  #endif
			  setFrictionTorque(id, value)
			  
			End Set
		#tag EndSetter
		FrictionTorque As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target64Bit
			    declare function lowerAngleLimit lib SpriteKit selector "lowerAngleLimit" (id as ptr) as Double
			  #elseif Target32Bit
			    declare function lowerAngleLimit lib SpriteKit selector "lowerAngleLimit" (id as ptr) as single
			  #endif
			  return lowerAngleLimit (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if Target64Bit
			    declare Sub setLowerAngleLimit lib SpriteKit selector "setLowerAngleLimit:" (id as ptr, value as Double)
			  #elseif Target32Bit
			    declare Sub setLowerAngleLimit lib SpriteKit selector "setLowerAngleLimit:" (id as ptr, value as Single)
			  #endif
			  setLowerAngleLimit (id, value)
			  
			End Set
		#tag EndSetter
		LowerAngleLimit As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target64Bit
			    declare function rotationSpeed lib SpriteKit selector "rotationSpeed" (id as ptr) as Double
			  #elseif Target32Bit
			    declare function rotationSpeed lib SpriteKit selector "rotationSpeed" (id as ptr) as single
			  #endif
			  return rotationSpeed (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if Target64Bit
			    declare Sub setRotationSpeed lib SpriteKit selector "setRotationSpeed:" (id as ptr, value as Double)
			  #elseif Target32Bit
			    declare Sub setRotationSpeed lib SpriteKit selector "setRotationSpeed:" (id as ptr, value as Single)
			  #endif
			  setRotationSpeed (id, value)
			  
			End Set
		#tag EndSetter
		RotationSpeed As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target64Bit
			    declare function upperAngleLimit lib SpriteKit selector "upperAngleLimit" (id as ptr) as Double
			  #elseif Target32Bit
			    declare function upperAngleLimit lib SpriteKit selector "upperAngleLimit" (id as ptr) as single
			  #endif
			  return upperAngleLimit (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if Target64Bit
			    declare Sub setUpperAngleLimit lib SpriteKit selector "setUpperAngleLimit:" (id as ptr, value as Double)
			  #elseif Target32Bit
			    declare Sub setUpperAngleLimit lib SpriteKit selector "setUpperAngleLimit:" (id as ptr, value as Single)
			  #endif
			  setUpperAngleLimit (id, value)
			  
			End Set
		#tag EndSetter
		UpperAngleLimit As Double
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="DebugDescription"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EnableLimits"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FrictionTorque"
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
			Name="LowerAngleLimit"
			Group="Behavior"
			Type="Double"
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
			Name="RotationSpeed"
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
		#tag ViewProperty
			Name="UpperAngleLimit"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
