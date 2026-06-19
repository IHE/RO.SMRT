This section corresponds to transaction [RO-SMRT-02] of the IHE-RO Technical Framework. Transaction [RO-SMRT-02] is used by the TMS to report to the ROIS that treatment planning artifacts are ready for retrieval.

> **Editor's Note (provisional):** This transaction is in development. The transaction identifier and section number are provisional pending assignment by the IHE-RO Technical Committee. The FHIR message structure and its references to DICOM RT objects will be authored in a subsequent revision. See the [Open Issues](issues.html).

### Scope

This transaction is used by the TMS to notify the ROIS that treatment planning artifacts are available for retrieval. The notification is conveyed in a FHIR message that references the relevant DICOM RT objects; the main object is the RT Plan (RTP), and other objects (e.g., CT, RT Structure Set, RT Dose) may be derived from it or explicitly included. The ROIS decides which objects it needs and retrieves them from the object store (OST) using established DICOM transactions (C-MOVE/C-GET/QIDO-RS/WADO-RS).

This transaction is also used following treatment approval to report that the **final delivery plan** is ready for retrieval.

### Actors Roles

<p id ="t3.Y2.2-1" class="tableTitle"><strong>Table 2:3.Y2.2-1: Actor Roles</strong></p>

| Role      | Description                                              | Actor(s)                                          |
|-----------|----------------------------------------------------------|---------------------------------------------------|
| Initiator | Reports that planning artifacts are ready for retrieval  | [TMS](volume-1.html#treatment-management-system)  |
| Responder | Receives the notification and may retrieve the artifacts | [ROIS](volume-1.html#radiation-oncology-information-system) |
{: .grid}

### Referenced Standards

- **FHIR-R4** [HL7 FHIR Release 4.0]({{site.data.fhir.path}}) — FHIR messaging
- **DICOM** RT objects and retrieval (C-MOVE/C-GET/QIDO-RS/WADO-RS)

### Interactions

<figure>
{%include RO-SMRT-02-seq.svg%}
<figcaption><strong>Figure 2:3.Y2.4-1: Report Planning Artifacts Interaction Diagram</strong></figcaption>
</figure>
<br clear="all"/>

#### Report Planning Artifacts Message

##### Trigger Events

A plan is imported, approved, and enriched in the TMS (planning artifacts ready), or the final delivery plan becomes available following treatment approval.

##### Message Semantics

*To be specified.* The FHIR message conveys the set of available planning artifacts and references the corresponding DICOM RT objects (principally the RT Plan). See content definitions in [Volume 3](domain-ZZ.html).

##### Expected Actions

The Responder (ROIS) receives the notification and may retrieve the artifacts (e.g., RT Plan) required for treatment progress tracking, optionally serving as the long-term archive for retrieved data.

### Security Considerations

See [SMRT Security Considerations](volume-1.html#security-considerations).
