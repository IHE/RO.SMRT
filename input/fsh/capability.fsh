// Requirements CapabilityStatements for the SMRT actors.
// These document, at requirements level, the SMRT transactions each actor supports.
// Detailed message and content definitions are provisional and will be elaborated
// as the transactions in Volume 2 and the content modules in Volume 3 are authored.

Instance: IHE.SMRT.rois
InstanceOf: CapabilityStatement
Title: "SMRT Radiation Oncology Information System (ROIS)"
Usage: #definition
* description = """
Requirements CapabilityStatement for the **Radiation Oncology Information System (ROIS)** actor of the IHE-RO Shared Management of Radiation Treatments (SMRT) Profile.

The ROIS is the central departmental system. For the FHIR-message transactions defined by this profile it:

- **initiates** Sync Patient Photo [RO-SMRT-01] and Report Treatment Approval [RO-SMRT-03];
- **responds to** Report Planning Artifacts [RO-SMRT-02], Report Treatment Artifacts [RO-SMRT-04], and Report Image Review Results [RO-SMRT-05].

To complete the workflow, the ROIS is grouped with actors of other profiles for patient demographics/encounters (IHE-ITI PAM [ITI-30]/[ITI-31], HL7 V2 ADT), scheduling and check-in (HL7 V2 SIU), prescription summary (IHE-RO XRTS [XRTS-08], with the Support Prescription Option), and DICOM retrieval of the referenced RT objects (C-MOVE/C-GET/QIDO-RS/WADO-RS). Those exchanges are out of scope for this FHIR CapabilityStatement.
"""
* url = "https://profiles.ihe.net/RO/SMRT/CapabilityStatement/IHE.SMRT.rois"
* name = "IHE_SMRT_rois"
* title = "SMRT Radiation Oncology Information System (ROIS)"
* status = #draft
* experimental = false
* date = "2026-06-19"
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+xml
* format[+] = #application/fhir+json
* messaging.documentation = """
The ROIS exchanges SMRT FHIR messages with the TMS. The specific message definitions are provisional; see Volume 2 transaction definitions and the [Open Issues](issues.html).

Patient and appointment synchronization may be carried over HL7 V2 (ADT/SIU); artifact retrieval uses DICOM. Those exchanges are out of scope for this FHIR CapabilityStatement.
"""

Instance: IHE.SMRT.tms
InstanceOf: CapabilityStatement
Title: "SMRT Treatment Management System (TMS)"
Usage: #definition
* description = """
Requirements CapabilityStatement for the **Treatment Management System (TMS)** actor of the IHE-RO Shared Management of Radiation Treatments (SMRT) Profile.

The TMS is the device-specific subsystem. For the FHIR-message transactions defined by this profile it:

- **responds to** Sync Patient Photo [RO-SMRT-01] and Report Treatment Approval [RO-SMRT-03];
- **initiates** Report Planning Artifacts [RO-SMRT-02], Report Treatment Artifacts [RO-SMRT-04], and Report Image Review Results [RO-SMRT-05].

To complete the workflow, the TMS is grouped with actors of other profiles for patient demographics/encounters (IHE-ITI PAM [ITI-30]/[ITI-31], HL7 V2 ADT), scheduling and check-in (HL7 V2 SIU), and prescription summary (IHE-RO XRTS [XRTS-08], with the Support Prescription Option). Those exchanges are out of scope for this FHIR CapabilityStatement.
"""
* url = "https://profiles.ihe.net/RO/SMRT/CapabilityStatement/IHE.SMRT.tms"
* name = "IHE_SMRT_tms"
* title = "SMRT Treatment Management System (TMS)"
* status = #draft
* experimental = false
* date = "2026-06-19"
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+xml
* format[+] = #application/fhir+json
* messaging.documentation = """
The TMS exchanges SMRT FHIR messages with the ROIS. The specific message definitions are provisional; see Volume 2 transaction definitions and the [Open Issues](issues.html).

Patient and appointment synchronization may be carried over HL7 V2 (ADT/SIU). Those exchanges are out of scope for this FHIR CapabilityStatement.
"""
