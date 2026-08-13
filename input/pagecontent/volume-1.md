
In contemporary radiation oncology clinics, a single Radiation Oncology Information System (ROIS)
is deployed to manage the electronic medical records (EMR) for all patients. This centralized
system is used by radiation oncologists and departmental staff to prescribe, schedule, and track
the complete course of treatment for each patient.

For an optimal workflow, all treatment devices should be interfaced with the ROIS to enable
scheduling, prescription management, and treatment progress monitoring to be performed directly
within that single, centralized system.

While some treatment devices can be managed by a Treatment Management System (TMS) integrated with
the ROIS via the IHE-RO TDW-II profile, many others interface exclusively with a device-specific
TMS or contain an integrated TMS. This is increasingly common with the emergence of treatment
devices for novel techniques like Online Adaptive Radiation Therapy (OART), which utilizes imaging
such as CBCT, CT, or MRI, and PET-based Dose-Guided Radiation Therapy (DGRT), which often bundle
the TMS, Treatment Planning System (TPS), and TDD actors.

These standalone TDDs are frequently disconnected from the departmental ROIS, creating isolated
"islands" where treatments must be scheduled and tracked separately. This forces staff to rely on
inefficient and error-prone workarounds, such as manual data entry or ad-hoc software bridges.
Integrating these devices into the main ROIS is therefore essential to provide the same unified
scheduling, review, and tracking capabilities available for the standard treatment device fleet.

The SMRT profile provides the necessary mechanisms for exchanging scheduling, planning, and
treatment delivery artifacts to support these scenarios, thereby enabling a holistic and unified
view of all ongoing treatments within the ROIS.

This profile is a Workflow and Content Profile.

<a name="actors-and-transactions"> </a>

## 1:X.1 SMRT Actors, Transactions, and Content Modules

