#tag Class
Protected Class iOSLibCAEmitterCell
Inherits iOSLibCAMediaTimingObject
	#tag Method, Flags = &h1000
		Sub Constructor()
		  Declare function emitterCell lib UIKit selector "emitterCell" (id as ptr) as ptr
		  
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From iOSLibCAMediaTimingFunction
		  // Constructor(c1x as single, c1y as single, c2x as single, c2y as single) -- From iOSLibCAMediaTimingFunction
		  // Constructor(Timing as TimingFunction) -- From iOSLibCAMediaTimingFunction
		  // Constructor() -- From iOSLibObject
		  // Constructor(AnId as Ptr) -- From iOSLibObject
		  Super.Constructor (emitterCell(ClassPtr))
		  RetainClassObject
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function alphaRange lib UIKit selector "alphaRange" (id as ptr) as single
			  Return alphaRange (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setAlphaRange lib UIKit selector "setAlphaRange:" (id as ptr, value as single)
			  setAlphaRange id, value
			End Set
		#tag EndSetter
		AlphaRange As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function alphaSpeed lib UIKit selector "alphaSpeed" (id as ptr) as single
			  Return alphaSpeed (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setAlphaSpeed lib UIKit selector "setAlphaSpeed:" (id as ptr, value as single)
			  setAlphaSpeed id, value
			End Set
		#tag EndSetter
		AlphaSpeed As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function birthRate lib UIKit selector "birthRate" (id as ptr) as single
			  Return birthRate (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setBirthRate lib UIKit selector "setBirthRate:" (id as ptr, value as single)
			  setBirthRate id, value
			End Set
		#tag EndSetter
		BirthRate As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function blueRange lib UIKit selector "blueRange" (id as ptr) as single
			  Return blueRange (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setBlueRange lib UIKit selector "setBlueRange:" (id as ptr, value as single)
			  setBlueRange id, value
			End Set
		#tag EndSetter
		BlueRange As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function blueSpeed lib UIKit selector "blueSpeed" (id as ptr) as single
			  Return blueSpeed (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setBlueSpeed lib UIKit selector "setBlueSpeed:" (id as ptr, value as single)
			  setBlueSpeed id, value
			End Set
		#tag EndSetter
		BlueSpeed As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  static mClassPtr as Ptr = NSClassFromString ("CAEmitterCell")
			  return mClassPtr
			End Get
		#tag EndGetter
		Protected Shared ClassPtr As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return iOSLibObject.MakeFromPtr (getContents)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  setcontents (value.GeneralID)
			  
			End Set
		#tag EndSetter
		Contents As iOSLibGeneralObject
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target64bit
			    Declare Function emissionRange lib UIKit selector "emissionRange" (id as ptr) as double
			  #elseif Target32Bit
			    Declare Function emissionRange lib UIKit selector "emissionRange" (id as ptr) as single
			  #endif
			  Return emissionRange (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if Target64bit
			    Declare Sub setEmissionRange lib UIKit selector "setEmissionRange:" (id as ptr, value as double)
			  #elseif Target32Bit
			    Declare Sub setEmissionRange lib UIKit selector "setEmissionRange:" (id as ptr, value as single)
			  #endif
			  setEmissionRange (id, value)
			  
			End Set
		#tag EndSetter
		EmissionRange As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function emitterCells lib UIKit selector "emitterCells" (id as ptr) as ptr
			  Return iOSLibArray.MakeFromPtr ( emitterCells (id))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setEmitterCells lib UIKit selector "setEmitterCells:" (id as ptr, value as ptr)
			  setEmitterCells id, value.id
			End Set
		#tag EndSetter
		EmitterCells As iOSLibarray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function enabled lib UIKit selector "isEnabled" (id as ptr) as Boolean
			  Return enabled (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setEnabled lib UIKit selector "setEnabled:" (id as ptr, value as Boolean)
			  setEnabled id, value
			End Set
		#tag EndSetter
		Enabled As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function greenRange lib UIKit selector "greenRange" (id as ptr) as single
			  Return greenRange (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setGreenRange lib UIKit selector "setGreenRange:" (id as ptr, value as single)
			  setGreenRange id, value
			End Set
		#tag EndSetter
		GreenRange As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function greenSpeed lib UIKit selector "greenSpeed" (id as ptr) as single
			  Return greenSpeed (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setGreenSpeed lib UIKit selector "setGreenSpeed:" (id as ptr, value as single)
			  setGreenSpeed id, value
			End Set
		#tag EndSetter
		GreenSpeed As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function lifetime lib UIKit selector "lifetime" (id as ptr) as single
			  Return lifetime (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setLifetime lib UIKit selector "setLifetime:" (id as ptr, value as single)
			  setLifetime id, value
			End Set
		#tag EndSetter
		LifeTime As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function lifetimeRange lib UIKit selector "lifetimeRange" (id as ptr) as single
			  Return lifetimeRange (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setLifetimeRange lib UIKit selector "setLifetimeRange:" (id as ptr, value as single)
			  setLifetimeRange id, value
			End Set
		#tag EndSetter
		LifeTimeRange As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return iOSLibObject.getName
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  iOSLibObject.setName value
			End Set
		#tag EndSetter
		Name As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function redRange lib UIKit selector "redRange" (id as ptr) as single
			  Return redRange (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setRedRange lib UIKit selector "setRedRange:" (id as ptr, value as single)
			  setRedRange id, value
			End Set
		#tag EndSetter
		RedRange As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function redSpeed lib UIKit selector "redSpeed" (id as ptr) as single
			  Return redSpeed (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setRedSpeed lib UIKit selector "setRedSpeed:" (id as ptr, value as single)
			  setRedSpeed id, value
			End Set
		#tag EndSetter
		RedSpeed As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target64bit
			    Declare Function scale lib UIKit selector "scale" (id as ptr) as double
			  #elseif Target32Bit
			    Declare Function scale lib UIKit selector "scale" (id as ptr) as single
			  #endif
			  Return scale (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if Target64bit
			    Declare Sub setScale lib UIKit selector "setScale:" (id as ptr, value as double)
			  #elseif Target32Bit
			    Declare Sub setScale lib UIKit selector "setScale:" (id as ptr, value as single)
			  #endif
			  setscale (id, value)
			  
			End Set
		#tag EndSetter
		Scale As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target64bit
			    Declare Function ScaleRange lib UIKit selector "scaleRange" (id as ptr) as double
			  #elseif Target32Bit
			    Declare Function ScaleRange lib UIKit selector "scaleRange" (id as ptr) as single
			  #endif
			  Return ScaleRange (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if Target64bit
			    Declare Sub setScaleRange lib UIKit selector "setScaleRange:" (id as ptr, value as double)
			  #elseif Target32Bit
			    Declare Sub setScaleRange lib UIKit selector "setScaleRange:" (id as ptr, value as single)
			  #endif
			  setScaleRange (id, value)
			  
			End Set
		#tag EndSetter
		ScaleRange As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target64bit
			    Declare Function scaleSpeed lib UIKit selector "scaleSpeed" (id as ptr) as double
			  #elseif Target32Bit
			    Declare Function scaleSpeed lib UIKit selector "scaleSpeed" (id as ptr) as single
			  #endif
			  Return ScaleSpeed (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if Target64bit
			    Declare Sub setScaleSpeed lib UIKit selector "setScaleSpeed:" (id as ptr, value as double)
			  #elseif Target32Bit
			    Declare Sub setScaleSpeed lib UIKit selector "setScaleSpeed:" (id as ptr, value as single)
			  #endif
			  setScaleSpeed (id, value)
			  
			End Set
		#tag EndSetter
		ScaleSpeed As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target64bit
			    Declare Function spin lib UIKit selector "spin" (id as ptr) as double
			  #elseif Target32Bit
			    Declare Function spin lib UIKit selector "spin" (id as ptr) as single
			  #endif
			  Return spin (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if Target64bit
			    Declare Sub setSpin lib UIKit selector "setSpin:" (id as ptr, value as double)
			  #elseif Target32Bit
			    Declare Sub setSpin lib UIKit selector "setSpin:" (id as ptr, value as single)
			  #endif
			  setSpin (id, value)
			  
			End Set
		#tag EndSetter
		Spin As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target64bit
			    Declare Function spinRange lib UIKit selector "spinRange" (id as ptr) as double
			  #elseif Target32Bit
			    Declare Function spinRange lib UIKit selector "spinRange" (id as ptr) as single
			  #endif
			  Return spinRange (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if Target64bit
			    Declare Sub setSpinRange lib UIKit selector "setSpinRange:" (id as ptr, value as double)
			  #elseif Target32Bit
			    Declare Sub setSpinRange lib UIKit selector "setSpinRange:" (id as ptr, value as single)
			  #endif
			  setSpinRange (id, value)
			  
			End Set
		#tag EndSetter
		SpinRange As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target64bit
			    Declare Function velocity lib UIKit selector "velocity" (id as ptr) as double
			  #elseif Target32Bit
			    Declare Function velocity lib UIKit selector "velocity" (id as ptr) as single
			  #endif
			  Return velocity (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if Target64bit
			    Declare Sub setVelocity lib UIKit selector "setVelocity:" (id as ptr, value as double)
			  #elseif Target32Bit
			    Declare Sub setVelocity lib UIKit selector "setVelocity:" (id as ptr, value as single)
			  #endif
			  setVelocity (id, value)
			  
			End Set
		#tag EndSetter
		Velocity As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target64bit
			    Declare Function velocityRange lib UIKit selector "velocityRange" (id as ptr) as double
			  #elseif Target32Bit
			    Declare Function velocityRange lib UIKit selector "velocityRange" (id as ptr) as single
			  #endif
			  Return VelocityRange (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if Target64bit
			    Declare Sub setVelocityRange lib UIKit selector "setVelocityRange:" (id as ptr, value as double)
			  #elseif Target32Bit
			    Declare Sub setVelocityRange lib UIKit selector "setVelocityRange:" (id as ptr, value as single)
			  #endif
			  setVelocityrange (id, value)
			  
			End Set
		#tag EndSetter
		VelocityRange As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target64bit
			    Declare Function xAcceleration lib UIKit selector "xAcceleration" (id as ptr) as double
			  #elseif Target32Bit
			    Declare Function xAcceleration lib UIKit selector "xAcceleration" (id as ptr) as single
			  #endif
			  Return xAcceleration (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if Target64bit
			    Declare Sub setXAcceleration lib UIKit selector "setXAcceleration:" (id as ptr, value as double)
			  #elseif Target32Bit
			    Declare Sub setXAcceleration lib UIKit selector "setXAcceleration:" (id as ptr, value as single)
			  #endif
			  setXAcceleration (id, value)
			  
			End Set
		#tag EndSetter
		XAcceleration As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target64bit
			    Declare Function yAcceleration lib UIKit selector "yAcceleration" (id as ptr) as double
			  #elseif Target32Bit
			    Declare Function yAcceleration lib UIKit selector "yAcceleration" (id as ptr) as single
			  #endif
			  Return yAcceleration (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if Target64bit
			    Declare Sub setYAcceleration lib UIKit selector "setYAcceleration:" (id as ptr, value as double)
			  #elseif Target32Bit
			    Declare Sub setYAcceleration lib UIKit selector "setYAcceleration:" (id as ptr, value as single)
			  #endif
			  setYAcceleration (id, value)
			  
			End Set
		#tag EndSetter
		YAcceleration As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target64bit
			    Declare Function zAcceleration lib UIKit selector "zAcceleration" (id as ptr) as double
			  #elseif Target32Bit
			    Declare Function zAcceleration lib UIKit selector "zAcceleration" (id as ptr) as single
			  #endif
			  Return zAcceleration (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if Target64bit
			    Declare Sub setZAcceleration lib UIKit selector "setZAcceleration:" (id as ptr, value as double)
			  #elseif Target32Bit
			    Declare Sub setZAcceleration lib UIKit selector "setZAcceleration:" (id as ptr, value as single)
			  #endif
			  setZAcceleration (id, value)
			  
			End Set
		#tag EndSetter
		ZAcceleration As Double
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AlphaRange"
			Group="Behavior"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AlphaSpeed"
			Group="Behavior"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Autoreverses"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BeginTime"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BirthRate"
			Group="Behavior"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BlueRange"
			Group="Behavior"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BlueSpeed"
			Group="Behavior"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DebugDescription"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Duration"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EmissionRange"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FillMode"
			Group="Behavior"
			Type="FillModes"
			EditorType="Enum"
			#tag EnumValues
				"0 - Remove"
				"1 - Remain"
				"2 - Reset"
				"3 - Both"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="GreenRange"
			Group="Behavior"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="GreenSpeed"
			Group="Behavior"
			Type="Single"
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
			Name="LifeTime"
			Group="Behavior"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LifeTimeRange"
			Group="Behavior"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MagnificationFilter"
			Group="Behavior"
			Type="ScalingFilters"
			EditorType="Enum"
			#tag EnumValues
				"0 - Linear"
				"1 - Nearest"
				"2 - Trilinear"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="mHasOwnership"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinificationFilter"
			Group="Behavior"
			Type="ScalingFilters"
			EditorType="Enum"
			#tag EnumValues
				"0 - Linear"
				"1 - Nearest"
				"2 - Trilinear"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinificationFilterBias"
			Group="Behavior"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RedRange"
			Group="Behavior"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RedSpeed"
			Group="Behavior"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RepeatCount"
			Group="Behavior"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RepeatDuration"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Scale"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScaleRange"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScaleSpeed"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Speed"
			Group="Behavior"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Spin"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SpinRange"
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
			Name="TimeOffset"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Velocity"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="VelocityRange"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="XAcceleration"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="YAcceleration"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ZAcceleration"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
