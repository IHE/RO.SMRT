Profile: NotificationsMessageHeader
Parent: MessageHeader
Id: notifications-messageheader
Title: "Notifications MessageHeader Profile"
Description: "The Notifications MessageHeader Profile sets minimum expectations for the FHIR [MessageHeader](http://hl7.org/fhir/R4/messageheader.html) resource to record the necessary context for SMRT notification messaging using FHIR resources.  It references the focus of the use case event or request as well as other information related to the action typically transmitted in a [Bundle](http://hl7.org/fhir/R4/bundle.html) resource in which the MessageHeader resource instance is the first resource in the Bundle."
* ^status = #active
* id 1.. MS
* eventCoding 1..1 MS
* eventCoding only Coding
* eventCoding from $notification-event (extensible)
* destination 0..1 MS
* destination.endpoint 1..1 MS
* sender 0..1 MS
* sender only Reference(Organization)
* sender ^type.aggregation = #bundled
* source MS
* response 0..0
* response ^mustSupport = false
* focus 1..* MS
* focus only Reference(Resource)
* focus ^type.aggregation = #bundled
* focus.reference 1..1 MS