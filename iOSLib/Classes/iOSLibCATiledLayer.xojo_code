#tag Class
Protected Class iOSLibCATiledLayer
Inherits iOSLibCALayer
	#tag Method, Flags = &h1000
		Sub Constructor()
		  Super.Constructor (Init(Alloc(ClassPtr)))
		  mHasOwnership = true
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  static mClassPtr as Ptr = NSClassFromString ("CATiledLayer")
			  return mClassPtr
			End Get
		#tag EndGetter
		Protected Shared ClassPtr As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function fadeDuration lib UIKit selector "fadeDuration" (id as ptr) as double
			  Return fadeDuration (classptr)
			End Get
		#tag EndGetter
		Shared FadeDuration As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function levelsOfDetail lib UIKit selector "levelsOfDetail" (id as ptr) as uinteger
			  Return levelsOfDetail (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setLevelsOfDetail lib UIKit selector "setLevelsOfDetail:" (id as ptr, value as uinteger)
			  setLevelsOfDetail id, value
			End Set
		#tag EndSetter
		LevelsOfDetail As UInteger
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function levelsOfDetailBias lib UIKit selector "levelsOfDetailBias" (id as ptr) as uinteger
			  Return levelsOfDetailBias (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setLevelsOfDetailBias lib UIKit selector "setLevelsOfDetailBias:" (id as ptr, value as uinteger)
			  setLevelsOfDetailBias id, value
			End Set
		#tag EndSetter
		LevelsOfDetailBias As UInteger
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target64Bit
			    Declare Function tileSize lib UIKit selector "tileSize" (id as ptr) as nssize
			    Return tileSize (id)
			  #elseif Target32Bit
			    Declare Function tileSize lib UIKit selector "tileSize" (id as ptr) as NSSize32Bit
			    Return tileSize (id).tonssize
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if Target64Bit
			    Declare Sub setTileSize lib UIKit selector "setTileSize:" (id as ptr, value as nssize)
			    settileSize (id, value)
			  #elseif Target32Bit
			    Declare Sub setTileSize lib UIKit selector "setTileSize:" (id as ptr, value as NSSize32Bit)
			    settileSize (id, value.toNSSize32)
			  #endif
			End Set
		#tag EndSetter
		TileSize As NSSize
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Alpha"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AnchorPointZ"
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
			Name="BorderWidth"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ContentsFlipped"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ContentsPositioning"
			Group="Behavior"
			Type="caLayerContentPosition"
			EditorType="Enum"
			#tag EnumValues
				"0 - Center"
				"1 - Top"
				"2 - Bottom"
				"3 - Left"
				"4 - Right"
				"5 - TopLeft"
				"6 - TopRight"
				"7 - BottomLeft"
				"8 - BottomRight"
				"9 - Resize"
				"10 - ResizeProportionally"
				"11 - FillProportionally"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="ContentsScale"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CornerRadius"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DebugDescription"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleSided"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DrawsAsynchronously"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Duration"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EdgeAntialiasing"
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
			Name="GeometryFlipped"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="GroupOpacity"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasOwnership"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Group="Behavior"
			Type="Double"
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
		#tag EndViewProperty
		#tag ViewProperty
			Name="MasksToBounds"
			Group="Behavior"
			Type="Boolean"
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
			Name="NeedsDisplayOnBoundsChange"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Opacity"
			Group="Behavior"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Opaque"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RasterizationScale"
			Group="Behavior"
			Type="Double"
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
			Name="ShadowOpacity"
			Group="Behavior"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShadowRadius"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShouldRasterize"
			Group="Behavior"
			Type="Boolean"
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
		#tag ViewProperty
			Name="Width"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ZPosition"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