This section defines the actors, transactions, and/or content modules in this profile. General
definitions of actors are given in the Technical Frameworks General Introduction [Appendix A](https://profiles.ihe.net/GeneralIntro/ch-A.html).
IHE Transactions can be found in the Technical Frameworks General Introduction [Appendix B](https://profiles.ihe.net/GeneralIntro/ch-B.html).
Both appendices are located at <https://profiles.ihe.net/GeneralIntro/>.

Figure below shows the actors directly involved in the SMRT Profile and the relevant transactions between them. If needed for context, other actors that may be indirectly involved due to their participation
in other related profiles are shown in dotted lines.

<figure>
{% include ActorsAndTransactions.svg max-width="200px" %}
<figcaption><strong>Figure XX.1-2: SMRT Actor Diagram</strong></figcaption>
</figure>
<br clear="all"/>

<p id ="tXX.1-1" class="tableTitle"><strong>Table XX.1-1: SMRT Profile - Actors and Transactions</strong></p>

| Actors  | Transactions                                 | Initiator or Responder | Optionality | Reference                                                             |
|---------|----------------------------------------------|------------------------|-------------|-----------------------------------------------------------------------|
| ROIS    | Patient Identity Management [ITI-30]         | Initiator              | R           | [ITI TF-2: 3.30](https://profiles.ihe.net/ITI/TF/Volume2/ITI-30.html) |
|         | Patient Encounter Management [ITI-31]        | Initiator              | R           | [ITI TF-2: 3.31](https://profiles.ihe.net/ITI/TF/Volume2/ITI-31.html) |
|         | Send Patient Photo [RO-SMRT-01]              | Initiator              | R           | [RO TF-2: 3.SMRT-01](./RO-SMRT-01.html)                               |
|         | Appointment Notification [RAD-48]            | Initiator              | R           | RAD TF-2: 4.48                                                        |
|         | Report Planning Artifacts Ready [RO-SMRT-02] | Responder              | R           | [RO TF-2: 3.SMRT-02](./RO-SMRT-02.html)                               |
|         | Retrieve Planning Artifacts [RO-SMRT-03]     | Initiator              | R           | [RO TF-2: 3.SMRT-03](./RO-SMRT-03.html)                               |
|         | Report Delivery Artifacts Ready [RO-SMRT-04] | Responder              | R           | [RO TF-2: 3.SMRT-04](./RO-SMRT-04.html)                               |
|         | Retrieve Delivery Artifacts [RO-SMRT-05]     | Initiator              | R           | [RO TF-2: 3.SMRT-05](./RO-SMRT-05.html)                               |
|         | Report Session Artifacts Ready [RO-SMRT-06]  | Responder              | R           | [RO TF-2: 3.SMRT-06](./RO-SMRT-06.html)                               |
|         | Retrieve Session Artifacts [RO-SMRT-07]      | Initiator              | R           | [RO TF-2: 3.SMRT-07](./RO-SMRT-07.html)                               |
| TMS     | Patient Identity Management [ITI-30]         | Responder              | R           | [ITI TF-2: 3.30](https://profiles.ihe.net/ITI/TF/Volume2/ITI-30.html) |
|         | Patient Encounter Management [ITI-31]        | Responder              | R           | [ITI TF-2: 3.31](https://profiles.ihe.net/ITI/TF/Volume2/ITI-31.html) |
|         | Send Patient Photo [RO-SMRT-01]              | Responder              | R           | [RO TF-2: 3.SMRT-01](./RO-SMRT-01.html)                               |
|         | Appointment Notification [RAD-48]            | Responder              | R           | RAD TF-2: 4.48                                                        |
|         | Report Planning Artifacts Ready [RO-SMRT-02] | Initiator              | R           | [RO TF-2: 3.SMRT-02](./RO-SMRT-02.html)                               |
|         | Report Delivery Artifacts Ready [RO-SMRT-04] | Initiator              | R           | [RO TF-2: 3.SMRT-04](./RO-SMRT-04.html)                               |
|         | Report Session Artifacts Ready [RO-SMRT-06]  | Initiator              | R           | [RO TF-2: 3.SMRT-06](./RO-SMRT-06.html)                               |
| OST     | Retrieve Planning Artifacts [RO-SMRT-03]     | Responder              | R           | [RO TF-2: 3.SMRT-03](./RO-SMRT-03.html)                               |
|         | Retrieve Delivery Artifacts [RO-SMRT-05]     | Responder              | R           | [RO TF-2: 3.SMRT-05](./RO-SMRT-05.html)                               |
|         | Retrieve Session Artifacts [RO-SMRT-07]      | Responder              | R           | [RO TF-2: 3.SMRT-07](./RO-SMRT-07.html)                               |
{: .grid}

### XX.1.1 Actors
The actors in this profile are described in more detail in the sections below.

<a name="radiation-oncology-information-system"> </a>

#### XX.1.1.1 Radiation Oncology Information System (ROIS)

Within the context of the SMRT profile, the ROIS serves as the system of record for the radiation
therapy treatment workflow. It provides the clinical, scheduling, and administrative information
required to coordinate planning and treatment delivery activities, regardless of whether portions
of that information originate within the ROIS itself or are received from external systems.
Its core responsibilities in this profile include:

* **Patient Registration Management**: The ROIS maintains the patient demographic information and
identifiers used throughout the treatment course. In particular, the ROIS shall maintain a primary
patient ID that serves as the reference identifier for the treatment course. This demographic and
patient identifier information can be compiled via multiple pathways:
  - Direct integration with a Hospital Information System (HIS) (typically via HL7 ADT or IHE PAM
  interfaces).
  - In imaging-driven workflows, by importing a planning CT or other imaging datasets that rely on
  patient registration in a Radiology Information System (RIS).
  - Through manual registration of the patient directly on the CT console, with the resulting image
  dataset importing the demographics.
  - Direct manual registration and entry of the patient within the ROIS itself.

* **Encounter Management**: The ROIS maintains clinical and administrative encounter information.
An encounter provides the administrative context within a patient's treatment course. Encounter
information may be created within the ROIS or received from the Hospital Information System (HIS).

* **Appointment Scheduling**: The ROIS creates and manages the appointment schedule for planned
treatment fractions.

* **Clinical Approvals**: The ROIS records clinical authorizations to proceed with treatment
delivery.

* **Centralized Progress Tracking**: The ROIS provides clinical users with a department-level view
of scheduling, planning and delivery progress, and treatment history.

FHIR Capability Statement for [ROIS](CapabilityStatement-IHE.SMRT.rois.html)

<a name="treatment-management-system"> </a>

#### XX.1.1.2 Treatment Management System (TMS)

Within the context of the SMRT profile, the TMS coordinates treatment delivery execution and
maintains the information required to prepare, manage, and document the delivery of treatment
fractions. Its core responsibilities in this profile include:

* **Treatment Fraction Management**: The TMS maintains the treatment fractions and prepares
the corresponding treatment sessions for delivery, including management of interrupted,
canceled, and partially delivered fractions.

* **Treatment Plan Management**: The TMS imports, enriches, and maintains the treatment plans
required for treatment delivery.

* **Treatment Delivery Management**: The TMS coordinates and monitors treatment delivery
activities associated with treatment sessions.

* **Treatment Delivery Documentation**: The TMS maintains treatment delivery records and other
treatment delivery artifacts.

FHIR Capability Statement for [TMS](CapabilityStatement-IHE.SMRT.tms.html)

<a name="ro-resource-repo"> </a>

#### XX.1.1.3 Object Storage (OST)

No specific descriptions or requirements.

### XX.1.2 Transaction Descriptions

The transactions in this profile are summarized in the sections below.

This profile leverages existing IHE transactions based on HL7 V2 and defines additional
transactions using HL7 V2, HL7 FHIR, and DICOM standards.

#### XX.1.2.1 Patient Identity Management [ITI-30]

Standard: HL7 V2

This profile reuses the Patient Identity Management [ITI-30] transaction defined in the
Patient Administration Management (PAM) Profile.

For more details see [ITI-30](https://profiles.ihe.net/ITI/TF/Volume2/ITI-30.html)

#### XX.1.2.2 Patient Encounter Management [ITI-31]

Standard: HL7 V2

This profile reuses the Patient Encounter Management [ITI-31] transaction defined in the
Patient Administration Management (PAM) Profile.

For more details see [ITI-31](https://profiles.ihe.net/ITI/TF/Volume2/ITI-31.html)

#### XX.1.2.3 Appointment Notification [RAD-48]

Standard: HL7 V2

This profile reuses the Appointment Notification [RAD-48] transaction defined in the
Radiology Scheduled Workflow (SWF) Profile.

For more details see [RAD TF-2](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_TF_Vol2.pdf): 4.48.

#### XX.1.2.4 Send Patient Photo [RO-SMRT-01]

Standard: FHIR

This transaction is used by the ROIS to provide the patient's photo to the TMS. The photo
supports patient identification and verification activities during treatment delivery. The
photo may be conveyed directly within the transaction or by reference for subsequent
retrieval.

For more details see the detailed [transaction description](RO-SMRT-01.html).

#### XX.1.2.5 Report Planning Artifacts Ready [RO-SMRT-02]

Standard: FHIR

This transaction is used by the TMS to notify the ROIS that treatment planning artifacts are
available for retrieval from the OST. Treatment planning artifacts represent information
produced during treatment planning and include at least the treatment plan, structure sets,
reference images, and dose information. The notification enables the ROIS to retrieve the
artifacts required to maintain the treatment workflow record and support treatment progress
tracking.

For more details see the detailed [transaction description](RO-SMRT-02.html).

#### XX.1.2.6 Retrieve Planning Artifacts [RO-SMRT-03]

Standard: DICOM

This transaction is used by the ROIS to retrieve treatment planning artifacts from the OST.

For more details see the detailed [transaction description](RO-SMRT-03.html).

#### XX.1.2.7 Report Delivery Artifacts Ready [RO-SMRT-04]

Standard: FHIR

This transaction is used by the TMS to notify the ROIS that treatment delivery artifacts are
available for retrieval from the OST. Treatment delivery artifacts represent information
prepared for treatment delivery, including the treatment plan enriched with treatment
delivery parameters such as patient setup information and tolerance tables. The
notification enables the ROIS to retrieve the artifacts required to maintain the treatment
workflow record and support treatment progress tracking.

For more details see the detailed [transaction description](RO-SMRT-04.html).

#### XX.1.2.8 Retrieve Delivery Artifacts [RO-SMRT-05]

Standard: DICOM

This transaction is used by the ROIS to retrieve treatment delivery artifacts from the OST.

For more details see the detailed [transaction description](RO-SMRT-05.html).

#### XX.1.2.9 Report Session Artifacts Ready [RO-SMRT-06]

Standard: FHIR

This transaction is used by the TMS to notify the ROIS that treatment session artifacts are
available for retrieval from the OST. Treatment session artifacts represent information
produced during the treatment session and include at least the treatment record and
procedure information. The notification enables the ROIS to retrieve the artifacts required
to maintain the treatment workflow record and support treatment progress tracking.

For more details see the detailed RO-SMRT-06.html.

#### XX.1.2.10 Retrieve Session Artifacts [RO-SMRT-07]

Standard: DICOM

This transaction is used by the ROIS to retrieve treatment session artifacts from the OST.

For more details see the detailed RO-SMRT-07.html.

<a name="actor-options"> </a>

## XX.2 SMRT Actor Options

Options that may be selected for each actor in this implementation guide, are listed in Table XX.2-1 below. Dependencies
between options when applicable are specified in notes.

<p id ="tXX.2-1" class="tableTitle"><strong>Table XX.2-1: Actor Options</strong></p>

| Actor   | Option Name |
|---------|-------------|
| Actor A | Option AB  |
| Actor B | none |
{: .grid}

### XX.2.1 AB Option

**TODO: describe this option and the Volume 1 requirements for this option

<a name="required-groupings"> </a>

## XX.3 SMRT Required Actor Groupings

*Describe any requirements for actors in this profile to be grouped
with other actors.*

*This section specifies all REQUIRED Actor Groupings (although
"required" sometimes allows for a selection of one of several). To
SUGGEST other profile groupings or helpful references for other profiles
to consider, use Section XX.6 Cross Profile Considerations. Use Section
X.5 for security profile recommendations.*

An actor from this profile (Column 1) shall implement all of the
required transactions and/or content modules in this profile ***in
addition to*** ***<u>all</u>*** of the requirements for the grouped
actor (Column 2) (Column 3 in alternative 2).

If this is a content profile, and actors from this profile are grouped
with actors from a workflow or transport profile, the Reference column
references any specifications for mapping data from the content module
into data elements from the workflow or transport transactions.

In some cases, required groupings are defined as at least one of an
enumerated set of possible actors; this is designated by merging column
one into a single cell spanning multiple potential grouped actors. Notes
are used to highlight this situation.

Section XX.5 describes some optional groupings that may be of interest
for security considerations and Section XX.6 describes some optional
groupings in other related profiles.

Two alternatives for Table XX.3-1 are presented below.

* If there are no required groupings for any actor in this profile,
    use alternative 1 as a template.
* If an actor in this profile (with no option), has a required
    grouping, use alternative 1.
* If any required grouping is associated with an actor/option
    combination in this profile, use alternative 2.

alternative 1 Table XX.3-1: Profile Name - Required Actor
Groupings

All actors from this profile should be listed in Column 1, even if
none of the actors has a required groupings. If no required grouping
exists, "None" should be indicated in Column 2. If an actor in a content
profile is required to be grouped with an actor in a transport or
workflow profile, it will be listed **with at least one** required
grouping. Do not use "XD\*" as an actor name.

In some cases, required groupings are defined as at least one of an
enumerated set of possible actors; to designate this, create a row for
each potential actor grouping and merge column one to form a single cell
containing the profile actor which should be grouped with at least one
of the actors in the spanned rows. In addition, a note should be
included to explain the enumerated set. See example below showing
Document Consumer needing to be grouped with at least one of XDS.b
Document Consumer, XDR Document Recipient or XDM Portable Media
Importer

The author should pay special consideration to security profiles in
this grouping section. Consideration should be given to Consistent Time
(CT) Client, ATNA Secure Node or Secure Application, as well as other
profiles. For the sake of clarity and completeness, even if this table
begins to become long, a line should be added for each actor for each of
the required grouping for security. Also see the ITI document titled
'Cookbook: Preparing the IHE Profile Security Section' at
<http://ihe.net/Technical_Frameworks/#IT> for a list of suggested IT and
security groupings.

<p id ="tXX.3-1" class="tableTitle"><strong>Table XX.3-1: Actor Groupings</strong></p>

<table border="1" borderspacing="0" style='border: 1px solid black; border-collapse: collapse'>
<thead>
<tr class="header">
<th>this Profile Acronym Actor</th>
<th>Actor(s) to be grouped with</th>
<th>Reference</th>
<th>Content Bindings Reference</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Actor A</td>
<td><p><em>external Domain Acronym or blank</em></p>
<p><em>profile acronym/Actor</em></p>
<p><em>e.g., ITI CT / Time Client</em></p></td>
<td><p><em>TF Reference; typically from Vol 1</em></p>
<p><em>e.g., ITI-TF-1: 7.1</em></p></td>
<td>--</td>
</tr>
<tr class="even">
<td>Actor B</td>
<td>None</td>
<td>--</td>
<td>--</td>
</tr>
<tr class="odd">
<td><p>Actor C</p>
<p><em>In this example, Actor C shall be grouped with all three actors listed in column 2</em></p></td>
<td><p><em>external Domain Acronym or blank</em></p>
<p><em>profile acronym/Actor</em></p></td>
<td>--</td>
<td>See Note 1</td>
</tr>
<tr class="even">
<td></td>
<td><em>external Domain Acronym or blank profile acronym/Actor</em></td>
<td>--</td>
<td>See Note 1</td>
</tr>
<tr class="odd">
<td></td>
<td><p><em>external Domain Acronym or blank</em></p>
<p><em>profile acronym/Actor</em></p></td>
<td>--</td>
<td>See Note 1</td>
</tr>
<tr class="even">
<td><p>Actor D <em>(See note 1)</em></p>
<p><em>In this example, the note is used to indicate that the Actor D shall be grouped with one or more of the two actors of the two actors in column 2.</em></p></td>
<td><p><em>external Domain Acronym or blank</em></p>
<p><em>profile acronym/Actor</em></p></td>
<td>--</td>
<td>See Note 1</td>
</tr>
<tr class="odd">
<td></td>
<td><p><em>external Domain Acronym or blank</em></p>
<p><em>profile acronym/Actor</em></p></td>
<td>--</td>
<td>See Note 1</td>
</tr>
<tr class="even">
<td><p>Actor E</p>
<p><em>In rare cases, the actor to be grouped with must implement an option. An example is in column 2.)</em></p></td>
<td><p><em>external Domain Acronym or blank</em></p>
<p><em>profile acronym Actor</em></p>
<p><em>e.g., ITI RFD Form Filler with the Archive Form Option</em></p></td>
<td><p><em>TF Reference to the Option definition; typically from Vol 1</em></p>
<p><em>(e.g., ITI TF-1: 17.3.11)</em></p></td>
<td></td>
</tr>
<tr class="odd">
<td><em>e.g., Content Consumer (See Note 1)</em></td>
<td><em>ITI XDS.b / Document Consumer</em></td>
<td><em>ITI TF-1: 10.1</em></td>
<td><em>PCC TF-2:4.1 (See Note 2)</em></td>
</tr>
<tr class="even">
<td></td>
<td><em>ITI XDR / Document Recipient</em></td>
<td><em>ITI TF-1: 15.1</em></td>
<td><em>PCC TF-2:4.1 (See Note 2)</em></td>
</tr>
<tr class="odd">
<td></td>
<td><em>ITI XDM / Portable Media Importer</em></td>
<td><em>ITI TF-1: 16.1</em></td>
<td><em>PCC TF-2:4.1 (See Note 2)</em></td>
</tr>
<tr class="even">
<td><em>e.g., Content Consumer</em></td>
<td><em>ITI CT / Time Client</em></td>
<td><em>ITI TF-1: 7.1</em></td>
<td>--</td>
</tr>
</tbody>
</table>

Note 1: *This is a short note. It may be used to describe situations
where an actor from this profile may be grouped with one of several
other profiles/actors.*

Note 2: *A note could also be used to explain why the grouping is
required, if that is still not clear from the text above.*

alternative 2 Table XX.3-1: this Profile Acronym Profile

* Required Actor Groupings

All actors from this profile should be listed in Column 1. If no
required grouping exists, "None" should be indicated in Column 3.

Guidance on using the "Grouping Condition" column:

* If an actor has no required grouping, Column 2 should contain "--".
    See Actor A below.
* If an actor has a required grouping that is not associated with a
    profile option (i.e., it has no condition), column 2 should contain
    "Required". See Actor B below.
* Sometimes an option requires that an actor in this profile be
    grouped with an actor in another profile. That condition is
    specified in Column 2. See Actor C below.

<p id ="tXX.3-1" class="tableTitle"><strong>Table XX.3-1: Actor Groupings</strong></p>

<table border="1" borderspacing="0" style='border: 1px solid black; border-collapse: collapse'>
<tbody>
<tr class="odd">
<td>this Profile Acronym Actor</td>
<td>Grouping Condition</td>
<td>Actor(s) to be grouped with</td>
<td>Reference</td>
</tr>
<tr class="even">
<td>Actor A</td>
<td>--</td>
<td>None</td>
<td>--</td>
</tr>
<tr class="odd">
<td>Actor B</td>
<td>Required</td>
<td><p><em>external Domain Acronym or blank profile acronym/Actor</em></p>
<p><em>e.g., ITI CT / Time Client</em></p></td>
<td><p><em>TF Reference; typically from Vol 1</em></p>
<p><em>(e.g., ITI TF-1: 7.1)</em></p></td>
</tr>
<tr class="even">
<td>Actor C</td>
<td>With the <em>Option name in this profile</em> Option</td>
<td><em>external Domain Acronym or blank profile acronym/Actor</em></td>
<td><em>Where the Option is defined in this profile Section XX.3 z</em></td>
</tr>
<tr class="odd">
<td><p>Actor D</p>
<p><em>if an actor has both required and conditional groupings, list the Required grouping first</em></p></td>
<td>Required</td>
<td><em>external Domain Acronym or blank profile acronym/Actor</em></td>
<td><em>TF Reference; typically from Vol 1</em></td>
</tr>
<tr class="even">
<td></td>
<td>If the <em>Option name in this profile</em> Option is supported.</td>
<td><em>external Domain Acronym or blank profile acronym/Actor</em></td>
<td><em>TF Reference; typically from Vol 1</em></td>
</tr>
<tr class="odd">
<td></td>
<td>If the <em>other Option name in this profile</em> Option is supported.</td>
<td><em>external Domain Acronym or blank profile acronym/Actor</em></td>
<td><em>TF Reference; typically from Vol 1</em></td>
</tr>
<tr class="even">
<td><p>Actor E</p>
<p><em>(In rare cases, the actor to be grouped with must implement an option, an example is in column 3)</em></p></td>
<td>Required</td>
<td><p><em>external Domain Acronym or blank profile acronym/Actor</em> with the <em>option name</em></p>
<p><em>e.g. ITI RFD Form Filler with the Archive Form Option</em></p></td>
<td><p><em>TF Reference to the Option definition; typically from Vol 1</em></p>
<p><em>(eg ITI TF-1:17.3.11)</em></p></td>
</tr>
</tbody>
</table>

<a name="overview"> </a>

## XX.4 Shared Managament of Radiation Treatments Overview

The Shared Managament of Radiation Treatments (SMRT) Profile [pronounced 'smart'] defines the
transactions and content specifications necessary to connect any device-specific Treatment
Management System (TMS) with a single departmental Radiation Oncology Information System (ROIS).

### XX.4.1 Concepts

The SMRT profile operates within the broader context of a radiation oncology treatment center.
It is expected that the Radiation Oncology Information System (ROIS) functions as the central
management platform for oncology workflows, but it may rely on other systems such as a Hospital 
Information System (HIS) or a Radiology Information System (RIS) when the department is integrated
within a hospital.

- **Patient Registration**: It is assumed that the ROIS actor has previously registered the patient
and created the clinical encounter (utilizing the registration pathways described in Section XX.1.1.1)
prior to initiating any SMRT transactions. SMRT transactions then synchronize this pre-existing
demographic and encounter baseline down to the specialized TMS actor.

### XX.4.2 Use Cases

#### XX.4.2.1 Use Case \#1: Shared Management of Treatment

This use case describes how clinical staff can use a single departmental Radiation Oncology
Information System (ROIS) to schedule, review, and track the treatment progress of a therapy
session conducted on a standalone treatment device.

##### XX.4.2.1.1 Shared Management of Treatment Use Case Description

to establish a clinically acceptable integration workflow between a standalone treatment device
and a departmental ROIS. This baseline workflow focuses on the exchange of patient demographics,
scheduling, and treatment-related artifacts. More advanced interactions, such as the direct
exchange of prescription information, are considered optional extensions.

The formal behavioral requirements and core responsibilities for the ROIS and TMS actors are detailed in Section XX.1.1.1 and Section XX.1.1.2 respectively. In this use case, the departmental ROIS manages the overall patient clinical journey, while the specialized TMS manages treatment planning and delivery, feeding status updates and treatment-related artifacts back to the ROIS to maintain a centralized patient record.

##### XX.4.2.1.2 Shared Management of Treatment Process Flow

<figure>
{% include usecase1-processflow.svg %}
<figcaption><strong>XX.4.2.2-1: Basic Process Flow in SMRT Profile</strong></figcaption>
</figure>
<br clear="all"/>

The process flow for this use case is initiated by the departmental ROIS, which is the central
point of management for the patient's entire treatment journey.
Patient Registration:
- When a patient is registered in the ROIS, the ROIS sends the patient demographics to the TMS.
- The ROIS sends the patient encounter information to the TMS.
- The ROIS sends the patient photo to the TMS either by value in a FHIR message, or by reference
in a FHIR message for subsequent retrieval from the ROIS.
- When a series of apppointments are scheduled for the treatment fractions in the ROIS, the ROIS
sends all scheduled appointments to the TMS.
- At any point during the workflow,
    - if the patient demographics or appointments are modified, the ROIS updates the demographics
    or appointments in the TMS.
    - if the patient identitifier is changed, the ROIS notifies the TMS of the change. 
    
Treatment Planning:
- When a plan is imported and approved in the TMS, the plan is enriched in the TMS.
- The TMS sends, to the ROIS, information about all treatment planning artifacts which are ready
for retrieval. 
- The ROIS retrieves, from the OST, the artifacts (e.g., RT Plan) which are required for treatment
progress tracking.

Treatment Approval:
- When the plan is approved for delivery in the ROIS, the ROIS sends the approval to the TMS.
- The TMS adds the approval to the plan.
- The TMS then sends, to the ROIS, information about all treatment delivery artifacts which are
ready for retrieval.
- The ROIS retrieves, from the OST, the artifacts (e.g., RT Plan) which are required for treatment
progress tracking.

Treatment Delivery:
- When a patient is checked-in for a scheduled appointment, either at the ROIS or at the TMS,
the ROIS or the TMS notifies the TMS or the ROIS that treatment session delivery is ready to be
managed by the TMS.
- When the treatment session is complete or canceled, the TMS sends, to the ROIS, information
about all treatment artifacts which are ready for retrieval. 
- The ROIS retrieves, from the OST, the artifacts (e.g., RT Record) which are required for
treatment progress tracking.


<a name="security-considerations"> </a>

#### XX.4.2.2 Use Case \#2: Regular Treatment

One or two sentence simple description of this particular use
case.

Note that Section XX.4.2.1 repeats in its entirety for additional use
cases (replicate as Section XX.4.2.2, XX.4.2.3, etc.).

##### XX.4.2.2.1 simple name Use Case Description

Describe the key use cases addressed by the profile. Limit to a
maximum of one page of text or consider an appendix.

##### XX.4.2.2.2 simple name Process Flow

Diagram and describe the process flow(s) covered by this profile in
order to satisfy the use cases. Demonstrate how the profile transactions
are combined/sequenced. To provide context and demonstrate how the
profile interacts with other profiles, feel free to include transactions
and events that are "external" to this profile (using appropriate
notation.)

The set of process flows will typically be exemplary, not exhaustive
(i.e., it will address all the use cases, but will not show all possible
combinations of actors, or all possible sequencing of transactions).

If there are detailed behavioral rules that apply to a specific process
flow or multiple process flows, an appendix may be added as needed.

The roles at the top of the swimlane diagram should correspond to
actor names, include the profile acronym:actor name if referencing an
actor from a different profile.

Modify the following "Swimlane Diagram". You can use plantuml or mermaid. see details on [using mermaid in the IG publisher](https://build.fhir.org/ig/FHIR/ig-guidance/diagrams-mermaid.html). Mermaid [user guide online](https://mermaid.js.org/intro/getting-started.html).  Plantuml seems more stable, and does support clickable links on artifacts. Goto [plantuml.com](http://plantuml.com) for an online tool to draft plantuml files.

<figure>
{% include usecase2-processflow.svg %}
<figcaption><strong>XX.4.2.2-1: Basic Process Flow in SMRT Profile</strong></figcaption>
</figure>
<br clear="all"/>

If process flow "swimlane" diagrams require additional explanation
to clarify conditional flows, or flow variations need to be described
where alternate systems may be playing different actor roles, document
those conditional flows here.

Delete the material below if this is a workflow or transport
profile. Delete the material above if this profile is a content module
only profile.

**Pre-conditions**:

Very briefly (typically one sentence) describe the conditions or
timing when this content module would be used.

**Main Flow**:

Typically in an enumerated list, describe the clinical workflow
when, where, and how this content module would be used.

**Post-conditions:**

Very briefly (typically one sentence) describe the state of the
clinical scenario after this content module has been created including
examples of potential next steps.


## XX.5 ToDo Security Considerations

See ITI TF-2x: [Appendix Z.8 "Mobile Security Considerations"](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.8-mobile-security-considerations)

The following is instructions to the editor and this text is not to be included in a publication.
The material initially from [RFC 3552 "Security Considerations Guidelines" July 2003](https://tools.ietf.org/html/rfc3552).

This section should address downstream design considerations, specifically for: Privacy, Security, and Safety. These might need to be individual header sections if they are significant or need to be referenced.

The editor needs to understand Security and Privacy fundamentals.
General [Security and Privacy guidance]({{site.data.fhir.path}}secpriv-module.html) is provided in the FHIR Specification. 
The FHIR core specification should be leveraged where possible to inform the reader of your specification.

IHE FHIR based profiles should reference the [ITI Appendix Z](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html) section 8 Mobile Security and Privacy Considerations base when appropriate.

IHE Document Content profiles can reference the security and privacy provided by the Document Sharing infrastructure as directly grouped or possibly to be grouped.

   While it is not a requirement that any given specification or system be
   immune to all forms of attack, it is still necessary for authors of specifications to
   consider as many forms as possible.  Part of the purpose of the
   Security and Privacy Considerations section is to explain what attacks have been
   considered and what countermeasures can be applied to defend against them.

   There should be a clear description of the kinds of threats on the
   described specification.  This should be approached as an
   effort to perform "due diligence" in describing all known or
   foreseeable risks and threats to potential implementers and users.

Authors MUST describe:

* which attacks have been considered and addressed in the specification
* which attacks have been considered but not addressed in the specification
* what could be done in system design, system deployment, or user training

   At least the following forms of attack MUST be considered:
   eavesdropping, replay, message insertion, deletion, modification, and
   man-in-the-middle.  Potential denial of service attacks MUST be
   identified as well.  If the specification incorporates cryptographic
   protection mechanisms, it should be clearly indicated which portions
   of the data are protected and what the protections are (i.e.,
   integrity only, confidentiality, and/or endpoint authentication,
   etc.).  Some indication should also be given to what sorts of attacks
   the cryptographic protection is susceptible.  Data which should be
   held secret (keying material, random seeds, etc.) should be clearly
   labeled.

   If the specification involves authentication, particularly user-host
   authentication, the security of the authentication method MUST be
   clearly specified.  That is, authors MUST document the assumptions
   that the security of this authentication method is predicated upon.

   The threat environment addressed by the Security and Privacy Considerations
   section MUST at a minimum include deployment across the global
   Internet across multiple administrative boundaries without assuming
   that firewalls are in place, even if only to provide justification
   for why such consideration is out of scope for the protocol.  It is
   not acceptable to only discuss threats applicable to LANs and ignore
   the broader threat environment.  In
   some cases, there might be an Applicability Statement discouraging
   use of a technology or protocol in a particular environment.
   Nonetheless, the security issues of broader deployment should be
   discussed in the document.

   There should be a clear description of the residual risk to the user
   or operator of that specification after threat mitigation has been
   deployed.  Such risks might arise from compromise in a related
   specification (e.g., IPsec is useless if key management has been
   compromised), from incorrect implementation, compromise of the
   security technology used for risk reduction (e.g., a cipher with a
   40-bit key), or there might be risks that are not addressed by the
   specification (e.g., denial of service attacks on an
   underlying link protocol).  Particular care should be taken in
   situations where the compromise of a single system would compromise
   an entire protocol.  For instance, in general specification designers
   assume that end-systems are inviolate and don't worry about physical
   attack.  However, in cases (such as a certificate authority) where
   compromise of a single system could lead to widespread compromises,
   it is appropriate to consider systems and physical security as well.

   There should also be some discussion of potential security risks
   arising from potential misapplications of the specification or technology
   described in the specification.  
  
This section also include specific considerations regarding Digital Signatures, Provenance, Audit Logging, and De-Identification.

Where audit logging is specified, a StructureDefinition profile(s) should be included, and Examples of those logs might be included.

<a name="other-grouping"> </a>

## XX.6 ToDo Cross-Profile Considerations

This section is informative, not normative. It is intended to put
this profile in context with other profiles. Any required groupings
should have already been described above. Brief descriptions can go
directly into this section; lengthy descriptions should go into an
appendix. Examples of this material include ITI Cross Community Access
(XCA) Grouping Rules (Section 18.2.3), the Radiology associated profiles
listed at wiki.ihe.net, or ITI Volume 1 Appendix E "Cross Profile
Considerations", and the "See Also" sections Radiology Profile
descriptions on the wiki such as
<http://wiki.ihe.net/index.php/Scheduled_Workflow#See_Also>. If this
section is left blank, add "Not applicable."

Consider using a format such as the following:

other profile acronym - other profile name

A other profile actor name in other profile name might
be grouped with a this profile actor name to describe
benefit/what is accomplished by grouping.
