Profile: PlanningArtifactsNotificationMessageHeader
Parent: NotificationsMessageHeader
Id: planning-artifacts-notification-messageheader
Title: "Planning Artifacts Notification MessageHeader Profile"
Description: "The Planning Artifacts Notification MessageHeader Profile builds on the [Notifications MessageHeader Profile](StructureDefinition-notifications-messageheader.html) and sets minimum expectations for the FHIR [MessageHeader](http://hl7.org/fhir/R4/messageheader.html) resource to record the necessary context for SMRT planning artifacts notification messaging scenario.  The event code is \"notification-planning-artifacts\" and the focus of the event are the planning artifacts."
* ^experimental = false
* . ^mustSupport = false
* eventCoding = NotificationEventCodeSystem#notification-planning-artifacts-ready
* focus 1..* MS
* focus ^slicing.discriminator.type = #profile
* focus ^slicing.discriminator.path = "$this.resolve()"
* focus ^slicing.rules = #open
* focus contains plan 1..1 MS and other 0..* MS
* focus[plan] only Reference(PlanImagingStudy)
* focus[plan] ^type.aggregation = #bundled
* focus[other] only Reference(SMRTImagingStudy)
* focus[other] ^type.aggregation = #bundled