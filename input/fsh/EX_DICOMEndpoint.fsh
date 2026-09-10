Instance:   DICOMEndpoint1
InstanceOf: SMRTEndpoint
Usage: #example
Title: "Example DICOM Endpoint"
Description: "An example of a DICOM endpoint."
* connectionType = DicomEndpointConnectionType#dicom-dimse
* name = "MY_OST_AET"
* payloadType.text = "DICOM DIMSE"
* payloadMimeType = urn:ietf:bcp:13#application/dicom
* address = "tcp://192.168.1.100:104"
