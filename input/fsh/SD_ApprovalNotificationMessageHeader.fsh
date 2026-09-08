Profile: ApprovalNotificationMessageHeader
Parent: NotificationsMessageHeader
Id: approval-notification-messageheader
Title: "Approval Notification MessageHeader Profile"
Description: "The Approval Notification MessageHeader Profile builds on the [Notifications MessageHeader Profile](StructureDefinition-notifications-messageheader.html) and sets minimum expectations for the FHIR [MessageHeader](http://hl7.org/fhir/R4/messageheader.html) resource to record the necessary context for SMRT approval notification messaging scenario.  The event code is \"notification-plan-approval\" and the focus of the event is the provenance resource."
* ^experimental = false
* . ^mustSupport = false
* eventCoding = NotificationEventCodeSystem#notification-plan-approval
* focus ^slicing.discriminator.type = #profile
* focus ^slicing.discriminator.path = "$this.resolve()"
* focus ^slicing.rules = #open
* focus contains plan-approval 1..1 MS
* focus[plan-approval] only Reference(PlanApprovalProvenance)
* focus[plan-approval] ^type.aggregation = #bundled