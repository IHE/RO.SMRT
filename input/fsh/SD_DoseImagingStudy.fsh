Profile: DoseImagingStudy
Parent: SMRTImagingStudy
Id: dose-imaging-study
Title: "SMRT Dose ImagingStudy Profile"
Description: "The SMRT Dose ImagingStudy Profile defines expectations for the FHIR ImagingStudy resource to represent a DICOM RT Dose SOP Instance exchanged within SMRT workflows."
* ^status = #active
* modality from $dicom-cid-33-Modality
* subject 1..1 MS
* subject only Reference(Patient)
* series 1..1 MS
  * modality = $DCM#RTDOSE
  * instance 0..* MS
    * uid MS
    * sopClass 1..1 MS
    * sopClass from RTDoseSOPClassVS (required)
