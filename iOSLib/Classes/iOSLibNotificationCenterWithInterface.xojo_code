#tag Class
Protected Class iOSLibNotificationCenterWithInterface
Inherits iOSLibNotificationCenter
Implements NotificationSender
	#tag Event
		Sub ReceivedNotification()
		  NotifyObservers
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Destructor()
		  for u as integer = 0 to NotificationReceivers.Ubound
		    NotificationReceivers.Remove u
		  next
		  super.Destructor
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NotifyObservers()
		  // Part of the NotificationSender interface.
		  
		  for each obs as NotificationReceiver in NotificationReceivers
		    obs.ReveicedNotification
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RegisterObserver(observer As NotificationReceiver)
		  // Part of the NotificationSender interface.
		  NotificationReceivers.Append observer
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveObserver(observer As NotificationReceiver)
		  // Part of the NotificationSender interface.
		  dim found as integer =  NotificationReceivers.IndexOf (observer)
		  if found > -1 then NotificationReceivers.Remove (found)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		NotificationReceivers() As NotificationReceiver
	#tag EndProperty


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
