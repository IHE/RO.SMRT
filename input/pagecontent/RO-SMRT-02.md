This section corresponds to transaction [RO-YY] of the IHE-RO Technical Framework.

### Scope

The TMS notifies the ROIS that a coherent set of planning artifacts for a treatment course is available for retrieval and/or processing.

### Actors Roles

The roles in this transaction are defined in the following table and may be played by the actors shown here:

<p id ="t3.YY.2-1" class="tableTitle"><strong>Table 2:3.YY.2-1: Actor Roles</strong></p>

| Role      | Description                                                      | Actor(s)          |
|-----------|------------------------------------------------------------------|-------------------|
| Sender    | Report that planning artifacts are ready for retrieval           | [TMS](volume-1.html#treatment-management-system) |
| Receiver  |  TODO                                                            | [ROIS](volume-1.html#radiation-oncology-information-system) |
{: .grid}

### Referenced Standards

- **FHIR-R4** [HL7 FHIR Release 4.0]({{site.data.fhir.path}})
- **FHIR-R4 Messaging** 
- **FHIR-R4 MessageHeader Resource** 
- **FHIR-R4 ImagingStudy Resource** 
- **DICOM PS3.3** 

### Interactions

<figure>
{%include RO-SMRT-02-seq.svg%}
<figcaption><strong>Figure X.X.X.X-X: Report Planning Artifacts Ready Interaction Diagram</strong></figcaption>
</figure>
<br clear="all"/>

#### Report Planning Artifacts Ready Message

##### Trigger Events

The TMS issues this transaction when a set of planning artifacts becomes available for downstream use.

##### Message Semantics

The TMS sends a FHIR Message Bundle to notify the ROIS that planning artifacts are available.

The Message Bundle:
* SHALL have Bundle.type = message
* SHALL contain a MessageHeader resource as the first entry
* SHALL contain an event code identifying the planning event
* SHALL contain references to one or more planning artifacts

The Message Bundle SHALL conform to [Notifications Bundle Profile].
The MessageHeader SHALL conform to [Report Planning Artifacts Ready MessageHeader Profile]


The MessageHeader.focus array shall reference the primary planning artifacts associated with the event.
When no single focal artifact exists, multiple resources may be included within the focus array.

Each ImagingStudy resource shall represent one or more DICOM SOP Instances associated with the planning artifacts.

<figure>
{%include planning-artifact-ready-notification.svg%}
<figcaption><strong>Figure X.X.X.X-X: Report Planning Artifacts Ready Message Graph</strong></figcaption>
</figure>
<br clear="all"/>


##### Expected Actions

Upon receipt of the message:
* The ROIS SHALL validate the message bundle.
* The ROIS SHALL determine the planning event from the MessageHeader event code.
* The ROIS SHALL identify the referenced planning artifacts.
* The ROIS MAY retrieve the DICOM objects referenced by the ImagingStudy resources.
* The ROIS MAY update its internal workflow state according to local policy.

### Protocol Requirements

The Sender shall invoke:
`POST [base]/$process-message

### Security Considerations

See [SMRT Security Considerations](volume-1.html#security-considerations)

#### Security Audit Considerations

''TODO: The security audit criteria ''

##### Client Audit

When grouped with ATNA Secure Application or Secure Node the Actor shall be able to record... 

''TODO: the specifics, leveraging BALP''

##### Server Audit

When grouped with ATNA Secure Application or Secure Node the Actor shall be able to record... 

''TODO: the specifics, leveraging BALP''

{% include link-list.md %}