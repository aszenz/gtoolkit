Class {
	#name : #GtNotificationsListElement,
	#superclass : #GtNotificationsElement,
	#instVars : [
		'listElement'
	],
	#category : #'GToolkit-Notifications-UI'
}

{ #category : #initialization }
GtNotificationsListElement >> defaultLayout [
	^ BlFrameLayout new
]

{ #category : #initialization }
GtNotificationsListElement >> initialize [
	super initialize.
	self initializeList.
	self initializeListeners.
	
	self addChild: self listElement as: #notifications.
	
	self addLook: (BrLayoutResizerLook inherit
		inherit: self listElement).
]

{ #category : #initialization }
GtNotificationsListElement >> initializeList [
	listElement := BrSimpleList new
		itemType: [ :anItemTypeFactory :anItemObject :anItemIndex |
			anItemObject elementClass ];
		itemStencil: [ :anItemType :aListWidget |
			anItemType new ];
		itemDataBinder: [ :anItemElement :anItemObject :anItemIndex |
			anItemElement event: anItemObject ];
		items: self notifications asArray.
]

{ #category : #initialization }
GtNotificationsListElement >> initializeListeners [
	self 
		when: GtNotificationDismissWish 
		do: [ :anEvent | self onNotificationDismissWish: anEvent notification ]
]

{ #category : #'private - accessing' }
GtNotificationsListElement >> listElement [
	<return: #BrSimpleList>
	^ listElement
]

{ #category : #'private - event handling' }
GtNotificationsListElement >> onNotificationDismissWish: aGtNotificationEvent [ 
	self removeNotification: aGtNotificationEvent
]

{ #category : #'private - updating' }
GtNotificationsListElement >> updateElement [
	"I must be called in a UI process."
	super updateElement.
	self listElement items: self notifications asArray.
]