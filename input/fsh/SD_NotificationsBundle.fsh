Profile: NotificationsBundle
Parent: Bundle
Id: notifications-bundle
Title: "Notifications Bundle Profile"
Description: "The Notifications Bundle Profile constrains the FHIR [Bundle](http://hl7.org/fhir/R4/bundle.html) resource to the SMRT notification messaging framework."
* ^status = #active
* id 1.. MS
* type only code
* type = #message (exactly)
* type MS
* timestamp 1.. MS
* total 0..0
* total ^comment = "This element is constrained to min = 0 because of the invariant `bdl-1`"
* total ^mustSupport = false
* entry 2..* MS
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry.search 0..0
* entry.search ^comment = "This element is constrained to min = 0 because of the invariant `bdl-2`"
* entry.search ^mustSupport = false
* entry.request 0..0
* entry.request ^comment = "This element is constrained to min = 0 because of the invariant `bdl-3`"
* entry.request ^mustSupport = false
* entry.response 0..0
* entry.response ^comment = "This element is constrained to min = 0 because of the invariant `bdl-4`"
* entry.response ^mustSupport = false
* entry contains messageheader 1..1 MS
* entry[messageheader].resource 1..1 MS
* entry[messageheader].resource only NotificationsMessageHeader