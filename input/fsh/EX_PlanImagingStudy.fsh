Instance: PlanImagingStudy1
InstanceOf: PlanImagingStudy
Usage: #example
Title: "Example Plan Imaging Study"
Description: "Example of an Imaging Study for a DICOM RT Plan."
* subject = Reference(Patient1)
* identifier[StudyUID].value = "2.16.124.113543.6003.2588828330.45298.1"
* identifier[StudyUID].system = "urn:dicom:uid"
* identifier[StudyUID].type.coding = $DCM#110180 "Study Instance UID"
* identifier[StudyUID].use = #official
* status = #available
* modality = $DCM#RTPLAN
* series[0].uid = "2.16.124.113543.6003.2588828330.45298.1.1"
* series[0].modality = $DCM#RTPLAN
* series[0].instance[0].uid = "2.16.124.113543.6003.2588828330.45298.1.1.1"
* series[0].instance[0].sopClass = urn:ietf:rfc:3986#urn:oid:1.2.840.10008.5.1.4.1.1.481.5 "RT Plan Storage"
* endpoint = Reference(DICOMEndpoint1)
* started = "2026-09-09T10:15:24+01:00"
