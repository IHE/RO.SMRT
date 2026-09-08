Profile: PlanImagingStudy
Parent: SMRTImagingStudy
Id: plan-imaging-study
Title: "SMRT Plan ImagingStudy Profile"
Description: "The SMRT Plan ImagingStudy Profile defines expectations for the FHIR ImagingStudy resource to represent a DICOM RT (Ion) Plan SOP Instance exchanged within SMRT workflows."
* ^status = #active
* modality from $dicom-cid-33-Modality
* subject 1..1 MS
* subject only Reference(Patient)
* series 1..1 MS
  * modality = DCM#RTPLAN
  * instance 0..* MS
    * uid MS
    * sopClass 1..1 MS
    * sopClass from RTPlanSOPClassVS (required)
