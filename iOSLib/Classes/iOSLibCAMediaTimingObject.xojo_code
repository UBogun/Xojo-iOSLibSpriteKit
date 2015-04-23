#tag Class
Protected Class iOSLibCAMediaTimingObject
Inherits iosLibResponder
	#tag Method, Flags = &h0
		 Shared Function DefaultValueForKey(Key As CFStringRef) As ioslibobject
		  declare function defaultValueForKey lib UIKit selector "defaultValueForKey:" (id as ptr, key as CFStringRef) as Ptr
		  dim myptr as ptr = defaultValueForKey (classptr, key)
		  return if (myptr <> NIL, new iOSLibObject (myptr), NIL)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function getFillMode(id as ptr) As CFStringRef
		  declare function fillMode lib UIKit selector "fillMode" (id as ptr) as CFStringRef
		  return fillMode (id)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub setFillMode(id as ptr, mode as CFstringRef)
		  declare sub setFillMode lib UIKit selector "setFillMode:" (id as ptr, value as CFStringRef)
		  setfillMode (id, mode)
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function autoreverses lib UIKit selector "autoreverses" (id as ptr) as Boolean
			  return autoreverses (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare Sub setAutoreverses lib UIKit selector "setAutoreverses:" (id as ptr, value as Boolean)
			  setAutoreverses (id, value)
			  
			End Set
		#tag EndSetter
		Autoreverses As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function beginTime lib UIKit selector "beginTime" (id as ptr) as Double
			  return beginTime (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare Sub setBeginTime lib UIKit selector "setBeginTime:" (id as ptr, value as Double)
			  setBeginTime (id, value)
			  
			End Set
		#tag EndSetter
		BeginTime As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  static mresult as text =  SystemConstantName (kCAFilterLinear, QuartzCorePath)
			  return mresult
			End Get
		#tag EndGetter
		Protected Shared CFilterLinear As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  static mresult as text =  SystemConstantName (kCAFilterNearest, QuartzCorePath)
			  return mresult
			End Get
		#tag EndGetter
		Protected Shared CFilterNearest As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  static mresult as text =  SystemConstantName (kCAFilterTrilinear, QuartzCorePath)
			  return mresult
			End Get
		#tag EndGetter
		Protected Shared CFilterTrilinear As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if target32bit
			    DEclare Function contentsRect lib uikit selector "contentsRect" (id as ptr) as NSRect32Bit
			    return contentsRect(id).toNSRect
			  #elseif Target64Bit
			    DEclare Function contentsRect lib uikit selector "contentsRect" (id as ptr) as NSRect
			    return contentsRect(id)
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if target32bit
			    DEclare Sub setContentsRect lib uikit selector "setContentsRect:" (id as ptr, value as NSRect32Bit)
			    setContentsRect id, value.toNSRect32
			  #elseif Target64Bit
			    DEclare Sub setContentsRect lib uikit selector "setContentsRect:" (id as ptr, value as NSRect)
			    setContentsRect id, value
			  #endif
			  
			End Set
		#tag EndSetter
		ContentsRect As NSRect
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function duration lib UIKit selector "duration" (id as ptr) as Double
			  return duration (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare Sub setDuration lib UIKit selector "setDuration:" (id as ptr, value as Double)
			  setDuration (id, value)
			  
			End Set
		#tag EndSetter
		Duration As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim mymode as text = getFillMode (id)
			  select case mymode
			  case FillmodeBackward
			    return FillModes.Reset
			  case FillmodeBoth
			    return fillmodes.Both
			  case FillmodeForward
			    return FillModes.Remain
			  case FillmodeRemove
			    return FillModes.Remove
			  end select
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  dim mymode as text
			  Select case value
			  case FillModes.Both
			    mymode = FillmodeBoth
			  case FillModes.Remain
			    mymode = FillmodeForward
			  case FillModes.Remove
			    mymode = FillmodeRemove
			  case FillModes.Reset
			    mymode = FillmodeBackward
			  End Select
			  setFillMode (id, mymode)
			End Set
		#tag EndSetter
		FillMode As FillModes
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  static FMFwd As Text = SystemConstantName ("kCAFillModeBackwards", QuartzCorePath)
			  return FMFwd
			End Get
		#tag EndGetter
		Protected Shared FillmodeBackward As CFStringRef
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  static FMBoth As Text = SystemConstantName ("kCAFillModeBoth", QuartzCorePath)
			  return FMBoth
			End Get
		#tag EndGetter
		Protected Shared FillmodeBoth As CFStringRef
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  static FMFwd As Text = SystemConstantName ("kCAFillModeForwards", QuartzCorePath)
			  return FMFwd
			End Get
		#tag EndGetter
		Protected Shared FillmodeForward As CFStringRef
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  static FMRemove As Text = SystemConstantName ("kCAFillModeRemoved", QuartzCorePath)
			  return FMRemove
			End Get
		#tag EndGetter
		Protected Shared FillmodeRemove As CFStringRef
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  select case mMagnificationFilter
			  case CFilterTrilinear
			    return ScalingFilters.Trilinear
			  case CFilterNearest
			    return ScalingFilters.Nearest
			  case CFilterTrilinear
			    return ScalingFilters.Trilinear
			  end select
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  dim result as text
			  select case value
			  case ScalingFilters.Linear
			    result = CFilterLinear
			  case ScalingFilters.Nearest
			    result = CFilterNearest
			  case ScalingFilters.Trilinear
			    result = CFilterTrilinear
			  end select
			  mMagnificationFilter = result
			End Set
		#tag EndSetter
		MagnificationFilter As ScalingFilters
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  select case mMinificationFilter
			  case CFilterTrilinear
			    return ScalingFilters.Trilinear
			  case CFilterNearest
			    return ScalingFilters.Nearest
			  case CFilterTrilinear
			    return ScalingFilters.Trilinear
			  end select
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  dim result as text
			  select case value
			  case ScalingFilters.Linear
			    result = CFilterLinear
			  case ScalingFilters.Nearest
			    result = CFilterNearest
			  case ScalingFilters.Trilinear
			    result = CFilterTrilinear
			  end select
			  mMinificationFilter = result
			End Set
		#tag EndSetter
		MinificationFilter As ScalingFilters
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function minificationFilterBias lib UIKit selector "minificationFilterBias" (id as ptr) as Single
			  return minificationFilterBias (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare Sub setMinificationFilterBias lib UIKit selector "setMinificationFilterBias:" (id as ptr, value as Single)
			  setMinificationFilterBias (id, value)
			  
			End Set
		#tag EndSetter
		MinificationFilterBias As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  declare function magnificationFilter lib UIKit selector "magnificationFilter" (id as ptr) as CFStringRef
			  return magnificationFilter (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare Sub setMagnificationFilter lib UIKit selector "setMagnificationFilter:" (id as ptr, value as CFStringRef)
			  setMagnificationFilter (id, value)
			End Set
		#tag EndSetter
		Protected mMagnificationFilter As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  declare function minificationFilter lib UIKit selector "minificationFilter" (id as ptr) as CFStringRef
			  return minificationFilter (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare Sub setMinificationFilter lib UIKit selector "setMinificationFilter:" (id as ptr, value as CFStringRef)
			  setMinificationFilter (id, value)
			End Set
		#tag EndSetter
		Protected mMinificationFilter As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function repeatCount lib UIKit selector "repeatCount" (id as ptr) as Single
			  return repeatCount (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare Sub setRepeatCount lib UIKit selector "setRepeatCount:" (id as ptr, value as Single)
			  setRepeatCount (id, value)
			  
			End Set
		#tag EndSetter
		RepeatCount As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function repeatDuration lib UIKit selector "repeatDuration" (id as ptr) as Double
			  return repeatDuration (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare Sub setRepeatDuration lib UIKit selector "setRepeatDuration:" (id as ptr, value as Double)
			  setRepeatDuration (id, value)
			  
			End Set
		#tag EndSetter
		RepeatDuration As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function speed lib UIKit selector "speed" (id as ptr) as Single
			  return speed (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare Sub setSpeed lib UIKit selector "setSpeed:" (id as ptr, value as Single)
			  setSpeed (id, value)
			  
			End Set
		#tag EndSetter
		Speed As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function style lib UIKit selector "style" (id as Ptr) as ptr
			  return iOSLibDictionary.MakeFromPtr (style (id))
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare Sub setStyle lib UIKit selector "setStyle:" (id as Ptr, value as ptr)
			  setStyle id, value.id
			End Set
		#tag EndSetter
		Style As iOSLibDictionary
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function timeOffset lib UIKit selector "timeOffset" (id as ptr) as Double
			  return timeOffset (id)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  declare Sub setTimeOffset lib UIKit selector "setTimeOffset:" (id as ptr, value as Double)
			  setTimeOffset (id, value)
			  
			End Set
		#tag EndSetter
		TimeOffset As Double
	#tag EndComputedProperty


	#tag Constant, Name = kCAFilterLinear, Type = Text, Dynamic = False, Default = \"kCAFilterLinear", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kCAFilterNearest, Type = Text, Dynamic = False, Default = \"kCAFilterNearest", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kCAFilterTrilinear, Type = Text, Dynamic = False, Default = \"kCAFilterTrilinear", Scope = Protected
	#tag EndConstant


	#tag Enum, Name = FillModes, Flags = &h0
		Remove
		  Remain
		  Reset
		Both
	#tag EndEnum

	#tag Enum, Name = Properties, Type = Integer, Flags = &h0
		Position
		  Anchorpoint
		  BorderColor
		  BackgroundColor
		  ShadowColor
		  Bounds
		  BorderWidth
		  CornerRadius
		  Hidden
		  MasksToBounds
		  ShadowRadius
		  ShadowOffset
		  ContentsRect
		  Filters
		  Opacity
		  ShadowOpacity
		Transform
	#tag EndEnum

	#tag Enum, Name = ScalingFilters, Type = Integer, Flags = &h0
		Linear
		  Nearest
		Trilinear
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Alpha"
			Group="Behavior"
			Type="Double"
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
			Name="Speed"
			Group="Behavior"
			Type="Single"
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
	#tag EndViewBehavior
End Class
#tag EndClass
