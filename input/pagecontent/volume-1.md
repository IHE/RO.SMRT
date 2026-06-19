
In contemporary radiation oncology clinics, a single Radiation Oncology Information System (ROIS) is deployed to manage the electronic medical records (EMR) for all patients. This centralized system is used by radiation oncologists and departmental staff to prescribe, schedule, and track the complete course of treatment for each patient.

For an optimal workflow, all treatment devices should be interfaced with the ROIS to enable scheduling, prescription management, and treatment progress monitoring to be performed directly within that single, centralized system.

While some treatment devices can be managed by a Treatment Management System (TMS) integrated with the ROIS via the IHE-RO TDW-II profile, many others interface exclusively with a device-specific TMS or contain an integrated TMS. This is increasingly common with the emergence of treatment devices for novel techniques like Online Adaptive Radiation Therapy (OART), which utilizes imaging such as CBCT, CT, or MRI, and PET-based Dose-Guided Radiation Therapy (DGRT), which often bundle the TMS, Treatment Planning System (TPS), and Treatment Delivery Device (TDD) actors.

These standalone treatment devices are frequently disconnected from the departmental ROIS, creating isolated "islands" where treatments must be scheduled and tracked separately. This forces staff to rely on inefficient and error-prone workarounds, such as manual data entry or ad-hoc software bridges. Integrating these devices into the main ROIS is therefore essential to provide the same unified scheduling, review, and tracking capabilities available for the standard treatment device fleet.

The SMRT Profile provides the necessary mechanisms for exchanging scheduling, planning, and treatment delivery artifacts to support these scenarios, thereby enabling a holistic and unified view of all ongoing treatments within the ROIS.

