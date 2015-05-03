#tag Class
Protected Class iOSLibSKPhysicsJointFixed
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
			      mClassPtr  =  NSClassFromString ("SKPhysicsJointFixed")
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
