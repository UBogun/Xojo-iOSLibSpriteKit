#tag Class
Protected Class iOSLibSKFieldNode
Inherits iOSLibSKNode
	#tag Method, Flags = &h1021
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CustomField(Block as iOSBlock) As iOSLibSKFieldNode
		  Declare function customFieldWithEvaluationBlock lib SpriteKit selector "customFieldWithEvaluationBlock:" (id as ptr, block as ptr) as ptr
		  dim result as new iOSLibSKFieldNode (customFieldWithEvaluationBlock (ClassPtr, block.Handle))
		  result.RetainClassObject
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function DragField() As iOSLibSKFieldNode
		  Declare function dragField lib SpriteKit selector "dragField" (id as ptr) as ptr
		  dim result as new iOSLibSKFieldNode (dragField (ClassPtr))
		  result.RetainClassObject
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ElectricField() As iOSLibSKFieldNode
		  Declare function electricField lib SpriteKit selector "electricField" (id as ptr) as ptr
		  dim result as new iOSLibSKFieldNode (electricField (ClassPtr))
		  result.RetainClassObject
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function LinearGravityField(Direction as Vector_Float3) As iOSLibSKFieldNode
		  Declare function linearGravityFieldWithVector lib SpriteKit selector "linearGravityFieldWithVector:" (id as ptr, Direction as Vector_Float3) as ptr
		  dim result as new iOSLibSKFieldNode (linearGravityFieldWithVector (ClassPtr, Direction))
		  result.RetainClassObject
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function MagneticField() As iOSLibSKFieldNode
		  Declare function magneticField lib SpriteKit selector "magneticField" (id as ptr) as ptr
		  dim result as new iOSLibSKFieldNode (magneticField (ClassPtr))
		  result.RetainClassObject
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NoiseField(Smoothness as Double, AnimationSpeed as Double) As iOSLibSKFieldNode
		  #if Target64Bit
		    Declare function noiseFieldWithSmoothness lib SpriteKit selector "noiseFieldWithSmoothness:animationSpeed:" _
		    (id as ptr, Smoothness as double, AnimationSpeed as double) as ptr
		  #elseif Target32Bit
		    Declare function noiseFieldWithSmoothness lib SpriteKit selector "noiseFieldWithSmoothness:animationSpeed:" _
		    (id as ptr, Smoothness as single, AnimationSpeed as single) as ptr
		  #endif
		  dim result as new iOSLibSKFieldNode (noiseFieldWithSmoothness (ClassPtr, Smoothness, AnimationSpeed))
		  result.RetainClassObject
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function RadialGravityField() As iOSLibSKFieldNode
		  Declare function radialGravityField lib SpriteKit selector "radialGravityField" (id as ptr) as ptr
		  dim result as new iOSLibSKFieldNode (radialGravityField (ClassPtr))
		  result.RetainClassObject
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SKFieldForceEvaluatorBlockTemplate(Position as Vector_Float3, velocity as Vector_Float3, Mass as Single, Charge as Single, Time as Double) As single
		  // This is a template for the CustomField constructor. 
		  // Use it to calculate your field's force from the values the block gets and return it as a single value.
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function SpringField() As iOSLibSKFieldNode
		  Declare function springField lib SpriteKit selector "springField" (id as ptr) as ptr
		  dim result as new iOSLibSKFieldNode (springField (ClassPtr))
		  result.RetainClassObject
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function TurbulenceField(Smoothness as Double, AnimationSpeed as Double) As iOSLibSKFieldNode
		  #if Target64Bit
		    Declare function turbulenceFieldWithSmoothness lib SpriteKit selector "turbulenceFieldWithSmoothness:animationSpeed:" _
		    (id as ptr, Smoothness as double, AnimationSpeed as double) as ptr
		  #elseif Target32Bit
		    Declare function turbulenceFieldWithSmoothness lib SpriteKit selector "turbulenceFieldWithSmoothness:animationSpeed:" _
		    (id as ptr, Smoothness as single, AnimationSpeed as single) as ptr
		  #endif
		  dim result as new iOSLibSKFieldNode (turbulenceFieldWithSmoothness (ClassPtr, Smoothness, AnimationSpeed))
		  result.RetainClassObject
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function VelocityField(Texture as iOSLibSKTexture) As iOSLibSKFieldNode
		  Declare function velocityFieldWithTexture lib SpriteKit selector "velocityFieldWithTexture:" (id as ptr, texture as Ptr) as ptr
		  dim result as new iOSLibSKFieldNode (velocityFieldWithTexture (ClassPtr, texture.id))
		  result.RetainClassObject
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function VelocityField(Vector as Vector_Float3) As iOSLibSKFieldNode
		  Declare function velocityFieldWithVector lib SpriteKit selector "velocityFieldWithVector:" (id as ptr, Vector as Vector_Float3) as ptr
		  dim result as new iOSLibSKFieldNode (velocityFieldWithVector (ClassPtr, Vector))
		  result.RetainClassObject
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function VortexField() As iOSLibSKFieldNode
		  Declare function vortexField lib SpriteKit selector "vortexField" (id as ptr) as ptr
		  dim result as new iOSLibSKFieldNode (vortexField (ClassPtr))
		  result.RetainClassObject
		  Return result
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function animationSpeed lib SpriteKit selector "animationSpeed" (id as ptr) as single
			  return animationSpeed (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare Sub setAnimationSpeed lib SpriteKit selector "setAnimationSpeed:" (id as ptr, value as Single)
			  setAnimationSpeed(id, value)
			  
			End Set
		#tag EndSetter
		AnimationSpeed As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare Function categoryBitMask lib SpriteKit selector "categoryBitMask" (id as ptr) as UInt32
			  return categoryBitMask (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare sub setCategoryBitMask lib SpriteKit selector "setCategoryBitMask:" (id as ptr, value as UInt32)
			  setCategoryBitMask id, value
			End Set
		#tag EndSetter
		CategoryBitMask As UInt32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  static mClassPtr as Ptr
			  if mClassPtr = nil then
			    if iOSLibSKView.SpriteKitEnabled then
			      mClassPtr  =  NSClassFromString ("SKFieldNode")
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
			  declare function direction lib SpriteKit selector "direction" (id as ptr) as Vector_Float3
			  return direction (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare Sub setDirection lib SpriteKit selector "setDirection:" (id as ptr, value as Vector_Float3)
			  setDirection(id, value)
			  
			End Set
		#tag EndSetter
		Direction As Vector_Float3
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
			  Declare function isExclusive lib SpriteKit selector "isExclusive" (id as ptr) as Boolean
			  return isExclusive (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare sub setExclusive lib SpriteKit selector "setExclusive:" (id as ptr, value as Boolean)
			  setExclusive id, value
			End Set
		#tag EndSetter
		Exclusive As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function falloff lib SpriteKit selector "falloff" (id as ptr) as single
			  return falloff (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare Sub setFalloff lib SpriteKit selector "setFalloff:" (id as ptr, value as Single)
			  setFalloff(id, value)
			  
			End Set
		#tag EndSetter
		Falloff As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function minimumRadius lib SpriteKit selector "minimumRadius" (id as ptr) as Single
			  return minimumRadius (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare sub setMinimumRadius lib SpriteKit selector "setMinimumRadius:" (id as ptr, value as single)
			  setMinimumRadius id, value
			End Set
		#tag EndSetter
		MinimumRadius As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function smoothness lib SpriteKit selector "smoothness" (id as ptr) as single
			  return smoothness (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare Sub setSmoothness lib SpriteKit selector "setSmoothness:" (id as ptr, value as Single)
			  setSmoothness(id, value)
			  
			End Set
		#tag EndSetter
		Smoothness As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function strength lib SpriteKit selector "strength" (id as ptr) as Single
			  return strength (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare sub setStrength lib SpriteKit selector "setStrength:" (id as ptr, value as single)
			  setStrength id, value
			End Set
		#tag EndSetter
		Strength As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function texture lib SpriteKit selector "texture" (id as ptr) as ptr
			  return iOSLibSKTexture.MakefromPtr (texture (id))
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare Sub setTexture lib SpriteKit selector "setTexture:" (id as ptr, value as ptr)
			  setTexture (id, value.id)
			  
			End Set
		#tag EndSetter
		Texture As iOSLibSKTexture
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="DebugDescription"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ExecutesActions"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasOwnership"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Hidden"
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
			Name="Paused"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Speed"
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
			Name="UserInteractionEnabled"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="XScale"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="YScale"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ZPosition"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ZRotation"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
