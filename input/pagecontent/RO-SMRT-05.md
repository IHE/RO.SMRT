This section corresponds to transaction [RO-SMRT-05] of the IHE-RO Technical Framework. Transaction [RO-SMRT-05] is used by the TMS to report image review results to the ROIS.

> **Editor's Note (provisional):** This transaction is in development. The transaction identifier and section number are provisional pending assignment by the IHE-RO Technical Committee. The FHIR message structure will be authored in a subsequent revision. See the [Open Issues](issues.html).

### Scope

This transaction is used to convey image review results. When image review (e.g., online image review / image approval) is performed at the TMS, the TMS reports the results to the ROIS in a FHIR message. (When image review is performed at the ROIS, no exchange is required.)

### Actors Roles

<p id ="t3.Y5.2-1" class="tableTitle"><strong>Table 2:3.Y5.2-1: Actor Roles</strong></p>

| Role      | Description                          | Actor(s)                                          |
|-----------|--------------------------------------|---------------------------------------------------|
| Initiator | Reports the image review results     | [TMS](volume-1.html#treatment-management-system)  |
| Responder | Receives the image review results    | [ROIS](volume-1.html#radiation-oncology-information-system) |
{: .grid}

### Referenced Standards

- **FHIR-R4** [HL7 FHIR Release 4.0]({{site.data.fhir.path}}) — FHIR messaging

### Interactions

<figure>
{%include RO-SMRT-05-seq.svg%}
<figcaption><strong>Figure 2:3.Y5.4-1: Report Image Review Results Interaction Diagram</strong></figcaption>
</figure>
<br clear="all"/>

#### Report Image Review Results Message

##### Trigger Events

Image review is performed at the TMS.

##### Message Semantics

*To be specified.* The FHIR message conveys the image review results and references the relevant image(s).

##### Expected Actions

The Responder (ROIS) records the image review results as part of the patient's treatment course record.

### Security Considerations

See [SMRT Security Considerations](volume-1.html#security-considerations).
