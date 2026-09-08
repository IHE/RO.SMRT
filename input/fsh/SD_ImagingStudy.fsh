Profile: SMRTImagingStudy
Parent: ImagingStudy
Id: smrt-imaging-study
Title: "SMRT ImagingStudy Profile"
Description: "The SMRT ImagingStudy Profile defines expectations for the FHIR ImagingStudy resource to represent DICOM SOP Instances (such as RT (Ion) Plan, RT Structure Set, RT Dose, etc.) exchanged within SMRT workflows."
* ^status = #active
* id 1.. MS
* identifier 1..* MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier contains StudyUID 1..1 MS
* identifier[StudyUID] MS
* identifier[StudyUID].type 1..1 MS
* identifier[StudyUID].type = DCM#110180 "Study Instance UID"
* identifier[StudyUID].system 1..1 MS
* identifier[StudyUID].value 1..1 MS
* status 1..1 MS
* modality MS
* modality from $dicom-cid-33-Modality
* endpoint ^slicing.discriminator.type = #profile
* endpoint ^slicing.discriminator.path = "$this"
* endpoint ^slicing.rules = #open
* endpoint contains dicomEndpoint 1..*
* endpoint[dicomEndpoint] only Reference(SMRTEndpoint)
* subject 1..1 MS
* subject only Reference(Patient)
* series 0..* MS
  * uid MS
  * modality MS
  * modality from $dicom-cid-33-Modality
  * instance 0..* MS
    * uid MS
    * sopClass MS
