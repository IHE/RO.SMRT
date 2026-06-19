Volume 3 defines the content exchanged by the SMRT transactions: the FHIR messages used to send the patient photo, report and approve artifacts, and report image review results, and the way those messages reference DICOM RT objects.

> **Editor's Note (provisional):** The content modules below are in development. The FHIR message structures, content profiles, and value sets have not yet been authored; this section records the intended scope and the candidate data so the IHE-RO Technical Committee can refine it. See the [Open Issues](issues.html).

## SMRT Content Modules

### Patient Photo Content

The Sync Patient Photo [RO-SMRT-01] transaction conveys the patient photo in a FHIR message, either **by value** (a Base64-encoded image, e.g., JPEG/PNG/TIFF/BMP) or **by reference** to a DICOM Secondary Capture (SC) image that the TMS retrieves via DICOM. The FHIR content profile for the photo message is to be defined.

### FHIR Message Content (DICOM RT references)

The Report Planning Artifacts [RO-SMRT-02], Report Treatment Artifacts [RO-SMRT-04], and Report Image Review Results [RO-SMRT-05] transactions convey their information in FHIR messages. Rather than embedding imaging payloads, these messages **reference** the relevant DICOM RT objects so that the ROIS can selectively retrieve them from an object store (OST) using established DICOM transactions (C-MOVE/C-GET/QIDO-RS/WADO-RS).

The principal artifacts referenced include:

- **RT Plan** — referenced by Report Planning Artifacts [RO-SMRT-02]; the main object, from which other objects (e.g., CT, RT Structure Set, RT Dose) may be derived or explicitly included. Also used post-approval to reference the final delivery plan.
- **RT Record** (RT Beams Treatment Record) — referenced by Report Treatment Artifacts [RO-SMRT-04]; the main object for delivered sessions, with related RT Structure Set, CT, RT Dose, and spatial registration objects.
- **Image** — referenced by Report Image Review Results [RO-SMRT-05].

The FHIR content profiles for these messages — including how DICOM objects are referenced (e.g., via ImagingStudy / endpoints / identifiers) — are to be defined.

### Treatment Approval Content

The Report Treatment Approval [RO-SMRT-03] transaction conveys the treatment approval in a FHIR message. The content profile is to be defined.

### Prescription Summary Content (reused)

With the Support Prescription Option, the prescription summary is retrieved using the IHE-RO XRTS **Retrieve Prescription Summary [XRTS-08]** transaction (reused, not defined by this profile). Alignment with the IHE-RO XRTS content and the [CodeX Radiotherapy](https://build.fhir.org/ig/HL7/codex-radiation-therapy/) profiles is under consideration.

### Out-of-Scope Content (context)

The treatment summary shared with the Hospital Information System (HL7 V2 ORU / XRTS) and billing (HL7 V2 DFT) are external to this profile and are not defined here.

> **Future work:** A USCDI investigation (USCDI Versions 1–5 and Draft v7; note that USCDI does not currently include mCODE data elements) identified candidate radiation-oncology data classes (Procedures, Encounter Information, Care Plan/Assessment, Diagnostic Imaging, Clinical Notes). Reporting treatment data structured according to USCDI is not part of the current MVP scope and is tracked as an open issue for a future revision.
