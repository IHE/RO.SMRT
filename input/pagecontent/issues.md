
## Significant Changes

### Significant Changes from the Template

- Established the SMRT profile scope: a **Workflow and Content** profile connecting a device-specific Treatment Management System (TMS) with a single departmental Radiation Oncology Information System (ROIS).
- Defined the profile actors **ROIS** and **TMS** (replacing the template's placeholder actors and the REST query / `REPO` actor model).
- Defined the **Use Case #1: Shared Management of Treatment** and its basic process flow, aligned to the SMRT Phase 1 (MVP) sequence diagram.
- Defined the transactions **newly created by this profile** as FHIR-message exchanges (RO-SMRT-01 through RO-SMRT-05), and documented the exchanges that are **reused from other profiles/standards** by grouping (IHE-ITI PAM [ITI-30]/[ITI-31], HL7 V2 SIU scheduling, IHE-RO XRTS [XRTS-08], and DICOM retrieval).
- Defined the **Support Prescription Option** (beyond MVP).

## Issues

### Submit an Issue

Use the repository [issue templates](https://github.com/IHE/RO.SMRT/issues) to submit a public comment or feature request.

### Open Issues

- SMRT_001: Transaction identifiers (RO-SMRT-01..05), names, and Volume 2/3 section numbers are **provisional** and must be confirmed/assigned by the IHE-RO Technical Committee.
- SMRT_002: Define the artifact-retrieval actor/grouping. The use case retrieves DICOM RT objects from an object store ("OST" in the source sequence diagram); confirm whether this is an explicit SMRT actor or a required grouping with an existing DICOM (RAD) actor.
- SMRT_003: Confirm the grouping for HL7 V2 SIU scheduling and patient check-in (which profile/transaction the appointment and check-in exchanges should reuse), and confirm the use of IHE-ITI PAM [ITI-30]/[ITI-31] for demographics and encounter synchronization (the encounter synchronization is still marked tentative in the source).
- SMRT_004: Specify the FHIR message structures and content profiles for Sync Patient Photo [RO-SMRT-01], Report Planning Artifacts [RO-SMRT-02], Report Treatment Approval [RO-SMRT-03], Report Treatment Artifacts [RO-SMRT-04], and Report Image Review Results [RO-SMRT-05], including how the artifact messages reference DICOM RT objects (RT Plan, RT Record, images).
- SMRT_005: Confirm relationship and boundaries with the IHE-RO TDW-II and XRTS profiles, and the HIS-facing exchanges (treatment summary via XRTS/HL7 V2 ORU, billing via HL7 V2 DFT) that are treated as external to SMRT.
- SMRT_006: Complete the security risk assessment and finalize required actor groupings (PAM, CT, ATNA, BALP audit profiling).
- SMRT_007 (future work): Evaluate reporting treatment data structured according to USCDI (out of current MVP scope). See the USCDI investigation summarized in [Volume 3](domain-ZZ.html).

### Closed Issues

- *None yet.*
