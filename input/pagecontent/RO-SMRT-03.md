This section corresponds to transaction [RO-SMRT-03] of the IHE-RO Technical Framework. Transaction [RO-SMRT-03] is used by the ROIS to report the treatment approval to the TMS.

> **Editor's Note (provisional):** This transaction is in development. The transaction identifier and section number are provisional pending assignment by the IHE-RO Technical Committee. The FHIR message structure will be authored in a subsequent revision. See the [Open Issues](issues.html).

### Scope

This transaction is used by the ROIS, once a treatment has been approved for delivery, to communicate that approval to the TMS in a FHIR message. The ROIS serves as the gatekeeper for proceeding with treatment delivery; the TMS adds the approval to the plan.

### Actors Roles

<p id ="t3.Y3.2-1" class="tableTitle"><strong>Table 2:3.Y3.2-1: Actor Roles</strong></p>

| Role      | Description                               | Actor(s)                                          |
|-----------|-------------------------------------------|---------------------------------------------------|
| Initiator | Sends the treatment approval              | [ROIS](volume-1.html#radiation-oncology-information-system) |
| Responder | Receives the approval and adds it to plan | [TMS](volume-1.html#treatment-management-system)  |
{: .grid}

### Referenced Standards

- **FHIR-R4** [HL7 FHIR Release 4.0]({{site.data.fhir.path}}) — FHIR messaging

### Interactions

<figure>
{%include RO-SMRT-03-seq.svg%}
<figcaption><strong>Figure 2:3.Y3.4-1: Report Treatment Approval Interaction Diagram</strong></figcaption>
</figure>
<br clear="all"/>

#### Report Treatment Approval Message

##### Trigger Events

The treatment is approved for delivery in the ROIS.

##### Message Semantics

*To be specified.* The FHIR message conveys the treatment approval.

##### Expected Actions

The Responder (TMS) records the approval and adds it to the plan, enabling treatment delivery to proceed.

### Security Considerations

See [SMRT Security Considerations](volume-1.html#security-considerations).
