This section corresponds to transaction [RO-SMRT-01] of the IHE-RO Technical Framework. Transaction [RO-SMRT-01] is used by the ROIS to send the patient photo to the TMS.

> **Editor's Note (provisional):** This transaction is in development. The transaction identifier and section number are provisional pending assignment by the IHE-RO Technical Committee. The FHIR message structure will be authored in a subsequent revision. See the [Open Issues](issues.html).

### Scope

This transaction is used by the ROIS to send the patient photo (patient ID photo) to the TMS in a FHIR message, so that the TMS can display the photo for patient verification at the treatment device. The photo may be conveyed either **by value** (a Base64-encoded image, e.g., JPEG/PNG/TIFF/BMP) or **by reference** to a DICOM Secondary Capture (SC) image that the TMS subsequently retrieves via DICOM.

Patient demographics and encounters are synchronized separately by grouping with IHE-ITI Patient Administration Management ([ITI-30] / [ITI-31]); see [Volume 1, Table X.1-2](volume-1.html#actors-and-transactions).

### Actors Roles

<p id ="t3.Y1.2-1" class="tableTitle"><strong>Table 2:3.Y1.2-1: Actor Roles</strong></p>

| Role      | Description                          | Actor(s)                                          |
|-----------|--------------------------------------|---------------------------------------------------|
| Initiator | Sends the patient photo              | [ROIS](volume-1.html#radiation-oncology-information-system) |
| Responder | Receives (and may retrieve) the photo | [TMS](volume-1.html#treatment-management-system)  |
{: .grid}

### Referenced Standards

- **FHIR-R4** [HL7 FHIR Release 4.0]({{site.data.fhir.path}}) — FHIR messaging
- **DICOM** Secondary Capture image and retrieval (when sent by reference)

### Interactions

<figure>
{%include RO-SMRT-01-seq.svg%}
<figcaption><strong>Figure 2:3.Y1.4-1: Sync Patient Photo Interaction Diagram</strong></figcaption>
</figure>
<br clear="all"/>

#### Sync Patient Photo Message

##### Trigger Events

A patient is assigned to the TMS, or the patient photo is added or updated in the ROIS.

##### Message Semantics

*To be specified.* The FHIR message conveys the patient photo either by value (Base64-encoded image) or by reference to a DICOM SC image. See content definitions in [Volume 3](domain-ZZ.html).

##### Expected Actions

The Responder (TMS) stores the patient photo, retrieving it via DICOM when it was sent by reference, and associates it with the corresponding patient for verification at the treatment device.

### Security Considerations

See [SMRT Security Considerations](volume-1.html#security-considerations).
