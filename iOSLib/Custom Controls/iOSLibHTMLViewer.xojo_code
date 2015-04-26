#tag Class
Protected Class iOSLibHTMLViewer
Inherits iOSUserControl
	#tag Event
		Sub Close()
		  if not Viewer.IsNIL then
		    Viewer.Delegate_ = nil
		    system.debuglog "Nulled HTMLVIewDelegate"
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Function CreateView() As UInteger
		  dim frame as new Rect (0,0,100,100)
		  
		  mid = iOSLibResponder.DoInitWithFrame (ioslibobject.alloc(ClassPtr), frame.tonsrect)
		  Viewer.myiOSLibHTMLViewer = WeakRef.create (self)
		  viewer.mhasownership = true
		  
		  dim mydelegate as new iOSLibWebViewDelegate (self)
		  Viewer.Delegate_ = mydelegate
		  
		  Return UInteger(mid)
		  
		  
		  
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor(Aptr as Ptr)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From iOSUserControl
		  // Constructor() -- From iOSControl
		  // Constructor(deserializer As xojo.Core._Deserializer) -- From iOSControl
		  mid = aptr
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  break
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( hidden )  Sub InformOnError(Error as Ptr)
		  RaiseEvent DidFailLoad (error)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( hidden )  Sub InformOnFinish()
		  RaiseEvent DidFinishLoad
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( hidden )  Sub InformOnLoad()
		  RaiseEvent DidStartLoad
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( hidden )  Function InformOnShouldStart(Request as Ptr, NavigationType as iOSLibWebView.UIWebViewNavigationType) As boolean
		  return RaiseEvent ShouldStart (Request, navigationtype)
		  
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event DidFailLoad(Error as Ptr)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DidFinishLoad()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DidStartLoad()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ShouldStart(Request as ptr, navigationtype as iOSLibWebView.UIWebViewNavigationType) As boolean
	#tag EndHook


	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  static customClassPtr as Ptr
			  if customClassPtr = nil then
			    dim methods() as TargetClassMethodHelper
			    // methods.Append new TargetClassMethodHelper("layoutSubviews", AddressOf impl_layoutSubviews, "v@:")
			    // methods.Append new TargetClassMethodHelper("layerClass", AddressOf impl_layerClass, "#@:", true, true)
			    
			    customClassPtr = BuildTargetClass("UIWebView","iOSLibHTMLViewer",methods)
			  end if
			  return customClassPtr
			End Get
		#tag EndGetter
		Protected Shared ClassPtr As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mid
			End Get
		#tag EndGetter
		id As Ptr
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mid As Ptr
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return new iOSLibWebView (mid)
			End Get
		#tag EndGetter
		Viewer As iOSLibWebView
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AccessibilityHint"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AccessibilityLabel"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
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
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			Type="Double"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
