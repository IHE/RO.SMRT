Profile: StructImagingStudy
Parent: SMRTImagingStudy
Id: struct-imaging-study
Title: "SMRT Struct ImagingStudy Profile"
Description: "The SMRT Struct ImagingStudy Profile defines expectations for the FHIR ImagingStudy resource to represent a DICOM RT Structure Set SOP Instance exchanged within SMRT workflows."
* ^status = #active
* modality from $dicom-cid-33-Modality
* subject 1..1 MS
* subject only Reference(Patient)
* series 1..1 MS
  * modality = $DCM#RTSTRUCT
  * instance 0..* MS
    * uid MS
    * sopClass 1..1 MS
    * sopClass from RTStructSOPClassVS (required)