This profile is a **Workflow and Content** profile. See the IHE Technical Frameworks [General Introduction](https://profiles.ihe.net/GeneralIntro/) for definitions of these profile types.

<a name="actors-and-transactions"> </a>

## 1:X.1 SMRT Actors, Transactions, and Content Modules

This section defines the actors, transactions, and/or content modules in this profile. General
definitions of actors are given in the Technical Frameworks General Introduction [Appendix A](https://profiles.ihe.net/GeneralIntro/ch-A.html).
IHE Transactions can be found in the Technical Frameworks General Introduction [Appendix B](https://profiles.ihe.net/GeneralIntro/ch-B.html).
Both appendices are located at <https://profiles.ihe.net/GeneralIntro/>.

The SMRT Profile defines two actors — the **Radiation Oncology Information System (ROIS)** and the **Treatment Management System (TMS)** — and a small set of FHIR-message transactions between them. To synchronize patient identity, encounters, scheduling, prescription, and imaging artifacts, SMRT **reuses established IHE transactions and standards** (IHE-ITI Patient Administration Management, IHE-RO XRTS, HL7 V2 scheduling, and DICOM) by grouping rather than by defining new transactions. An object store (OST) from which DICOM artifacts are retrieved, and the Hospital Information System (HIS), are external to this profile and shown for context.

<figure>
{% include ActorsAndTransactions.svg max-width="200px" %}
<figcaption><strong>Figure X.1-1: SMRT Actor Diagram</strong></figcaption>
</figure>
<br clear="all"/>

### X.1.1 SMRT Transactions

The transactions newly defined by this profile are FHIR-message transactions exchanged between the ROIS and the TMS, listed in Table X.1-1.

<p id ="tX.1-1" class="tableTitle"><strong>Table X.1-1: SMRT Profile - Actors and Transactions (defined by this profile)</strong></p>

| Actors  | Transactions                            | Initiator or Responder | Optionality | Reference     |
|---------|-----------------------------------------|------------------------|-------------|---------------|
| ROIS    | Sync Patient Photo [RO-SMRT-01]         | Initiator              | R           | RO TF-2: 3.Y1 |
|         | Report Planning Artifacts [RO-SMRT-02]  | Responder              | R           | RO TF-2: 3.Y2 |
|         | Report Treatment Approval [RO-SMRT-03]  | Initiator              | R           | RO TF-2: 3.Y3 |
|         | Report Treatment Artifacts [RO-SMRT-04] | Responder              | R           | RO TF-2: 3.Y4 |
|         | Report Image Review Results [RO-SMRT-05]| Responder              | O           | RO TF-2: 3.Y5 |
| TMS     | Sync Patient Photo [RO-SMRT-01]         | Responder              | R           | RO TF-2: 3.Y1 |
|         | Report Planning Artifacts [RO-SMRT-02]  | Initiator              | R           | RO TF-2: 3.Y2 |
|         | Report Treatment Approval [RO-SMRT-03]  | Responder              | R           | RO TF-2: 3.Y3 |
|         | Report Treatment Artifacts [RO-SMRT-04] | Initiator              | R           | RO TF-2: 3.Y4 |
|         | Report Image Review Results [RO-SMRT-05]| Initiator              | O           | RO TF-2: 3.Y5 |
{: .grid}

To complete the workflow, SMRT actors are grouped with actors of other profiles and exchange the transactions listed in Table X.1-2. These are **not** defined by this profile; they are reused as-is.

<p id ="tX.1-2" class="tableTitle"><strong>Table X.1-2: SMRT Profile - Reused Transactions and Standards (via grouping)</strong></p>

| Exchange                                  | Standard / Transaction                                                | Direction   |
|-------------------------------------------|-----------------------------------------------------------------------|-------------|
| Sync Patient Demographics                 | HL7 V2 ADT — IHE-ITI Patient Identity Management [ITI-30]              | ROIS → TMS  |
| Sync Treatment Encounter (optional)       | HL7 V2 ADT — IHE-ITI Patient Encounter Management [ITI-31]            | ROIS → TMS  |
| Sync Treatment Appointment                | HL7 V2 SIU (scheduling)                                                | ROIS → TMS  |
| Report Patient Check-in                   | HL7 V2 SIU (scheduling)                                                | ROIS ↔ TMS  |
| Retrieve Prescription Summary (option)    | IHE-RO XRTS [XRTS-08] — see [Support Prescription Option](#actor-options) | TMS → ROIS  |
| Retrieve Patient Photo / Planning / Treatment Artifacts | DICOM C-MOVE / C-GET / QIDO-RS / WADO-RS                  | ROIS/TMS → OST |
{: .grid}

> **Editor's Note (provisional):** The transaction names, identifiers (RO-SMRT-0x), section references, and groupings are provisional and subject to assignment by the IHE-RO Technical Committee. The specific grouping for HL7 V2 SIU scheduling/check-in, and the definition of the object store (OST) actor, are open issues. See the [Open Issues](issues.html). This profile follows the SMRT Phase 1 (MVP) scope per the Shanghai F2F sequence diagram.

### X.1.2 Actors

<a name="radiation-oncology-information-system"> </a>

#### X.1.2.1 Radiation Oncology Information System (ROIS)

The Radiation Oncology Information System (ROIS) is the single, centralized departmental system that manages the electronic medical record for all patients and maintains the authoritative record of each patient's treatment course. In this profile the ROIS is responsible for:

- **Patient and Schedule Management** — synchronizing patient demographics (via [ITI-30]), encounters (via [ITI-31]), the patient photo (Sync Patient Photo [RO-SMRT-01]), and appointment information (HL7 V2 SIU) with the TMS to prepare it for the treatment workflow.
- **Treatment Approval** — serving as the system where clinical approval for treatment is given and communicating that authorization to the TMS (Report Treatment Approval [RO-SMRT-03]), acting as the gatekeeper for proceeding with treatment delivery.
- **Artifact Consolidation and Oversight** — providing a centralized point of access to treatment-related artifacts; receiving notifications from the TMS when planning and treatment delivery artifacts are available (Report Planning Artifacts [RO-SMRT-02], Report Treatment Artifacts [RO-SMRT-04]), selectively retrieving them from the object store via DICOM, and optionally serving as the long-term archive for retrieved data.

Requirements CapabilityStatement for [ROIS](CapabilityStatement-IHE.SMRT.rois.html).

<a name="treatment-management-system"> </a>

#### X.1.2.2 Treatment Management System (TMS)

The Treatment Management System (TMS) is a device-specific subsystem for treatment execution. It coordinates the treatment planning activities and the detailed management of the delivery of treatment sessions on its associated device(s). It reports the status and results of these activities back to the ROIS (Report Planning Artifacts [RO-SMRT-02], Report Treatment Artifacts [RO-SMRT-04], and optionally Report Image Review Results [RO-SMRT-05]), thereby contributing to the patient's authoritative treatment course record. A TMS may be a standalone system or may be integrated with (or embedded in) a treatment device that also bundles the Treatment Planning System (TPS) and Treatment Delivery Device (TDD).

Requirements CapabilityStatement for [TMS](CapabilityStatement-IHE.SMRT.tms.html).

### X.1.3 Transaction Descriptions

The transactions defined by this profile are summarized below. Detailed transaction definitions appear in Volume 2.

- **Sync Patient Photo [RO-SMRT-01]** — the ROIS sends the patient photo to the TMS in a FHIR message, either by value (Base64-encoded image) or by reference to a DICOM Secondary Capture (SC) image that the TMS subsequently retrieves.
- **Report Planning Artifacts [RO-SMRT-02]** — the TMS notifies the ROIS, in a FHIR message that references DICOM RT objects, that treatment planning artifacts (principally the RT Plan) are ready for retrieval. This transaction is also used after approval to report that the final delivery plan is ready.
- **Report Treatment Approval [RO-SMRT-03]** — the ROIS sends the treatment approval to the TMS in a FHIR message, authorizing delivery.
- **Report Treatment Artifacts [RO-SMRT-04]** — when a treatment session is complete, the TMS notifies the ROIS, in a FHIR message that references DICOM RT objects (RT Record, RT Structure Set, CT, RT Dose), that treatment artifacts are ready for retrieval.
- **Report Image Review Results [RO-SMRT-05]** — when image review is performed at the TMS, the TMS reports the image review results to the ROIS in a FHIR message.

<a name="actor-options"> </a>

## X.2 SMRT Actor Options

Options that may be selected for each actor in this profile are listed in Table X.2-1 below.

<p id ="tX.2-1" class="tableTitle"><strong>Table X.2-1: SMRT - Actors and Options</strong></p>

| Actor | Option Name                  | Reference     |
|-------|------------------------------|---------------|
| ROIS  | Support Prescription Option  | Section X.2.1 |
| TMS   | Support Prescription Option  | Section X.2.1 |
{: .grid}

### X.2.1 Support Prescription Option

The Support Prescription Option enables the direct exchange of high-level prescription information between the ROIS and the TMS, beyond the minimum (MVP) demographics, scheduling, and artifact-reporting workflow. An actor that supports this option shall support the **Retrieve Prescription Summary [XRTS-08]** transaction of the IHE-RO XRTS profile (the ROIS as Responder, the TMS as Initiator); see Table X.1-2.

<a name="required-groupings"> </a>

## X.3 SMRT Required Actor Groupings

An actor from this profile (Column 1) shall implement all of the required transactions and/or content modules in this profile ***in addition to*** all of the requirements for the grouped actor (Column 2).

To synchronize patient identity, encounters, scheduling, prescription, and imaging artifacts, the SMRT actors are grouped with actors of other profiles. The SMRT actors also exchange protected health information and therefore require the security and time groupings common to IHE profiles. The IHE-RO Technical Committee will confirm the final set of required groupings during ballot; the groupings below are the expected baseline.

<p id ="tX.3-1" class="tableTitle"><strong>Table X.3-1: SMRT - Required Actor Groupings</strong></p>

| SMRT Actor | Grouping Condition | Actor(s) to be grouped with | Reference |
|------------|--------------------|-----------------------------|-----------|
| ROIS | Required | IHE-ITI PAM / Patient Demographics Supplier (or equivalent ADT source) | ITI TF-1: 14 |
| ROIS | With Support Prescription Option | IHE-RO XRTS actor for [XRTS-08] | IHE-RO XRTS |
| ROIS | Required | a DICOM artifact source / object store (OST) | DICOM |
| ROIS | Required | ITI CT / Time Client | ITI TF-1: 7 |
| ROIS | Required | ITI ATNA / Secure Node or Secure Application | ITI TF-1: 9 |
| TMS  | Required | IHE-ITI PAM / Patient Demographics Consumer (or equivalent ADT consumer) | ITI TF-1: 14 |
| TMS  | With Support Prescription Option | IHE-RO XRTS actor for [XRTS-08] | IHE-RO XRTS |
| TMS  | Required | ITI CT / Time Client | ITI TF-1: 7 |
| TMS  | Required | ITI ATNA / Secure Node or Secure Application | ITI TF-1: 9 |
{: .grid}

> **Editor's Note (provisional):** Required groupings are under review by the IHE-RO Technical Committee, including the precise PAM/scheduling groupings and the object store (OST) actor. See [Open Issues](issues.html).

<a name="overview"> </a>

## X.4 SMRT Overview

This section shows how the transactions and content modules of the profile are combined to address the use cases. Use cases are informative, not normative, and "SHALL" language is not allowed in use cases.

### X.4.1 Concepts

The SMRT Profile addresses the integration of "island" treatment devices — devices that are managed by a device-specific or embedded Treatment Management System (TMS) and that are not otherwise connected to the departmental Radiation Oncology Information System (ROIS). The profile defines the minimum exchanges needed for the ROIS to schedule, review, and track treatments performed on such devices as if they were part of the standard treatment device fleet.

### X.4.2 Use Cases

#### X.4.2.1 Use Case #1: Shared Management of Treatment

This use case describes how clinical staff can use a single departmental Radiation Oncology Information System (ROIS) to schedule, review, and track the treatment progress of a therapy session conducted on a standalone treatment device.

##### X.4.2.1.1 Shared Management of Treatment Use Case Description

This use case defines the minimum set of transactions required to establish a clinically acceptable integration workflow between a standalone treatment device and a departmental ROIS. This baseline workflow focuses on the exchange of patient demographics, scheduling, and treatment-related artifacts. More advanced interactions, such as the direct exchange of prescription information, are considered optional extensions (the Support Prescription Option).

The departmental ROIS is responsible for managing the patient's clinical journey and maintaining the authoritative record of the patient's treatment course. Its core responsibilities, as defined by this profile, are:

- **Patient and Schedule Management:** It synchronizes patient demographics, encounters, the patient photo, and appointment information with the TMS to prepare it for the treatment workflow.
- **Treatment Approval:** It is the system where clinical approval for treatment is given. It communicates this authorization to the TMS, serving as the gatekeeper for proceeding with treatment delivery.
- **Artifact Consolidation and Oversight:** It provides a centralized point of access to all treatment-related artifacts. It receives notifications from the TMS when planning and treatment delivery artifacts are available, and it may selectively retrieve them as needed to provide a holistic view for clinical review and progress tracking and, optionally, serve as the long-term archive for all retrieved data.

Each device-specific TMS functions as a specialized subsystem for treatment execution. It is responsible for coordinating the treatment planning activities and for detailed management of the delivery of the treatment sessions on its associated device(s). It reports the status and results of these activities back to the ROIS, thereby contributing to the patient's authoritative treatment course record.

##### X.4.2.1.2 Shared Management of Treatment Process Flow

The process flow for this use case is initiated by the departmental ROIS, which is the central point of management for the patient's entire treatment journey. Transactions shown in *italics* are reused from other profiles/standards (see Table X.1-2) or are external to this profile.

<figure>
{% include usecase1-processflow.svg %}
<figcaption><strong>Figure X.4.2.1.2-1: Basic Process Flow in SMRT Profile</strong></figcaption>
</figure>
<br clear="all"/>

**Pre-conditions:** A patient has been registered in the Hospital Information System (HIS) and the departmental ROIS, and a standalone treatment device managed by a TMS is available for the patient's treatment.

**Main Flow:**

*Patient Registration:*

- The patient is registered in the HIS and the demographics are synchronized to the ROIS (external; HL7 V2 ADT).
- The ROIS assigns the patient to the TMS and synchronizes the patient demographics to the TMS using *Patient Identity Management [ITI-30]* (HL7 V2 ADT), and optionally the patient encounter using *Patient Encounter Management [ITI-31]*.
- The ROIS sends the patient photo to the TMS using Sync Patient Photo [RO-SMRT-01] — either by value (Base64) or by reference to a DICOM SC image which the TMS retrieves.

*Appointment Scheduling:*

- The ROIS optionally creates the treatment intent (treatment site, modality/technique, prescribed dose, number of fractions).
- The ROIS schedules the treatment appointments and synchronizes them to the TMS (*HL7 V2 SIU*).

*Treatment Planning:*

- *(Support Prescription Option, beyond MVP)* the ROIS creates the prescription and the TMS retrieves the prescription summary using *Retrieve Prescription Summary [XRTS-08]*.
- The TMS imports an approved plan, or imports and approves a plan, and enriches it.
- The TMS reports that the planning artifacts are ready using Report Planning Artifacts [RO-SMRT-02] (FHIR message referencing DICOM); the ROIS retrieves the required artifacts (RT Plan, optionally CT, RT Structure Set, RT Dose) from the object store (*DICOM*).

*Treatment Approval:*

- When the plan is approved for delivery in the ROIS, the ROIS sends the approval to the TMS using Report Treatment Approval [RO-SMRT-03].
- The TMS adds the approval to the plan and reports that the final delivery plan is ready using Report Planning Artifacts [RO-SMRT-02]; the ROIS retrieves the RT Plan (*DICOM*).

*Treatment Delivery:*

- The patient is checked-in for a scheduled appointment at the ROIS or the TMS, and the other actor is notified (*Report Patient Check-in, HL7 V2 SIU*).
- The TMS delivers the treatment session.

*Report Treatment Artifacts:*

- When the session is complete, the TMS reports that the treatment artifacts are ready using Report Treatment Artifacts [RO-SMRT-04] (FHIR message referencing DICOM: RT Record, RT Structure Set, CT, RT Dose); the ROIS retrieves the required artifacts from the object store (*DICOM*) and tracks treatment progress.

*Post-Treatment Activities:*

- Image review is performed at the TMS — which reports the results using Report Image Review Results [RO-SMRT-05] — or at the ROIS.
- The ROIS shares the treatment summary with the HIS and submits billing (external; *HL7 V2 ORU / XRTS* and *HL7 V2 DFT*).

**Post-conditions:** The ROIS holds (or can retrieve) the planning and treatment-delivery artifacts for the session, enabling unified scheduling, review, and progress tracking of the standalone device alongside the rest of the treatment device fleet.

<a name="security-considerations"> </a>

## X.5 SMRT Security Considerations

The SMRT Profile exchanges protected health information (patient demographics, photos, schedules, prescriptions, planning and treatment-delivery artifacts) between the ROIS and the TMS. A formal risk assessment will be performed by the IHE-RO Technical Committee; the considerations below summarize the expected baseline.

- **Confidentiality and integrity in transit:** transactions should be carried over secure, mutually authenticated channels. Actors are expected to be grouped with ATNA Secure Node or Secure Application (see [Required Groupings](#required-groupings)).
- **Consistent time:** actors are expected to be grouped with a Consistent Time (CT) Client so that audit records and treatment timelines are correlated across systems.
- **Audit logging:** security-relevant events (artifact reporting, retrieval, approval, demographic updates) should be recorded as audit events; profiling of audit messages leverages the Basic Audit Log Patterns (BALP) content this IG depends on.
- **Authorization:** Responders may restrict results based on the authorization of the Initiator.

This section will be expanded with the threat model, mitigations, and residual risks. See [Open Issues](issues.html).

<a name="other-grouping"> </a>

## X.6 SMRT Cross-Profile Considerations

This section is informative.

**IHE-ITI PAM (Patient Administration Management)** — SMRT reuses Patient Identity Management [ITI-30] and Patient Encounter Management [ITI-31] to synchronize patient demographics and encounters between the ROIS and the TMS.

**IHE-RO XRTS** — With the Support Prescription Option, the TMS retrieves the prescription summary from the ROIS using Retrieve Prescription Summary [XRTS-08]. The treatment summary shared with the HIS also relates to XRTS content.

**IHE-RO TDW-II (Treatment Delivery Workflow II)** — A TMS integrated with the ROIS via TDW-II is managed through that profile. SMRT addresses the complementary case of standalone, device-specific or embedded TMSs.

**DICOM / RT objects** — The planning and treatment artifacts referenced by SMRT FHIR messages (RT Plan, RT Record, RT Structure Set, RT Dose, images, spatial registration objects) are DICOM RT objects retrieved from an object store using established DICOM transactions.
