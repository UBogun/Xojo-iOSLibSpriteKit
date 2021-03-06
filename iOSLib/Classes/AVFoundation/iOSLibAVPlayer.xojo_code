#tag Class
Protected Class iOSLibAVPlayer
Inherits ioslibobject
	#tag Method, Flags = &h0
		Sub CancelPrerolls()
		  Declare sub cancelPendingPrerolls lib AVFoundation selector "cancelPendingPrerolls" (id as ptr)
		  cancelPendingPrerolls (id)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(URLName as CFStringRef)
		  dim myURL as new iosliburl (URLName)
		  Constructor (myurl)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(aURL as FolderItem)
		  Constructor (new iOSLibURL(aurl))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(aURL as iOSLibURL)
		  Declare function initWithURL lib AVFoundation selector "initWithURL:" (id as ptr, url as ptr) as ptr
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From iOSLibObject
		  // Constructor(AnId as Ptr) -- From iOSLibObject
		  Super.Constructor (initWithURL(alloc(Classptr), aURL.id))
		  mhasownership = true
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Pause()
		  Declare sub pause lib AVFoundation selector "pause" (id as ptr)
		  pause (id)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Play()
		  Declare sub play lib AVFoundation selector "play" (id as ptr)
		  play (id)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PreRoll(Rate As Single)
		  Declare sub prerollAtRate lib AVFoundation selector "prerollAtRate:completionHandler:" (id as ptr, rate as single, Block as ptr)
		  dim Block as new iOSBlock (AddressOf PrerollCompletionBlock)
		  prerollAtRate id, rate, block.Handle
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PrerollCompletionBlock(Succesful as Boolean)
		  if me <> nil then RaiseEvent PrerollFinished (Succesful)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SeekToTime(Time as CMTime)
		  Declare sub seekToTime lib AVFoundation selector "seekToTime:completionHandler:" (id as ptr, time as CMTime, block as ptr)
		  dim block as new iOSBlock (AddressOf SeekToTimeCompletionBlock)
		  seekToTime id, time, block.Handle
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SeekToTime(Time as CMTime, ToleranceBefore As CMTime, ToleranceAfter as CMTime)
		  Declare sub seekToTimeTolerance lib AVFoundation selector "seekToTime:toleranceBefore:toleranceAfter:completionHandler:" _
		  (id as ptr, time as CMTime, ToleranceBefore as CMTime, ToleranceAfter as CMTime, block as ptr)
		  dim block as new iOSBlock (AddressOf SeekToTimeCompletionBlock)
		  seekToTimeTolerance id, time, ToleranceBefore, ToleranceAfter, block.Handle
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SeekToTimeCompletionBlock(Finished as Boolean)
		  if me <> nil then RaiseEvent TimeFound (Finished)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Synchronize(Rate as single, itemTime as CMTime, Hosttime as CMTime)
		  Declare sub setRate lib AVFoundation selector "setRate:time:atHostTime:" (id as ptr, rate as single, itemTime as CMTime, Hosttime as CMTime)
		  setRate id, rate, itemTime, Hosttime
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event PrerollFinished(Succesful as Boolean)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TimeFound(Finished as Boolean)
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function actionAtItemEnd lib AVFoundation selector "actionAtItemEnd" (id as ptr) as AVPlayerActionAtItemEnd
			  return actionAtItemEnd (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setActionAtItemEnd lib AVFoundation selector "setActionAtItemEnd:" (id as ptr, value as AVPlayerActionAtItemEnd)
			  setActionAtItemEnd id, value
			End Set
		#tag EndSetter
		actionAtItemEnd As AVPlayerActionAtItemEnd
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function allowsExternalPlayback lib AVFoundation selector "allowsExternalPlayback" (id as ptr) as Boolean
			  return allowsExternalPlayback (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setAllowsExternalPlayback lib AVFoundation selector "setAllowsExternalPlayback:" (id as ptr, value as Boolean)
			  setAllowsExternalPlayback id, value
			End Set
		#tag EndSetter
		AllowsExternalPlayback As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function appliesMediaSelectionCriteriaAutomatically lib AVFoundation selector "appliesMediaSelectionCriteriaAutomatically" (id as ptr) as Boolean
			  return appliesMediaSelectionCriteriaAutomatically (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setAppliesMediaSelectionCriteriaAutomatically lib AVFoundation selector "setAppliesMediaSelectionCriteriaAutomatically:" (id as ptr, value as Boolean)
			  setAppliesMediaSelectionCriteriaAutomatically id, value
			End Set
		#tag EndSetter
		AutomaticMediaSelection As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  static mClassPtr as Ptr = NSClassFromString ("AVPlayer")
			  return mClassPtr
			End Get
		#tag EndGetter
		Protected Shared ClassPtr As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function isClosedCaptionDisplayEnabled lib AVFoundation selector "isClosedCaptionDisplayEnabled" (id as ptr) as Boolean
			  return isClosedCaptionDisplayEnabled (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setClosedCaptionDisplayEnabled lib AVFoundation selector "setClosedCaptionDisplayEnabled:" (id as ptr, value as Boolean)
			  setClosedCaptionDisplayEnabled id, value
			End Set
		#tag EndSetter
		ClosedCaption As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function currentItem lib AVFoundation selector "currentItem" (id as ptr) as Ptr
			  return iOSLibAVPlayerItem.makefromPtr (currentItem (id))
			End Get
		#tag EndGetter
		currentItem As iOSLibAVPlayerItem
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function currentTime lib AVFoundation selector "currentTime" (id as ptr) as CMTime
			  return currentTime (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setCurrentTime lib AVFoundation selector "setCurrentTime:" (id as ptr, value as CMTime)
			  setCurrentTime id, value
			End Set
		#tag EndSetter
		currentTime As CMTime
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function isExternalPlaybackActive lib AVFoundation selector "isExternalPlaybackActive" (id as ptr) as Boolean
			  return isExternalPlaybackActive (id)
			End Get
		#tag EndGetter
		ExternalPlaybackActive As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  select case ExternalPlaybackVideoGravityText
			  case AVLayerVideoGravityResize
			    return AVLayerGravity.Fill
			  case AVLayerVideoGravityResizeAspect
			    return AVLayerGravity.FitProportional
			  case AVLayerVideoGravityResizeAspectFill
			    return AVLayerGravity.FillProportional
			  end select
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  dim myvalue as text
			  select case value
			  case AVLayerGravity.Fill
			    myvalue = AVLayerVideoGravityResize
			  case AVLayerGravity.FitProportional
			    myvalue= AVLayerVideoGravityResizeAspect
			  case AVLayerGravity.FillProportional
			    myvalue = AVLayerVideoGravityResizeAspectFill
			  end select
			  ExternalPlaybackVideoGravityText = myvalue
			End Set
		#tag EndSetter
		ExternalPlaybackVideoGravity As AVLayerGravity
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Declare function externalPlaybackVideoGravity lib AVFoundation selector "externalPlaybackVideoGravity" (id as ptr) as CFStringRef
			  return externalPlaybackVideoGravity (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setExternalPlaybackVideoGravity lib AVFoundation selector "setExternalPlaybackVideoGravity:" (id as ptr, value as CFStringRef)
			  setExternalPlaybackVideoGravity id, value
			End Set
		#tag EndSetter
		Protected ExternalPlaybackVideoGravityText As text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function usesExternalPlaybackWhileExternalScreenIsActive lib AVFoundation selector "usesExternalPlaybackWhileExternalScreenIsActive" (id as ptr) as Boolean
			  return usesExternalPlaybackWhileExternalScreenIsActive (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setUsesExternalPlaybackWhileExternalScreenIsActive lib AVFoundation selector "setUsesExternalPlaybackWhileExternalScreenIsActive:" (id as ptr, value as Boolean)
			  setUsesExternalPlaybackWhileExternalScreenIsActive id, value
			End Set
		#tag EndSetter
		ExternalPlaybackWhileExternalScreenActive As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function isMuted lib AVFoundation selector "isMuted" (id as ptr) as Boolean
			  return isMuted (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setMuted lib AVFoundation selector "setMuted:" (id as ptr, value as Boolean)
			  setMuted id, value
			End Set
		#tag EndSetter
		Muted As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function rate lib AVFoundation selector "rate" (id as ptr) as Single
			  return rate (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setRate lib AVFoundation selector "setRate:" (id as ptr, value as Single)
			  setRate id, value
			End Set
		#tag EndSetter
		Rate As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function status lib AVFoundation selector "status" (id as ptr) as AVPlayerStatus
			  return status (id)
			End Get
		#tag EndGetter
		Status As AVPlayerStatus
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function volume lib AVFoundation selector "volume" (id as ptr) as Single
			  return volume (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setVolume lib AVFoundation selector "setVolume:" (id as ptr, value as Single)
			  setVolume id, value
			End Set
		#tag EndSetter
		Volume As Single
	#tag EndComputedProperty


	#tag Constant, Name = AVLayerVideoGravityResize, Type = Text, Dynamic = False, Default = \"AVLayerVideoGravityResize", Scope = Public
	#tag EndConstant

	#tag Constant, Name = AVLayerVideoGravityResizeAspect, Type = Text, Dynamic = False, Default = \"AVLayerVideoGravityResizeAspect", Scope = Public
	#tag EndConstant

	#tag Constant, Name = AVLayerVideoGravityResizeAspectFill, Type = Text, Dynamic = False, Default = \"AVLayerVideoGravityResizeAspectFill", Scope = Public
	#tag EndConstant


	#tag Structure, Name = CMTime, Flags = &h0
		TimeValue As Int64
		  TimeScale As Int32
		  TimeFlags As UInt32
		TimeEpoch As Int64
	#tag EndStructure


	#tag Enum, Name = AVLayerGravity, Type = Integer, Flags = &h0
		Fill
		  FitProportional
		FillProportional
	#tag EndEnum

	#tag Enum, Name = AVPlayerActionAtItemEnd, Type = Integer, Flags = &h0
		Advance
		  Pause
		None
	#tag EndEnum

	#tag Enum, Name = AVPlayerStatus, Type = Integer, Flags = &h0
		Unknown
		  ReadyToPlay
		Failed
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="actionAtItemEnd"
			Group="Behavior"
			Type="AVPlayerActionAtItemEnd"
			EditorType="Enum"
			#tag EnumValues
				"0 - Advance"
				"1 - Pause"
				"2 - None"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowsExternalPlayback"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutomaticMediaSelection"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ClosedCaption"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DebugDescription"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ExternalPlaybackActive"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ExternalPlaybackVideoGravity"
			Group="Behavior"
			Type="AVLayerGravity"
			EditorType="Enum"
			#tag EnumValues
				"0 - Fill"
				"1 - FitProportional"
				"2 - FillProportional"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="ExternalPlaybackWhileExternalScreenActive"
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
			Name="Muted"
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
			Name="Rate"
			Group="Behavior"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Status"
			Group="Behavior"
			Type="AVPlayerStatus"
			EditorType="Enum"
			#tag EnumValues
				"0 - Unknown"
				"1 - ReadyToPlay"
				"2 - Failed"
			#tag EndEnumValues
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
			Name="Volume"
			Group="Behavior"
			Type="Single"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
